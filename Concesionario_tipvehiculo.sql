USE parcial_bd_dilan;

CREATE TABLE tipo_vehiculo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE
);
