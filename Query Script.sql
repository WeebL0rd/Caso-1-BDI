USE pay_assistant_db;

-- Query de total pagado en subscripciones de cada usuario
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

-- Query de personas con menos de 15 días para tener que pagar una subscripción
SELECT CONCAT(u.first_name, ' ', u.last_name) AS nombre_completo, u.email, DATEDIFF(DATE_ADD(upp.adquision, INTERVAL 1 MONTH), NOW()) AS dias_para_pago, upp.adquision AS ultimo_pago
FROM pay_users u
INNER JOIN  pay_users_plan_prices upp ON u.user_id = upp.user_id
INNER JOIN pay_plan_prices pp ON upp.plan_prices_id = pp.plan_prices_id
INNER JOIN pay_schedules s ON upp.schedule_id = s.schedule_id
WHERE u.enabled = 1 AND DATEDIFF(DATE_ADD(upp.adquision, INTERVAL 1 MONTH), NOW()) < 15 AND DATEDIFF(DATE_ADD(upp.adquision, INTERVAL 1 MONTH), NOW()) > 0
ORDER BY dias_para_pago ASC;


-- Queries de uso más y menos constante de la aplicación 
SELECT CONCAT(u.first_name, ' ', u.last_name) AS nombre_completo, COUNT(l.referenceId1) AS total_logs
FROM pay_logs l
INNER JOIN pay_users u ON l.referenceId1 = u.user_id
GROUP BY l.referenceId1
ORDER BY total_logs DESC
LIMIT 15;

SELECT CONCAT(u.first_name, ' ', u.last_name) AS nombre_completo, COUNT(l.referenceId1) AS total_logs
FROM pay_logs l
INNER JOIN pay_users u ON l.referenceId1 = u.user_id
GROUP BY l.referenceId1
ORDER BY total_logs ASC
LIMIT 15;

-- Query de problemas que hay en hacer que la AI determine correctamente lo que se desea hacer desde el 1 día del 2025
SELECT `description` AS problemas, COUNT(1) AS total_problemas
FROM pay_logs l
WHERE DATEDIFF('2025-01-01', l.postTime) > 0 AND l.log_types_id = 5
GROUP BY l.description
ORDER BY total_problemas DESC;