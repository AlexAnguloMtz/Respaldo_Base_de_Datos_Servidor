CREATE SCHEMA restaurante;

CREATE TABLE restaurante.proveedores(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE restaurante.vehiculos(
    id SERIAL PRIMARY KEY,
    modelo VARCHAR(50) NOT NULL,
    placas VARCHAR(10) NOT NULL
);