USE parcial_db_dilan;

CREATE VIEW vista_compras_detalladas AS
SELECT 
    c.id AS id_compra,
    u.nombre_completo AS cliente,
    v.modelo,
    m.nombre AS marca,
    t.nombre AS tipo,
    c.forma_pago,
    c.estado_compra,
    c.fecha_compra
FROM compra c
JOIN usuario u ON c.usuario_id = u.id
JOIN vehiculo v ON c.vehiculo_id = v.id
JOIN marca m ON v.marca_id = m.id
JOIN tipo_vehiculo t ON v.tipo_id = t.id;
