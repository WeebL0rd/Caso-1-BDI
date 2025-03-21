use pay_assistant_db;

-- Prodecure para insertar nombres
DELIMITER //
CREATE PROCEDURE llenarNombres()
BEGIN
	DECLARE i INT DEFAULT 1;
    
    WHILE i <= 40 DO
		INSERT INTO pay_users (email, first_name, last_name, password) VALUES (
        CONCAT('correo_', i),
        CONCAT('nombre_', i),
        CONCAT('apellido_', i),
        CONCAT('password_', i)
        );
        
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;

-- Inserción de países, estados y ciudades
INSERT INTO pay_countries (`name`) VALUES 
	('Costa Rica'),
    ('Estados Unidos'),
    ('España');

INSERT INTO pay_states (`name`, country_id) VALUES
	('Cartago', 1),
    ('Alajuela',1),
    ('Florida',2);
    
INSERT INTO pay_city (`name`, state_id) VALUES
	('San Rafael',1),
    ('Taras', 1),
    ('West Palm Beach',2);

-- Procedure para insertar direcciones 
DELIMITER //
CREATE PROCEDURE llenarDirecciones()
BEGIN
	DECLARE i INT DEFAULT 1;
    
    WHILE i <= 40 DO
        INSERT INTO pay_addresses (line1, zipcode, geoposition, city_id) VALUES (
            CONCAT('Calle ', i, ' #', FLOOR(RAND() * 100)), 
            LPAD(FLOOR(RAND() * 99999), 5, '0'), 
            POINT(RAND() * 180 - 90, RAND() * 360 - 180), 
            FLOOR(RAND() * (3 - 1 + 1)) + 1
        );

        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;

-- Procedure para insertar direcciones de usuarios
DELIMITER //
CREATE PROCEDURE llenarDireccionesPorUsuario()
BEGIN
	DECLARE i INT DEFAULT 1;
    
    WHILE i <= 40 DO
        INSERT INTO pay_users_adresses (user_id, address_id) VALUES (i,i);
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;

-- Inserción de currencies
INSERT INTO pay_currencies (`name`, acronym, symbol, country_id) VALUES
	('Colón Costarricense', 'CRC', '₡', 1),
    ('Dólar Estadounidense', 'USD', '$', 2);
    
-- Inserción del exhange rate entre el colón y el dólar
INSERT INTO pay_exchange_currencies (source_id, destiny_id, start_date, exchange_rate)
VALUES (1, 2, '2025-03-21', 492.00);

-- Inserción de la severidad de los logs, sources, y tipos
INSERT INTO pay_logs_severity (`name`) VALUES
	('DEBUG'),
    ('INFO'),
    ('WARNING'),
    ('ERROR');
INSERT INTO pay_log_sources (`name`) VALUES
	('Aplicación'),
    ('Base de datos'),
    ('Usuario'),
    ('Sistema');
INSERT INTO pay_log_types (`name`) VALUES
	('Transaction'),
    ('Error'),
    ('Access'),
    ('Configuration');
    
-- Procedure para llenar logs
DELIMITER //
CREATE PROCEDURE llenarLogs()
BEGIN
	DECLARE i INT DEFAULT 1;
    DECLARE randNum INT DEFAULT 1;
    
    WHILE i <= 100 DO
		-- Hace un número random de usuario al que le va a registrar el log
        SET randNum = FLOOR(RAND() * (40 - 1 + 1)) + 1;
    
		INSERT INTO pay_logs (`description`, postTime, computer, username, trace, `checksum`, log_severity_id, log_types_id, log_sources_id) VALUES (
        'Usuario entró a la app',
        CURDATE(),
        'Dispositivo móvil',
        CONCAT('usuario_', randnum),
        CONCAT('trace_', i),
        '132abcchecksum',
        2, 
        3,
        1
        );
        
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE llenar()
BEGIN

END //
DELIMITER ;

-- call llenarDireccionesPorUsuario();
-- call llenarNombres();
-- call llenarDirecciones();
-- call llenarLogs();

