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

-- Agregamos nuevas funcionalidades a vehiculo luego de la creacion de nuevas tablas--
ALTER TABLE vehiculo
ADD COLUMN marca_id INT NOT NULL AFTER id,
ADD COLUMN tipo_id INT NOT NULL AFTER marca_id;

ALTER TABLE vehiculo
DROP COLUMN marca;

ALTER TABLE vehiculo
ADD CONSTRAINT fk_marca
FOREIGN KEY (marca_id) REFERENCES marca(id);

ALTER TABLE vehiculo
ADD CONSTRAINT fk_tipo_vehiculo
FOREIGN KEY (tipo_id) REFERENCES tipo_vehiculo(id);
