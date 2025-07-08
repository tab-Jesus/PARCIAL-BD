USE parcial_db_dilan;

DELIMITER //

CREATE FUNCTION total_vehiculos_vendidos()
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total INT;

    SELECT COUNT(*) INTO total
    FROM vehiculo
    WHERE disponible = FALSE;

    RETURN total;
END //

DELIMITER ;
