-- DDL ejercicio 15 menus del dia

CREATE DATABASE ejercicio15;
USE ejercicio15;

CREATE TABLE dias(
	fecha date,
    cantidad_platos int,
    temperatura float,
    platos_exitosos int,
    PRIMARY KEY (fecha)
);

CREATE TABLE menus(
	id int auto_increment,
    numero_personas int,
    fecha_dia date,
    PRIMARY KEY (id),
    FOREIGN KEY (fecha_dia) REFERENCES dias (fecha)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE platos(
	id int auto_increment,
    nombre varchar(50),
    descripcion varchar(100),
    id_menu int,
    PRIMARY KEY (id),
    FOREIGN KEY (id_menu) REFERENCES menus (id)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE primeros_platos (
	id int auto_increment,
    id_plato int,
    PRIMARY KEY (id),
    FOREIGN KEY (id_plato) REFERENCES platos (id)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE segundos_platos (
	id int auto_increment,
    id_plato int,
    PRIMARY KEY (id),
    FOREIGN KEY (id_plato) REFERENCES platos (id)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE postres (
	id int auto_increment,
    id_plato int,
    PRIMARY KEY (id),
    FOREIGN KEY (id_plato) REFERENCES platos (id)
    ON DELETE cascade
    ON UPDATE cascade
);

-- DML

SELECT * FROM dias;
INSERT INTO dias VALUES 
('2023-10-15', 57, 34, 45),
('2023-09-24', 98, 40, 74);

SELECT * FROM menus;
INSERT INTO menus (numero_personas, fecha_dia) VALUES
(120, '2023-10-15'),
(243, '2023-09-24');

SELECT * FROM platos;
INSERT INTO platos (nombre, descripcion, id_menu) VALUES
('Ensalada mediterránea', 'Mezcla de lechuga, tomates cherry, aceitunas, pepino y queso feta con aderezo de viagreta balsámica', '1'),
('Crema de calabaza y jengibre', 'Deliciosa crema de calabaza con un toque de jengibre y crujientes de pan', 2),
('Risotto de champiñones', 'Arroz cremoso cocinado con caldo de champiñones y queso parmesano', 1),
('Tarta de chocolate y avellanas', 'Deliciosa tarta de chocolate oscura con una base de galleta de avellanas y cobertura de crema batida', 1),
('Salmón al horno con salsa de limón y eneldo', 'Salmón fresco asado al horno con una suave salsa de limón y eneldo', 2);

SELECT * FROM primeros_platos;
INSERT INTO primeros_platos (id_plato) VALUES (5), (6);

SELECT * FROM segundos_platos;
INSERT INTO segundos_platos (id_plato) VALUES (7), (9);

SELECT * FROM postres;
INSERT INTO postres (id_plato) VALUES (8);

UPDATE platos SET id_menu = 2
WHERE id = 8;

DELETE FROM primeros_platos WHERE id_plato = 7 OR id_plato = 9;