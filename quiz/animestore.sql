CREATE DATABASE anime_store;

USE anime_store;

CREATE TABLE Categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Productos (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES Categorias(id_categoria)
);

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    fecha_pedido DATE,
    total DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id_cliente)
);

CREATE TABLE Detalles_Pedido (
    id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    pedido_id INT,
    producto_id INT,
    cantidad INT,
    subtotal DECIMAL(10, 2),
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (producto_id) REFERENCES Productos(id_producto)
);

-- Categorías
INSERT INTO Categorias (nombre) VALUES ('Figuras');
INSERT INTO Categorias (nombre) VALUES ('Mangas');
INSERT INTO Categorias (nombre) VALUES ('Ropa');
INSERT INTO Categorias (nombre) VALUES ('Accesorios');

-- Productos
INSERT INTO Productos (nombre, descripcion, precio, categoria_id) VALUES ('Figura de Goku', 'Figura de acción de Goku en Super Saiyan.', 29.99, 1);
INSERT INTO Productos (nombre, descripcion, precio, categoria_id) VALUES ('Manga de One Piece', 'Volume 1 de One Piece.', 9.99, 2);
INSERT INTO Productos (nombre, descripcion, precio, categoria_id) VALUES ('Camiseta de Naruto', 'Camiseta con diseño de Naruto.', 19.99, 3);
INSERT INTO Productos (nombre, descripcion, precio, categoria_id) VALUES ('Llaveros de Anime', 'Llaveros de personajes de anime.', 5.99, 4);
INSERT INTO Productos (nombre, descripcion, precio, categoria_id) VALUES ('Póster de My Hero Academia', 'Póster de los personajes principales.', 15.00, 4);
INSERT INTO Productos (nombre, descripcion, precio, categoria_id) VALUES ('Figurita de Sailor Moon', 'Figurita coleccionable de Sailor Moon.', 12.50, 1);
INSERT INTO Productos (nombre, descripcion, precio, categoria_id) VALUES ('Sudadera de Attack on Titan', 'Sudadera con el logo de Attack on Titan.', 39.99, 3);

-- Clientes
INSERT INTO Clientes (nombre, direccion, telefono, email) VALUES ('Juan Pérez', 'Calle Falsa 123', '555-1234', 'juan.perez@example.com');
INSERT INTO Clientes (nombre, direccion, telefono, email) VALUES ('María López', 'Av. Siempre Viva 456', '555-5678', 'maria.lopez@example.com');
INSERT INTO Clientes (nombre, direccion, telefono, email) VALUES ('Carlos García', 'Calle del Sol 789', '555-8765', 'carlos.garcia@example.com');

-- Pedidos
INSERT INTO Pedidos (cliente_id, fecha_pedido, total) VALUES (1, '2024-09-25', 59.98);
INSERT INTO Pedidos (cliente_id, fecha_pedido, total) VALUES (2, '2024-09-26', 19.99);

-- Detalles de pedidos
INSERT INTO Detalles_Pedido (pedido_id, producto_id, cantidad, subtotal) VALUES (1, 1, 1, 29.99);
INSERT INTO Detalles_Pedido (pedido_id, producto_id, cantidad, subtotal) VALUES (1, 2, 3, 29.97); -- 3 mangas de One Piece
INSERT INTO Detalles_Pedido (pedido_id, producto_id, cantidad, subtotal) VALUES (2, 3, 1, 19.99);