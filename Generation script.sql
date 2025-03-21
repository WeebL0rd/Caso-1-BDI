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

-- call llenarDireccionesPorUsuario();
-- call llenarNombres();
-- call llenarDirecciones();


DELIMITER //
CREATE PROCEDURE llenar()
BEGIN

END //
DELIMITER ;


