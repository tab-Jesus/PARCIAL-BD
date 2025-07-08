USE parcial_db_dilan;

DELIMITER //

CREATE PROCEDURE registrar_usuario (
    IN p_cc VARCHAR(20),
    IN p_nombre VARCHAR(100),
    IN p_correo VARCHAR(100),
    IN p_telefono VARCHAR(20),
    IN p_direccion VARCHAR(150),
    IN p_ciudad VARCHAR(50),
    IN p_tipo_usuario ENUM('cliente', 'admin')
)
BEGIN
    IF EXISTS (SELECT 1 FROM usuario WHERE cc = p_cc OR correo = p_correo) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El usuario ya está registrado con esa cédula o correo';
    ELSE
        INSERT INTO usuario (cc, nombre_completo, correo, telefono, direccion, ciudad, tipo_usuario)
        VALUES (p_cc, p_nombre, p_correo, p_telefono, p_direccion, p_ciudad, p_tipo_usuario);
    END IF;
END //

DELIMITER ;
