CREATE SCHEMA floreria;

CREATE TABLE floreria.almacenes(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    calle VARCHAR(50) NOT NULL,
    numero INT NOT NULL,
    colonia VARCHAR(50) NOT NULL
);

CREATE TABLE floreria.locales(
    id INT AUTO_INCREMENT PRIMARY KEY,
    calle VARCHAR(50) NOT NULL,
    numero INT NOT NULL,
    colonia VARCHAR(50) NOT NULL
);