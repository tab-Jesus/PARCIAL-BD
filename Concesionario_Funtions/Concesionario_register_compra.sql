USE parcial_bd_dilan;

DELIMITER //

CREATE PROCEDURE registrar_compra (
    IN p_usuario_id INT,
    IN p_vehiculo_id INT,
    IN p_forma_pago ENUM('efectivo', 'tarjeta', 'transferencia')
)
BEGIN
    DECLARE disponible_actual BOOLEAN;


    IF NOT EXISTS (SELECT 1 FROM usuario WHERE id = p_usuario_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El usuario no existe';
    END IF;


    IF NOT EXISTS (SELECT 1 FROM vehiculo WHERE id = p_vehiculo_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El vehículo no existe';
    END IF;


    SELECT disponible INTO disponible_actual
    FROM vehiculo
    WHERE id = p_vehiculo_id
    FOR UPDATE;

    IF disponible_actual = FALSE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El vehículo ya ha sido vendido';
    END IF;


    INSERT INTO compra (usuario_id, vehiculo_id, forma_pago, estado_compra)
    VALUES (p_usuario_id, p_vehiculo_id, p_forma_pago, 'confirmada');

    UPDATE vehiculo
    SET disponible = FALSE
    WHERE id = p_vehiculo_id;
END //

DELIMITER ;