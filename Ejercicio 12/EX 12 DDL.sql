CREATE DATABASE ejercicio12;
USE ejercicio12;

CREATE TABLE trabajadores(
	DNI varchar(9),
    codigo_trabajador int,
    nombre varchar(10),
    apellidos varchar(20),
    hora_proyecto varchar(4),
    PRIMARY KEY (DNI)
);

CREATE TABLE empresas(
	CIF varchar(10),
    codigo_interno int,
    nombre varchar(10),
    dirección varchar(30),
    teléfono int,
    PRIMARY KEY (CIF)
);

CREATE TABLE proyectos(
	ID_proyecto int,
    fecha_inicio date,
    fecha_fin date,
    fecha_prevista date,
    dia int,
    ID_proyecto_2 int,
    CIF_empresas varchar(10),
    PRIMARY KEY (ID_proyecto),
    FOREIGN KEY (ID_proyecto_2) REFERENCES proyectos(ID_proyecto)
	ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (CIF_empresas) REFERENCES empresas(CIF)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE profesiones(
	codigo_profesion int,
    descripcion varchar(50),
    esAdministradorDiseño boolean NULL DEFAULT FALSE,
    DNI_trabajadores varchar(9),
    ID_proyectos int,
    PRIMARY KEY (codigo_profesion),
    FOREIGN KEY (DNI_trabajadores) REFERENCES trabajadores(DNI)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (ID_proyectos) REFERENCES proyectos(ID_proyecto)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE participar(
	DNI_trabajadores varchar(9),
    ID_proyectos int,
    PRIMARY KEY (DNI_trabajadores, ID_proyectos),
    FOREIGN KEY (DNI_trabajadores) REFERENCES trabajadores(DNI)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (ID_proyectos) REFERENCES proyectos(ID_proyecto)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE realizar(
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