# Entregable # 2

## Integrantes y carnés:
Efraim Cuevas Aguilar 2024109746

José Julián Monge Brenes 2024247024

## Links 

[Script de la creación de la base de datos](Creation%20script.sql)

[Script de llenado de datos](Generatio%20script.sql)

[Script de queries](Query%script.sql)

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
|Juan Torres     |JuanTorres12@gmail.com     |Brasil          |481800.84000|
|Carlos Ramírez  |CarlosRamírez32@gmail.com  |Estados Unidos  |417899.88000|
|José Sánchez    |JoséSánchez31@gmail.com    |Perú            |373669.08000|
|Pedro Ramírez   |PedroRamírez7@gmail.com    |España          |368754.00000|
|Ana Sánchez     |AnaSánchez25@gmail.com     |Brasil          |363838.92000|
|María López     |MaríaLópez18@gmail.com     |Estados Unidos  |358859.88000|
|Carlos Torres   |CarlosTorres36@gmail.com   |Perú            |353944.80000|
|Carlos Pérez    |CarlosPérez15@gmail.com    |Brasil          |319549.08000|
|Carlos Torres   |CarlosTorres37@gmail.com   |Argentina       |309654.96000|
|Miguel García   |MiguelGarcía20@gmail.com   |España          |304794.00000|
|Laura Martínez  |LauraMartínez1@gmail.com   |Costa Rica      |295022.88000|
|José Torres     |JoséTorres8@gmail.com      |Brasil          |294963.84000|
|Pedro Gómez     |PedroGómez35@gmail.com     |Costa Rica      |260622.24000|
|Juan Gómez      |JuanGómez3@gmail.com       |Argentina       |250674.00000|
|Carlos Pérez    |CarlosPérez22@gmail.com    |Brasil          |236041.92000|
|Miguel Gómez    |MiguelGómez13@gmail.com    |Argentina       |236041.92000|
|Laura Ramírez   |LauraRamírez6@gmail.com    |Perú            |196667.16000|
|Carlos Rodríguez|CarlosRodríguez29@gmail.com|Argentina       |191693.04000|
|María Gómez     |MaríaGómez4@gmail.com      |Argentina       |186777.96000|
|Ana López       |AnaLópez23@gmail.com       |Argentina       |186773.04000|
|María Sánchez   |MaríaSánchez19@gmail.com   |Costa Rica      |181917.00000|
|Ana Ramírez     |AnaRamírez38@gmail.com     |Estados Unidos  |137691.12000|
|Laura Torres    |LauraTorres17@gmail.com    |Costa Rica      |137627.16000|
|Miguel Pérez    |MiguelPérez14@gmail.com    |Argentina       |132707.16000|
|Miguel Gómez    |MiguelGómez5@gmail.com     |Costa Rica      |122936.04000|
|Luis Ramírez    |LuisRamírez26@gmail.com    |Brasil          |122936.04000|
|Carlos Gómez    |CarlosGómez16@gmail.com    |Argentina       |122877.00000|
|Ana Pérez       |AnaPérez27@gmail.com       |Argentina       |118020.96000|
|Luis López      |LuisLópez30@gmail.com      |Costa Rica      |93401.28000 |
|Laura Martínez  |LauraMartínez9@gmail.com   |Estados Unidos  |78651.12000 |
|Luis López      |LuisLópez39@gmail.com      |Argentina       |73731.12000 |
|Juan López      |JuanLópez24@gmail.com      |España          |68816.04000 |
|Juan Rodríguez  |JuanRodríguez28@gmail.com  |Estados Unidos  |68811.12000 |
|María Ramírez   |MaríaRamírez34@gmail.com   |Argentina       |63896.04000 |
|Juan Torres     |JuanTorres10@gmail.com     |Brasil          |63896.04000 |
|Carlos Hernández|CarlosHernández11@gmail.com|Costa Rica      |63896.04000 |
|Ana Torres      |AnaTorres40@gmail.com      |Argentina       |58980.96000 |
|Juan Sánchez    |JuanSánchez2@gmail.com     |España          |58980.96000 |
|Miguel Ramírez  |MiguelRamírez33@gmail.com  |Estados Unidos  |24585.24000 |
|Miguel Pérez    |MiguelPérez21@gmail.com    |Perú            |9835.08000  |


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
|Pedro Gómez     |PedroGómez35@gmail.com     |1             |2025-02-24  |
|Miguel García   |MiguelGarcía20@gmail.com   |1             |2025-02-24  |
|Laura Martínez  |LauraMartínez1@gmail.com   |2             |2025-02-25  |
|Miguel Pérez    |MiguelPérez14@gmail.com    |3             |2025-02-26  |
|María López     |MaríaLópez18@gmail.com     |4             |2025-02-27  |
|Carlos Gómez    |CarlosGómez16@gmail.com    |5             |2025-02-28  |
|Ana Ramírez     |AnaRamírez38@gmail.com     |5             |2025-02-28  |
|Miguel Gómez    |MiguelGómez5@gmail.com     |9             |2025-03-01  |
|Miguel Gómez    |MiguelGómez13@gmail.com    |9             |2025-03-01  |
|Ana Torres      |AnaTorres40@gmail.com      |10            |2025-03-02  |
|Carlos Torres   |CarlosTorres36@gmail.com   |10            |2025-03-02  |
|Juan Sánchez    |JuanSánchez2@gmail.com     |11            |2025-03-03  |
|Carlos Hernández|CarlosHernández11@gmail.com|13            |2025-03-05  |
|Carlos Ramírez  |CarlosRamírez32@gmail.com  |13            |2025-03-05  |
|José Sánchez    |JoséSánchez31@gmail.com    |13            |2025-03-05  |
|Pedro Ramírez   |PedroRamírez7@gmail.com    |13            |2025-03-05  |
|Ana Sánchez     |AnaSánchez25@gmail.com     |14            |2025-03-06  |



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
|Miguel Pérez    |12                         |
|Ana López       |10                         |
|Laura Ramírez   |10                         |
|Juan Gómez      |10                         |
|José Torres     |10                         |
|Laura Martínez  |10                         |
|María Sánchez   |9                          |
|Ana Sánchez     |9                          |
|Carlos Torres   |9                          |
|Carlos Rodríguez|9                          |
|Juan López      |9                          |
|Carlos Pérez    |9                          |
|Carlos Hernández|8                          |
|Laura Martínez  |8                          |
|Juan Sánchez    |8                          |


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
|Miguel Gómez    |2                          |
|Ana Pérez       |3                          |
|Carlos Gómez    |3                          |
|Juan Rodríguez  |4                          |
|Ana Ramírez     |4                          |
|Luis Ramírez    |4                          |
|Ana Torres      |5                          |
|Juan Torres     |6                          |
|María Ramírez   |6                          |
|Luis López      |6                          |
|Carlos Ramírez  |6                          |
|José Sánchez    |6                          |
|María Gómez     |6                          |
|Laura Torres    |7                          |
|Miguel Pérez    |7                          |


