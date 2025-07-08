USE parcial_bd_dilan;

DELIMITER //

CREATE FUNCTION vehiculos_disponibles()
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total INT;

    SELECT COUNT(*)
    INTO total
    FROM vehiculo
    WHERE disponible = TRUE;

    RETURN total;
END //

DELIMITER ;