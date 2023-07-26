CREATE DATABASE ejercicio02;
USE ejercicio02;

CREATE TABLE Profesores (
    DNI VARCHAR(9) PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    telefono VARCHAR(10),
    direccion VARCHAR(50)
);

CREATE TABLE Cursos (
    Codigo INT PRIMARY KEY,
    programa_curso VARCHAR(30) NOT NULL,
    hora_duracion INT,
    titulo VARCHAR(30) NOT NULL,
    fecha_inicio DATE,
    fecha_final DATE,
    DNI_profesores VARCHAR(9),
    FOREIGN KEY (DNI_profesores) REFERENCES Profesores(DNI)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE Alumnos (
    DNI VARCHAR(9) PRIMARY KEY,
    direccion VARCHAR(50),
    telefono VARCHAR(10),
    edad INT,
    esTrabajador BOOLEAN
);

CREATE TABLE Asistir (
    Codigo_cursos INT,
    DNI_alumnos VARCHAR(9),
    nota INT,
    PRIMARY KEY (Codigo_cursos, DNI_alumnos),
    FOREIGN KEY (Codigo_cursos) REFERENCES Cursos(Codigo)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (DNI_alumnos) REFERENCES Alumnos(DNI)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE Empresas (
    CIF VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    direccion VARCHAR(50),
    telefono VARCHAR(10),
    DNI_alumnos VARCHAR(9),
    FOREIGN KEY (DNI_alumnos) REFERENCES Alumnos(DNI)
    ON DELETE cascade
    ON UPDATE cascade
);