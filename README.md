# Entregable # 2

## Integrantes y carnés:
Efraim Cuevas Aguilar 2024109746

José Julián Monge Brenes 2024247024

## Links 

[Script de la creación de la base de datos](Creation%20script.sql)

[Script de llenado de datos](Generation%20script.sql)

[Script de queries](Query%Script.sql)

## Queries

Listar todos los usuarios de la plataforma que esten activos con su nombre completo, email, país de procedencia, y el total de cuánto han pagado en subscripciones desde el 2024 hasta el día de hoy, dicho monto debe ser en colones (20+ registros)

```
SELECT CONCAT(u.first_name, ' ', u.last_name) AS nombre_completo, u.email, c.`name` AS pais_procedencia, 
		(SUM(
			CASE
				WHEN upp.schedule_id = 1 THEN pp.amount
				ELSE pp.amount * 12
			END) * ec.exchange_rate) AS total_pagado
FROM pay_users u
INNER JOIN pay_users_adresses au ON u.user_id = au.user_id
INNER JOIN pay_addresses a ON au.address_id = a.address_id
INNER JOIN pay_city ci ON a.city_id = ci.city_id
INNER JOIN pay_states s ON ci.state_id = s.state_id
INNER JOIN pay_countries c ON s.country_id = c.country_id
INNER JOIN pay_users_plan_prices upp ON u.user_id = upp.user_id
INNER JOIN pay_plan_prices pp ON upp.plan_prices_id = pp.plan_prices_id
INNER JOIN pay_exchange_currencies ec ON pp.currency_id = ec.source_id AND ec.destiny_id = 1
WHERE u.enabled = 1 AND upp.adquision >= '2024-01-01'  -- Filtramos desde el 1 de enero de 2024
GROUP BY u.user_id, u.first_name, u.last_name, u.email, c.`name`,ec.exchange_rate
ORDER BY total_pagado DESC;
```


|nombre_completo |email                      |pais_procedencia|total_pagado|
|----------------|---------------------------|----------------|------------|
|José García     |JoséGarcía31@gmail.com     |Costa Rica      |531005.76000|
|Sofía Ramírez   |SofíaRamírez23@gmail.com   |Argentina       |472024.80000|
|Ana López       |AnaLópez8@gmail.com        |Costa Rica      |417899.88000|
|Pedro Pérez     |PedroPérez1@gmail.com      |Argentina       |363834.00000|
|Laura Ramírez   |LauraRamírez17@gmail.com   |Estados Unidos  |309773.04000|
|Miguel Torres   |MiguelTorres38@gmail.com   |España          |304798.92000|
|Juan López      |JuanLópez12@gmail.com      |Perú            |304794.00000|
|Miguel Ramírez  |MiguelRamírez28@gmail.com  |Argentina       |299937.96000|
|Juan Martínez   |JuanMartínez20@gmail.com   |España          |265483.20000|
|Sofía Sánchez   |SofíaSánchez34@gmail.com   |España          |245813.04000|
|Ana García      |AnaGarcía9@gmail.com       |Perú            |245754.00000|
|Laura Pérez     |LauraPérez13@gmail.com     |Estados Unidos  |240897.96000|
|José Hernández  |JoséHernández26@gmail.com  |Costa Rica      |235923.84000|
|Carlos Hernández|CarlosHernández27@gmail.com|Perú            |235923.84000|
|Laura López     |LauraLópez30@gmail.com     |Estados Unidos  |201528.12000|
|Pedro López     |PedroLópez14@gmail.com     |Costa Rica      |196667.16000|
|Luis Gómez      |LuisGómez24@gmail.com      |Perú            |196662.24000|
|Luis Rodríguez  |LuisRodríguez11@gmail.com  |Estados Unidos  |191747.16000|
|Laura Ramírez   |LauraRamírez37@gmail.com   |Perú            |191747.16000|
|Luis López      |LuisLópez3@gmail.com       |Estados Unidos  |181917.00000|
|Miguel López    |MiguelLópez21@gmail.com    |Argentina       |181917.00000|
|Miguel Torres   |MiguelTorres36@gmail.com   |Estados Unidos  |147526.20000|
|Sofía López     |SofíaLópez10@gmail.com     |Perú            |137691.12000|
|Ana Martínez    |AnaMartínez33@gmail.com    |Estados Unidos  |132712.08000|
|Laura Pérez     |LauraPérez2@gmail.com      |Costa Rica      |127856.04000|
|María Ramírez   |MaríaRamírez29@gmail.com   |Estados Unidos  |127856.04000|
|Ana Hernández   |AnaHernández15@gmail.com   |Estados Unidos  |127797.00000|
|Pedro Sánchez   |PedroSánchez32@gmail.com   |Argentina       |127792.08000|
|Miguel Martínez |MiguelMartínez7@gmail.com  |España          |122877.00000|
|José Rodríguez  |JoséRodríguez39@gmail.com  |Estados Unidos  |88486.20000 |
|Sofía Torres    |SofíaTorres5@gmail.com     |Estados Unidos  |88476.36000 |
|Miguel Gómez    |MiguelGómez18@gmail.com    |Costa Rica      |73731.12000 |
|Pedro Pérez     |PedroPérez16@gmail.com     |Argentina       |73731.12000 |
|Laura Sánchez   |LauraSánchez6@gmail.com    |Costa Rica      |68811.12000 |
|Pedro Ramírez   |PedroRamírez40@gmail.com   |Estados Unidos  |63896.04000 |
|Pedro Pérez     |PedroPérez19@gmail.com     |España          |58980.96000 |
|Miguel Torres   |MiguelTorres4@gmail.com    |Costa Rica      |14750.16000 |
|Juan Martínez   |JuanMartínez22@gmail.com   |Perú            |14745.24000 |
|Juan Pérez      |JuanPérez35@gmail.com      |Perú            |4915.08000  |
|José López      |JoséLópez25@gmail.com      |Estados Unidos  |4915.08000  |


