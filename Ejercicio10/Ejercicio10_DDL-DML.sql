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

-- Insertando datos en la tabla LigasFutbol
INSERT INTO LigasFutbol(LigaID, nombre, fecha_inicio, fecha_final)
VALUES 
    (1, 'La Liga', '2023-08-20', '2024-05-20'),
    (2, 'Premier League', '2023-08-10', '2024-05-10');

-- Insertando datos en la tabla Equipos
INSERT INTO Equipos(EquipoID, nombre, localidad)
VALUES 
    (1, 'FC Barcelona', 'Barcelona'),
    (2, 'Real Madrid', 'Madrid'),
    (3, 'Manchester United', 'Manchester'),
    (4, 'Chelsea FC', 'London');

-- Insertando datos en la tabla Jugadores
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