Análisis donde más está fallando la AI, encontrar los casos, situaciones, interpretaciones, halucinaciones o errores donde el usuario está teniendo más problemas en hacer que la AI determine correctamente lo que se desea hacer, rankeando cada problema de mayor a menor cantidad de ocurrencias entre un rango de fechas (30+ registros)

```
SELECT `description` AS problemas, COUNT(1) AS total_problemas
FROM pay_logs l
WHERE DATEDIFF('2025-01-01', l.postTime) > 0
GROUP BY l.description
ORDER BY total_problemas DESC;
```

|problemas       |total_problemas            |
|----------------|---------------------------|
|Pago rechazado por tarjeta no válida|21                         |
|Usuario eliminado del sistema|19                         |
|User logueado   |18                         |
|Creación de pago recurrente exitosa|17                         |
|Error al procesar pago|17                         |
|Cambio de configuración de usuario guardado|15                         |
|Intento fallido de inicio de sesión|14                         |
|Pago de factura completado|14                         |
|Usuario actualizado correctamente|14                         |
|Nuevo método de pago agregado|11                         |
|Fallo por inclusión de caracteres no válidos en el nombre|6                          |
|Fallo por sobrecarga en el volumen del audio|6                          |
|Fallo por confusión entre fechas escritas con distintos formatos|5                          |
|Fallo por conversión errónea de moneda|4                          |
|Fallo de interpretación por pronunciación ambigua|4                          |
|Fallo por interferencia de otros sonidos (música, claxon, etc.)|4                          |
|Fallo por voz entrecortada debido a mala calidad del micrófono|4                          |
|Fallo por error en la interpretación de fechas repetitivas|4                          |
|Fallo por confusión entre meses con nombres similares|3                          |
|Fallo por ruido de fondo demasiado alto|3                          |
|Fallo por omisión de un número en la transcripción|2                          |
|Fallo por confusión con apellidos|2                          |
|Fallo por error en la conversión de fechas habladas a texto|2                          |
|Fallo por pérdida de datos en la transcripción|2                          |
|Fallo por error en la separación de palabras|2                          |
|Fallo por distorsión del audio en la compresión|2                          |
|Fallo de interpretación de voz demasiado baja|2                          |
|Fallo por interpretación errónea de un nombre común|2                          |
|Fallo por interpretación errónea de una fecha en palabras|2                          |
|Fallo por método de pago inexistente o no soportado|2                          |
|Fallo por no detección de la plataforma de pago correcta|1                          |
|Fallo por error en la transcripción de montos decimales|1                          |
|Fallo por cortes en la grabación de voz|1                          |
|Fallo por fallo en la normalización del audio antes de la interpretación|1                          |
|Fallo por nombre dividido en dos partes por error|1                          |
|Fallo por detección de datos financieros incorrectos|1                          |
|Fallo por confusión entre nombres similares|1                          |
|Fallo por separadores de miles mal reconocidos|1                          |
|Fallo por eco en el audio que distorsiona palabras|1                          |
|Fallo por cifras numéricas mal interpretadas|1                          |
|Fallo por omisión del banco asociado al método de pago|1                          |
|Fallo por error en la interpretación del número de cuenta|1                          |



