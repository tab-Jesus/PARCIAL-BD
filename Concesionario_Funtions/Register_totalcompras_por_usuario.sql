USE parcial_db_dilan;

DELIMITER //

CREATE FUNCTION compras_por_usuario(p_usuario_id INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total INT;

    SELECT COUNT(*) INTO total
    FROM compra
    WHERE usuario_id = p_usuario_id;

    RETURN total;
END //

DELIMITER ;