Listar todas las personas con su nombre completo e email, los cuales le queden menos de 15 días para tener que volver a pagar una nueva subscripción

```
SELECT CONCAT(u.first_name, ' ', u.last_name) AS nombre_completo, u.email, DATEDIFF(DATE_ADD(upp.adquision, INTERVAL 1 MONTH), NOW()) AS dias_para_pago, upp.adquision AS ultimo_pago
FROM pay_users u
INNER JOIN  pay_users_plan_prices upp ON u.user_id = upp.user_id
INNER JOIN pay_plan_prices pp ON upp.plan_prices_id = pp.plan_prices_id
INNER JOIN pay_schedules s ON upp.schedule_id = s.schedule_id
WHERE u.enabled = 1 AND DATEDIFF(DATE_ADD(upp.adquision, INTERVAL 1 MONTH), NOW()) < 15 AND DATEDIFF(DATE_ADD(upp.adquision, INTERVAL 1 MONTH), NOW()) > 0
ORDER BY dias_para_pago ASC;
```

|nombre_completo |email                      |dias_para_pago|ultimo_pago |
|----------------|---------------------------|--------------|------------|
|Laura Sánchez   |LauraSánchez6@gmail.com    |2             |2025-02-26  |
|Luis Rodríguez  |LuisRodríguez11@gmail.com  |2             |2025-02-26  |
|Laura Ramírez   |LauraRamírez37@gmail.com   |3             |2025-02-27  |
|Miguel López    |MiguelLópez21@gmail.com    |4             |2025-02-28  |
|Luis López      |LuisLópez3@gmail.com       |4             |2025-02-28  |
|Ana López       |AnaLópez8@gmail.com        |4             |2025-02-28  |
|Miguel Torres   |MiguelTorres38@gmail.com   |4             |2025-02-28  |
|Pedro Pérez     |PedroPérez16@gmail.com     |4             |2025-02-28  |
|Carlos Hernández|CarlosHernández27@gmail.com|4             |2025-02-28  |
|José García     |JoséGarcía31@gmail.com     |4             |2025-02-28  |
|José López      |JoséLópez25@gmail.com      |8             |2025-03-01  |
|Pedro Sánchez   |PedroSánchez32@gmail.com   |8             |2025-03-01  |
|José Hernández  |JoséHernández26@gmail.com  |9             |2025-03-02  |
|Ana García      |AnaGarcía9@gmail.com       |12            |2025-03-05  |
|Juan López      |JuanLópez12@gmail.com      |12            |2025-03-05  |


Listar un ranking del top 15 de usuarios que más uso le dan a la aplicación y el top 15 que menos uso le dan a la aplicación (15 y 15 registros)

Mayor uso

```
SELECT CONCAT(u.first_name, ' ', u.last_name) AS nombre_completo, COUNT(l.referenceId1) AS total_logs
FROM pay_logs l
INNER JOIN pay_users u ON l.referenceId1 = u.user_id
GROUP BY l.referenceId1
ORDER BY total_logs DESC
LIMIT 15;
```

