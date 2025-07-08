USE parcial_bd_dilan;

CREATE TABLE compra (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    vehiculo_id INT NOT NULL,
    fecha_compra DATETIME DEFAULT CURRENT_TIMESTAMP,
    forma_pago ENUM('efectivo', 'tarjeta', 'transferencia') NOT NULL,
    estado_compra ENUM('pendiente', 'confirmada', 'cancelada') DEFAULT 'pendiente',
    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    FOREIGN KEY (vehiculo_id) REFERENCES vehiculo(id)
);