-- DDL ejercicio 9 Recetas de cocina

CREATE DATABASE ejercicio09;
USE ejercicio09;

CREATE TABLE categorias (
	id int auto_increment,
    nombre varchar(50) unique,
    PRIMARY KEY (id)
);

CREATE TABLE recetas (
	id int auto_increment,
    nombre varchar (50),
    descripcion varchar(100),
    tiempo_preparacion int,
    id_categorias int,
    PRIMARY KEY (id),
    FOREIGN KEY (id_categorias) REFERENCES categorias (id)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE ingredientes (
	id int auto_increment,
    nombre varchar(50),
    cantidad int,
    id_recetas int,
    PRIMARY KEY (id),
    FOREIGN KEY (id_recetas) REFERENCES recetas (id)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE pasos_preparacion (
	id int auto_increment,
    descripcion varchar(100),
    tiempo int,
    id_recetas int,
    PRIMARY KEY (id),
    FOREIGN KEY (id_recetas) REFERENCES recetas (id)
    ON DELETE cascade
    ON UPDATE cascade
);

-- DML

SELECT * FROM categorias;
INSERT INTO categorias (nombre) VALUES ('Primer plato'), ('Segundo plato'), ('Postre'), ('Entrante');

SELECT * FROM recetas;
INSERT INTO recetas (nombre, descripcion, tiempo_preparacion, id_categorias) VALUES 
('Macarrones a la boloñesa', 'Deliciosos macarrones con salsa a la boloñesa y una pizca de jenibre por encima', 30, 1),
('Entrecot colmenero', 'Entrecot al punto del consumidor recubierto con miel y especias para darle mejor textura a la carne', 45, 2),
('Patatas bravas', 'Patatas bravas con salsa brava', 10, 4),
('Croquetas', 'Croquetas rellenas de pollo', 10, 4),
('Tarta de queso', 'Tarta de queso, con base de galleta y la posiblidad de añadir complementos para mayor sabor', 15, 3);

SELECT * FROM ingredientes;
INSERT INTO ingredientes (nombre, cantidad, id_recetas) VALUES
('macarrones', 5, 1),
('miel', 2, 2),
('queso', 10, 5),
('patatas', 10, 3),
('galletas', 2, 5),
('pollo', 3, 4);

SELECT * FROM pasos_preparacion;
INSERT INTO pasos_preparacion (descripcion, tiempo, id_recetas) VALUES
('hervir los macarrones en una olla con una cucharada de sal', 25, 1),
('pelar y cortar las patatas', 10, 3),
('cocinar el entrecot al punto pedido por el cliente en la plancha', 30, 2),
('trocear y machar el pollo, para posteriormente utilizarlo con pan rallado', 40, 4),
('untar la miel al entrecot antes de hacerlo a la plancha', 5, 2);

UPDATE pasos_preparacion SET id = 6
WHERE id = 3;

DELETE FROM ingredientes WHERE id = 5;