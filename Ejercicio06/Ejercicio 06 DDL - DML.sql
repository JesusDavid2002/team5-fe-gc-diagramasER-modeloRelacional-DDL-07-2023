-- DDL ejercicio 6 Biblioteca 

CREATE DATABASE ejercicio06;
USE ejercicio06;

CREATE TABLE socios(
	DNI varchar(9),
    nombre varchar(20),
    apellidos varchar(50),
    codigo_socio int,
    direccion varchar(50),
    telefono int,
    PRIMARY KEY (DNI)
);

CREATE TABLE prestamos(
	id int auto_increment,
    fecha date,
    fecha_maxima date,
    fecha_devolucion date,
    dni_socio varchar(9),
    PRIMARY KEY (id),
    FOREIGN KEY (dni_socio) REFERENCES socios (DNI)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE articulos(
	id int auto_increment,
    nombre varchar(100),
    resumen varchar(255),
    fecha_salida date,
    esta_deteriorado boolean,
    comentario_deteriorado varchar(100),
    id_prestamo int,
    PRIMARY KEY (id),
    FOREIGN KEY (id_prestamo) REFERENCES prestamos (id)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE autores(
	DNI varchar(9),
    nombre varchar(20) default 'Anonimo',
	pais varchar(40),
    id_articulo int,
    PRIMARY KEY (DNI),
    FOREIGN KEY (id_articulo) REFERENCES articulos (id)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE cds(
	id int auto_increment,
    numero_canciones int,
    id_articulo int,
    PRIMARY KEY (id),
    FOREIGN KEY (id_articulo) REFERENCES articulos (id)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE libros(
	id int auto_increment,
    numero_paginas int,
    id_articulo int,
    PRIMARY KEY (id),
    FOREIGN KEY (id_articulo) REFERENCES articulos (id)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE peliculas(
	id int auto_increment,
    duracion int,
    id_articulo int,
    PRIMARY KEY (id),
    FOREIGN KEY (id_articulo) REFERENCES articulos (id)
    ON DELETE cascade
    ON UPDATE cascade
);

-- DML

SELECT * FROM socios;
INSERT INTO socios VALUES 
('12458963D', 'Juan', 'Martinez Osborne', 12, 'calle maria pimientos', 454321110),
('65874105E', 'Pedro', 'Bustamante Gutierrez', 30, 'calle glorieta 23', 124858803),
('45230258N', 'Marta', 'Díaz Gutierrez', 64, 'calle glorieta 50', 657213459);

SELECT * FROM prestamos;
INSERT INTO prestamos (fecha, fecha_maxima, fecha_devolucion, dni_socio)VALUES 
('2023-05-12', '2023-06-03', '2023-06-01','12458963D'),
('2022-12-05', '2023-01-15', '2023-01-20','65874105E'),
('2020-09-20', '2020-10-30', '2020-10-30','45230258N');

SELECT * FROM articulos;
INSERT INTO articulos (nombre, resumen, fecha_salida, esta_deteriorado, comentario_deteriorado, id_prestamo) VALUES
('48 leyes de poder', '48 leyes para poder ganar poder, evitar que te influyan entre otros aspectos', '1998-12-05', false, '', 2),
('Harry potter y la piedra filosofal', 'Viaja junto con Harry a la academia de magia para resolver un nuevo misterio', '2012-04-30', true, 'el disco esta algo rayado', 1),
('Metallica', 'Disco con los mejores hits de Metallica', '2012-02-25', false, '', 2);

SELECT * FROM autores;
INSERT INTO autores VALUES
('66658945E', 'Robert Greene', 'America', 1),
('45712032F', 'JK Rouling', 'Gran Bretaña', 2),
('24575105V', '', 'America', 3);

SELECT * FROM cds;
INSERT INTO cds (numero_canciones, id_articulo) VALUES (20, 3);

SELECT * FROM libros;
INSERT INTO libros (numero_paginas, id_articulo) VALUES (518, 1);

SELECT * FROM peliculas;
INSERT INTO peliculas (duracion, id_articulo) VALUE (130, 2);

UPDATE autores SET nombre = 'Juan Perez'
WHERE id_articulo = 3;

DELETE FROM cds WHERE id = 2;