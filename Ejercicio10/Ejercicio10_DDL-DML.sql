USE ejercicio10;

CREATE TABLE LigasFutbol (
    LigaID INT NOT NULL,
    nombre VARCHAR(255),
    fecha_inicio DATE,
    fecha_final DATE,
    PRIMARY KEY (LigaID)
);

CREATE TABLE Partidos (
    PartidoID INT NOT NULL,
    goles_local INT,
    goles_visitante INT,
    fecha DATE,
    duracion INT,
    LigaID INT,
    PRIMARY KEY (PartidoID),
    FOREIGN KEY (LigaID) REFERENCES LigasFutbol(LigaID)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE Equipos (
    EquipoID INT NOT NULL,
    nombre VARCHAR(255),
    localidad VARCHAR(255),
    PRIMARY KEY (EquipoID)
);

CREATE TABLE Jugadores (
    DNI VARCHAR(9) NOT NULL,
    nombre VARCHAR(255),
    apellidos VARCHAR(255),
    dorsal INT,
    fecha_nacimiento DATE,
    nacionalidad VARCHAR(255),
    posición VARCHAR(255),
    EquipoID INT,
    PRIMARY KEY (DNI),
    FOREIGN KEY (EquipoID) REFERENCES Equipos(EquipoID)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE Entrenadores (
    DNI VARCHAR(9) NOT NULL,
    nombre VARCHAR(255),
    apellidos VARCHAR(255),
    fecha_nacimiento DATE,
    EquipoID INT,
    PRIMARY KEY (DNI),
    FOREIGN KEY (EquipoID) REFERENCES Equipos(EquipoID)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE JugarPartidos (
    PartidoID INT NOT NULL,
    EquipoID INT NOT NULL,
    PRIMARY KEY (PartidoID, EquipoID),
    FOREIGN KEY (PartidoID) REFERENCES Partidos(PartidoID)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (EquipoID) REFERENCES Equipos(EquipoID)
    ON DELETE cascade
    ON UPDATE cascade
);


-- DML

-- Insertar
INSERT INTO LigasFutbol(LigaID, nombre, fecha_inicio, fecha_final) 
VALUES 
    (1, 'LaLiga', '2023-08-01', '2024-05-31');

INSERT INTO Equipos(EquipoID, nombre, localidad) 
VALUES 
    (1, 'Real Madrid', 'Madrid'),
    (2, 'Barcelona', 'Barcelona');


INSERT INTO Jugadores(DNI, nombre, apellidos, dorsal, fecha_nacimiento, nacionalidad, posición, EquipoID)
VALUES 
    ('12345678A', 'Ansu', 'Fati', 10, '1987-06-24', 'Argentina', 'Delantero', 1),
    ('87654321B', 'Karim', 'Benzema', 9, '1985-02-05', 'Portugal', 'Delantero', 2),
    ('23456789C', 'Bruno', 'Fernandes', 18, '1994-09-08', 'Portugal', 'Centrocampista', 3),
    ('34567890D', 'Mason', 'Mount', 19, '1999-01-10', 'England', 'Centrocampista', 4);

-- Insertando datos en la tabla Entrenadores
INSERT INTO Entrenadores(DNI, nombre, apellidos, fecha_nacimiento, EquipoID)
VALUES 
    ('56789012E', 'Xavi', 'Hernandez', '1971-01-18', 1),
    ('89012345F', 'Carlo', 'Ancelotti', '1972-06-23', 2),
    ('90123456G', 'Ole Gunnar', 'Solskjær', '1973-02-26', 3),
    ('01234567H', 'Thomas', 'Tuchel', '1973-08-29', 4);
    
INSERT INTO JugarPartidos(PartidoID, EquipoID)
VALUES 
    (1, 1),
    (1, 2);

-- Actualizar
UPDATE Jugadores 
SET dorsal = 11 
WHERE DNI = '12345678A';

UPDATE Partidos 
SET goles_local = 2 
WHERE PartidoID = 1;


-- Eliminar
DELETE FROM Entrenadores
WHERE DNI = '89012345F';

DELETE FROM JugarPartidos
WHERE PartidoID = 1 AND EquipoID = 2;