-- DDL ejercicio 03 Comunidades Autonomas

CREATE DATABASE ejercicio03;
USE ejercicio03;

CREATE TABLE comunidades_autonomas(
    nombre varchar(30),
    poblacion int,
    superficie float,
    PRIMARY KEY (nombre)
);

CREATE TABLE provincias(
	codigo_postal int,
    nombre varchar(30),
    poblacion int,
    superficie float,
    comunidad_autonoma varchar(30),
    PRIMARY KEY (codigo_postal),
    FOREIGN KEY (comunidad_autonoma) REFERENCES comunidades_autonomas(nombre)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE localidades(
    nombre varchar(30),
    poblacion int,
    provincia int,
    PRIMARY KEY (nombre),
    FOREIGN KEY (provincia) REFERENCES provincias(codigo_postal)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE capital_provincia(
	nombre_localidad varchar(30),
    codigo_postal int,
    PRIMARY KEY (nombre_localidad, codigo_postal),
    FOREIGN KEY (nombre_localidad) REFERENCES localidades(nombre)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (codigo_postal) REFERENCES provincias(codigo_postal)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE capital_comunidad(
	nombre_comunidad varchar(30),
    codigo_postal int,
    PRIMARY KEY (nombre_comunidad, codigo_postal),
    FOREIGN KEY (nombre_comunidad) REFERENCES comunidades_autonomas(nombre)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (codigo_postal) REFERENCES provincias(codigo_postal)
    ON DELETE cascade
    ON UPDATE cascade
);

-- DML

SELECT * FROM comunidades_autonomas;
INSERT INTO comunidades_autonomas (nombre, poblacion, superficie) VALUES 
('Cataluña', 50000, 230.50),
('Castilla La-Mancha', 35000, 350),
('Madrid', 60000, 125.70);

SELECT * FROM provincias;
INSERT INTO provincias VALUES 
('43001', 'Tarragona', 7500, 56.45, 'Cataluña'),
('43013', 'Ciudad Real', 10000, 80.64, 'Castilla La-Mancha'),
('43008', 'Barcelona', 13000, 60.20, 'Cataluña');

SELECT * FROM localidades;
INSERT INTO localidades (nombre, poblacion, provincia) VALUES
('Reus', 4000, 43001),
('Tomelloso', 3500, 43013),
('Tortosa', 3000, 43001);

SELECT * FROM capital_comunidad;
INSERT INTO capital_comunidad VALUES ('Cataluña', 43008);

SELECT * FROM capital_provincia;
INSERT INTO capital_provincia VALUES ('Reus', 43001);

UPDATE provincias SET codigo_postal = 43005
WHERE codigo_postal = 43001;

DELETE FROM localidades WHERE nombre = 'Tortosa';