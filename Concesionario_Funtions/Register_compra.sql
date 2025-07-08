USE parcial_db_dilan;

DELIMITER //

CREATE PROCEDURE cancelar_compra (
    IN p_compra_id INT
)
BEGIN
    DECLARE v_vehiculo_id INT;

    IF NOT EXISTS (SELECT 1 FROM compra WHERE id = p_compra_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La compra no existe';
    END IF;

    SELECT vehiculo_id INTO v_vehiculo_id
    FROM compra
    WHERE id = p_compra_id;

    UPDATE compra
    SET estado_compra = 'cancelada'
    WHERE id = p_compra_id;

    UPDATE vehiculo
    SET disponible = TRUE
    WHERE id = v_vehiculo_id;
END //

DELIMITER ;