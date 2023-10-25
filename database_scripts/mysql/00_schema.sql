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

CREATE TABLE floreria.productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    inventario INT NOT NULL,
    almacen_id INT,
    FOREIGN KEY (almacen_id) REFERENCES floreria.almacenes (id)
);

CREATE SCHEMA tienda;

CREATE TABLE tienda.productos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
);

CREATE TABLE tienda.clientes(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(50) NOT NULL
);

CREATE SCHEMA libreria;

CREATE TABLE libreria.libros(
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL
);

CREATE SCHEMA cafeteria;

CREATE TABLE cafeteria.clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200),
    telefono VARCHAR(20)
);

CREATE TABLE cafeteria.productos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL
);

CREATE TABLE cafeteria.empleados(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    cargo VARCHAR(50) NOT NULL
);

CREATE TABLE cafeteria.pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    producto_id INT,
    fecha_pedido TIMESTAMP NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES cafeteria.clientes (id),
    FOREIGN KEY (producto_id) REFERENCES cafeteria.productos (id)
);

CREATE SCHEMA gimnasio;

CREATE TABLE gimnasio.clientes(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    fecha_inicio DATE NOT NULL
);

CREATE TABLE gimnasio.equipos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    tipo VARCHAR(50) NOT NULL
);

CREATE TABLE gimnasio.entrenadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    especialidad VARCHAR(50),
    fecha_contratacion DATE NOT NULL
);

CREATE TABLE gimnasio.pagos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    fecha_pago DATE NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES gimnasio.clientes (id)
);

CREATE SCHEMA hotel;

CREATE TABLE hotel.habitaciones(
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero INT NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL
);

CREATE TABLE hotel.reservas(
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    cliente_id INT NOT NULL
);
