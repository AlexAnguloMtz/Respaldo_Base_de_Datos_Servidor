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

CREATE SCHEMA universidad;

CREATE TABLE universidad.estudiantes(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    carrera VARCHAR(50) NOT NULL,
    fecha_ingreso DATE NOT NULL
);

CREATE TABLE universidad.profesores(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    departamento VARCHAR(50) NOT NULL
);

CREATE SCHEMA banco;

CREATE TABLE banco.clientes(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    saldo DECIMAL(10, 2) NOT NULL
);

CREATE TABLE banco.transacciones(
    id SERIAL PRIMARY KEY,
    fecha_hora TIMESTAMP NOT NULL,
    cliente_id INT NOT NULL,
    monto DECIMAL(10, 2) NOT NULL
);

CREATE SCHEMA teatro;

CREATE TABLE teatro.obras(
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    fecha_estreno DATE NOT NULL
);

CREATE TABLE teatro.actores(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    edad INT NOT NULL
);

CREATE SCHEMA biblioteca;

CREATE TABLE biblioteca.libros(
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    editorial VARCHAR(50) NOT NULL
);

CREATE TABLE biblioteca.lectores(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(100) NOT NULL
);
