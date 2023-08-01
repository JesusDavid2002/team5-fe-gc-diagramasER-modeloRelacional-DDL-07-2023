CREATE DATABASE ejercicio11;
USE ejercicio11;

CREATE TABLE Paises (
    id_paises INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    extension FLOAT NOT NULL,
    poblacion INT NOT NULL
);

CREATE TABLE AccidentesGeograficos (
    id_accidente INT PRIMARY KEY,
    posicion_horizontal FLOAT NOT NULL,
    posicion_vertical FLOAT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    id_paises INT,
    FOREIGN KEY (id_paises) REFERENCES Paises(id_paises)
);

CREATE TABLE Rios (
    id_rios INT PRIMARY KEY,
    longitud FLOAT NOT NULL,
    id_accidente INT,
    FOREIGN KEY (id_accidente) REFERENCES AccidentesGeograficos(id_accidente)
);

CREATE TABLE Montañas (
    id_montañas INT PRIMARY KEY,
    altura FLOAT NOT NULL,
    id_accidente INT,
    FOREIGN KEY (id_accidente) REFERENCES AccidentesGeograficos(id_accidente)
);

CREATE TABLE Lagos (
    id_lagos INT PRIMARY KEY,
    extension FLOAT NOT NULL,
    id_accidente INT,
    FOREIGN KEY (id_accidente) REFERENCES AccidentesGeograficos(id_accidente)
);

CREATE TABLE Localidades (
    id_localidades INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_paises INT,
    FOREIGN KEY (id_paises) REFERENCES Paises(id_paises)
);

CREATE TABLE RiosLocalidades (
    id_localidades INT,
    id_rios INT,
    PRIMARY KEY (id_localidades, id_rios),
    FOREIGN KEY (id_localidades) REFERENCES Localidades(id_localidades),
    FOREIGN KEY (id_rios) REFERENCES Rios(id_rios)
);
