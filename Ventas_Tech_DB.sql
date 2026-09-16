--  PASO 1:crear base de datos--
CREATE DATABASE Ventas_Tech_DB;

-- usar BD--
USE Ventas_Tech_DB;

-- PASO 2: eliminar tablas si es que existen --
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;

-- PASO 3: crear tablas--
CREATE TABLE categorias (id_categoria INT NOT NULL IDENTITY (1,1) PRIMARY KEY,-- clave primaria--
nombre_categoria VARCHAR (50) NOT NULL, -- texto hasta 50 caracteres--
descripcion VARCHAR (200)); -- texto hasta 100 caracteres--

CREATE TABLE clientes (id_cliente INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
nombre VARCHAR (100) NOT NULL,
email VARCHAR (100) UNIQUE,
ciudad VARCHAR (50),
fecha_registro DATE NOT NULL); -- tipo fecha--

CREATE TABLE productos (id_producto INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
nombre_producto VARCHAR (100) NOT NULL,
id_categoria INT NOT NULL REFERENCES categorias(id_categoria),
precio DECIMAL (10,2) NOT NULL,
stock INT DEFAULT 0,
activo TINYINT DEFAULT 1);

CREATE TABLE ventas (id_venta INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
id_cliente INT NOT NULL REFERENCES clientes(id_cliente),
id_producto INT NOT NULL REFERENCES productos(id_producto),
cantidad INT NOT NULL,
precio_unitario DECIMAL (10,2),
fecha_venta DATE NOT NULL);

-- PASO 4: insertar datos--
INSERT INTO dbo.categorias (nombre_categoria, descripcion)
VALUES ('Computación','Laptops, PCs y monitores'),
('Accesorios', 'Periféricos y complementos'), 
('Audio', 'Auriculares y parlantes'),
('Almacenamiento', 'Discos y memorias');


INSERT INTO dbo.clientes (nombre, email, ciudad, fecha_registro)
VALUES ('María López','maria@mail.com', 'Buenos Aires', '2024-01-05'),
('Carlos Ruiz', 'carlos@mail.com', 'Córdoba', '2024-01-10'), 
('Ana Gómez','ana@mail.com', 'Rosario','2024-02-01'),
('Pedro Sanz', 'pedro@mail.com', 'Mendoza', '2024-02-15'), 
('Laura Torres','laura@mail.com', 'Tucumán','2024-03-01');

INSERT INTO dbo.productos (nombre_producto, id_categoria, precio, stock , activo) 
VALUES ('Laptop Pro 15',1, 1200.00, 15, 1),
('Mouse Inalámbrico',2, 20.00, 80, 1),
('Monitor 4K 27"',1, 450.00, 12, 1),
('Auriculares BT Pro',3, 120.00, 35, 1),
('SSD Externo 1TB',4, 130.00, 18, 1),
('Teclado Mecánico',2, 95.00, 40, 1);

INSERT INTO dbo.ventas (id_cliente, id_producto, cantidad, precio_unitario, fecha_venta)
VALUES (1, 1, 2, 1200.00, '2024-03-05'),
(2, 2, 5, 28.00, '2024-03-06'),
(3, 3, 1, 450.00, '2024-03-07'),
(1, 4, 2, 120.00, '2024-03-08'),
(4, 5, 3, 130.00, '2024-03-10'),
(2, 6, 4, 95.00, '2024-03-11'),
(5, 1, 1, 1200.00, '2024-03-12'),
(3, 2, 8, 28.00, '2024-03-13'),
(4, 4, 1, 120.00, '2024-03-14'),
(5, 3, 2, 450.00, '2024-03-15');


SELECT * FROM categorias;
SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM ventas;