|nombre_completo |total_logs                 |
|----------------|---------------------------|
|Laura Pérez     |14                         |
|Ana García      |12                         |
|Sofía Torres    |12                         |
|Miguel Torres   |11                         |
|Pedro Sánchez   |11                         |
|Miguel Martínez |11                         |
|José Rodríguez  |11                         |
|Ana López       |11                         |
|Ana Hernández   |10                         |
|Laura López     |10                         |
|Sofía López     |10                         |
|Pedro Pérez     |10                         |
|Miguel Torres   |10                         |
|Laura Pérez     |10                         |
|Laura Ramírez   |10                         |



Menor uso

```
SELECT CONCAT(u.first_name, ' ', u.last_name) AS nombre_completo, COUNT(l.referenceId1) AS total_logs
FROM pay_logs l
INNER JOIN pay_users u ON l.referenceId1 = u.user_id
GROUP BY l.referenceId1
ORDER BY total_logs ASC
LIMIT 15;
```

|nombre_completo |total_logs                 |
|----------------|---------------------------|
|Pedro Ramírez   |3                          |
|Miguel Torres   |7                          |
|José López      |7                          |
|Juan Pérez      |7                          |
|Juan Martínez   |7                          |
|Sofía Ramírez   |7                          |
|María Ramírez   |7                          |
|Ana Martínez    |7                          |
|Juan Martínez   |8                          |
|Luis Rodríguez  |8                          |
|Pedro Pérez     |8                          |
|Carlos Hernández|8                          |
|Luis Gómez      |8                          |
|José García     |8                          |
|Miguel Ramírez  |8                          |


Análisis donde más está fallando la AI, encontrar los casos, situaciones, interpretaciones, halucinaciones o errores donde el usuario está teniendo más problemas en hacer que la AI determine correctamente lo que se desea hacer, rankeando cada problema de mayor a menor cantidad de ocurrencias entre un rango de fechas (30+ registros)

```
SELECT `description` AS problemas, COUNT(1) AS total_problemas
FROM pay_logs l
WHERE DATEDIFF('2025-01-01', l.postTime) > 0 AND l.log_types_id = 5
GROUP BY l.description
ORDER BY total_problemas DESC;
```

|problemas       |total_problemas            |
|----------------|---------------------------|
|Fallo por error en la separación de palabras|13                         |
|Fallo por confusión entre fechas escritas con distintos formatos|12                         |
|Fallo por detección de datos financieros incorrectos|10                         |
|Fallo por interpretación errónea de una fecha en palabras|10                         |
|Fallo por confusión entre tarjetas de crédito y débito|10                         |
|Fallo por sobrecarga en el volumen del audio|9                          |
|Fallo por confusión entre nombres similares|9                          |
|Fallo por interpretación errónea de un nombre común|9                          |
|Fallo por ruido de fondo demasiado alto|8                          |
|Fallo por pérdida de datos en la transcripción|8                          |
|Fallo por eco en el audio que distorsiona palabras|8                          |
|Fallo por superposición de voces en el audio|8                          |
|Fallo por fallo en la normalización del audio antes de la interpretación|8                          |
|Fallo por confusión con apellidos|8                          |
|Fallo por error en la transcripción de montos decimales|7                          |
|Fallo por método de pago inexistente o no soportado|7                          |
|Fallo por conversión errónea de moneda|7                          |
|Fallo por confusión entre cantidades y conceptos|7                          |
|Fallo por no detección de la plataforma de pago correcta|6                          |
|Fallo por distorsión del audio en la compresión|6                          |
|Fallo por nombre dividido en dos partes por error|6                          |
|Fallo de interpretación de voz demasiado baja|6                          |
|Fallo por cortes en la grabación de voz|5                          |
|Fallo por confusión entre meses con nombres similares|5                          |
|Fallo por omisión de un número en la transcripción|5                          |
|Fallo por separadores de miles mal reconocidos|5                          |
|Fallo de interpretación por pronunciación ambigua|5                          |
|Fallo por omisión del banco asociado al método de pago|5                          |
|Fallo por interferencia de otros sonidos (música, claxon, etc.)|4                          |
|Fallo por cifras numéricas mal interpretadas|4                          |
|Fallo por error en la interpretación de fechas repetitivas|4                          |
|Fallo por error en la interpretación del número de cuenta|3                          |
|Fallo por inclusión de caracteres no válidos en el nombre|3                          |
|Fallo por error en la conversión de fechas habladas a texto|3                          |




