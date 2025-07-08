USE parcial_bd_dilan;

CREATE TABLE vehiculo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    anio YEAR NOT NULL,
    color VARCHAR(30),
    transmision ENUM('manual', 'automática') NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    disponible BOOLEAN NOT NULL DEFAULT TRUE
);
