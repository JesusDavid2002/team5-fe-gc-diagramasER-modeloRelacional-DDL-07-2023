USE ejercicio4;

CREATE TABLE Guerras (
    GuerraID INT NOT NULL,
    año_inicio INT,
    año_final INT,
    nombre VARCHAR(255),
    PRIMARY KEY (GuerraID)
);

CREATE TABLE Bandos (
    BandosID INT NOT NULL,
    ganadores BOOLEAN,
    nombre VARCHAR(255),
    GuerraID INT,
    PRIMARY KEY (BandosID),
    FOREIGN KEY (GuerraID) REFERENCES Guerras(GuerraID)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE Paises (
    nombre VARCHAR(255) NOT NULL,
    año_independiente_inicio INT,
    año_independiente_fin INT,
    BandosID INT,
    PRIMARY KEY (nombre),
    FOREIGN KEY (BandosID) REFERENCES Bandos(BandosID)
    ON DELETE cascade
    ON UPDATE cascade
);

-- DML

-- Insertar
INSERT INTO Guerras (GuerraID, año_inicio, año_final, nombre)
VALUES (1, 1939, 1945, 'Segunda Guerra Mundial');

INSERT INTO Bandos (BandosID, ganadores, nombre, GuerraID)
VALUES (1, 1, 'Aliados', 1);

INSERT INTO Paises (nombre, año_independiente_inicio, año_independiente_fin, BandosID)
VALUES ('Francia', 843, NULL, 1);

-- Actualizar
UPDATE Guerras 
SET nombre = 'Primera Guerra Mundial', año_inicio = 1914, año_final = 1918
WHERE GuerraID = 1;

UPDATE Bandos
SET nombre = 'Triple Entente'
WHERE BandosID = 1;

UPDATE Paises
SET año_independiente_inicio = 843, año_independiente_fin = NULL
WHERE nombre = 'Francia';

-- Eliminar
DELETE FROM Paises WHERE nombre = 'Francia';

DELETE FROM Bandos WHERE BandosID = 1;

DELETE FROM Guerras WHERE GuerraID = 1;

-- Select
SELECT * FROM Guerras;

SELECT * FROM Bandos;

SELECT * FROM Paises;
