-- DDL ejercicio 12 Empresa de Software

CREATE DATABASE ejercicio12;
USE ejercicio12;

CREATE TABLE trabajadores(
	DNI varchar(9),
    codigo_trabajador int,
    nombre varchar(10),
    apellidos varchar(20),
    PRIMARY KEY (DNI)
);

CREATE TABLE empresas(
	CIF varchar(10),
    codigo_interno int unique,
    nombre varchar(30) unique,
    dirección varchar(30),
    teléfono int,
    PRIMARY KEY (CIF)
);

CREATE TABLE proyectos(
	ID_proyecto int,
    fecha_inicio date unique,
    fecha_fin date,
    fecha_prevista date,
    CIF_empresas varchar(10),
    PRIMARY KEY (ID_proyecto),
    FOREIGN KEY (CIF_empresas) REFERENCES empresas(CIF)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE profesiones(
	codigo_profesion int,
    descripcion varchar(50),
    esAdministradorDiseño boolean NULL DEFAULT FALSE,
    PRIMARY KEY (codigo_profesion)
);

CREATE TABLE proyectos_profesiones_trabajadores(
	hora_proyecto varchar(5),
	DNI_trabajadores varchar(9),
    ID_proyectos int,
    codigo_profesiones int,
    PRIMARY KEY (DNI_trabajadores, ID_proyectos, codigo_profesiones),
    FOREIGN KEY (DNI_trabajadores) REFERENCES trabajadores(DNI)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (ID_proyectos) REFERENCES proyectos(ID_proyecto)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (codigo_profesiones) REFERENCES profesiones(codigo_profesion)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE proyectos_empresas(
	CIF_empresas varchar(10),
    ID_proyectos int,
    PRIMARY KEY (CIF_empresas, ID_proyectos),
    FOREIGN KEY (CIF_empresas) REFERENCES empresas(CIF)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (ID_proyectos) REFERENCES proyectos(ID_proyecto)
    ON DELETE cascade
    ON UPDATE cascade
);

-- DML

SELECT * FROM trabajadores;
INSERT INTO trabajadores VALUES 
('12586532E', 12, 'Juan', 'Perez Gutierrez'),
('65231025V', 20, 'Julia', 'Martinez Gonzalez'),
('65825401Q', 05, 'Alex', 'Molina Pereira');

SELECT * FROM empresas;
INSERT INTO empresas VALUES
('4512545FDC', 408, 'Grupo Castilla', 'Riudoms, Tarragona', 977586568),
('5412587AFG', 120, 'Implika', 'Barcelona, Barcelona', 977123547),
('3512987ABC', 202, 'Tech Solutions', '123 Main St, Anytown', 551234567);

SELECT * FROM proyectos;
INSERT INTO proyectos VALUES 
(124, '2020-05-12', '2021-11-05', '2021-11-10', '4512545FDC'),
(510, '2019-08-20', '2022-12-25', '2022-11-30', '4512545FDC');

SELECT * FROM profesiones;
INSERT INTO profesiones VALUES
(20, 'analista', FALSE),
(05, 'jefe', FALSE),
(01, 'programador', FALSE);

SELECT * FROM proyectos_empresas;
INSERT INTO proyectos_empresas VALUES 
('4512545FDC', 124),
('5412587AFG', 510);

SELECT * FROM proyectos_profesiones_trabajadores;
REPLACE INTO proyectos_profesiones_trabajadores VALUES
(250, '12586532E', 124, 20),
(150, '12586532E', 510, 01),
(350, '65231025V', 510, 05),
(250, '65825401Q', 124, 01),
(250, '65825401Q', 124, 05);

UPDATE proyectos SET CIF_empresas = '5412587AFG'
WHERE ID_proyecto = 510;

DELETE FROM proyectos_profesiones_trabajadores WHERE DNI_trabajadores = '65825401Q' AND codigo_profesiones = 5;