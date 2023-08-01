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

INSERT INTO Guerras(GuerraID, año_inicio, año_final, nombre) 
VALUES 
    (1, 1914, 1918, 'Primera Guerra Mundial'),
    (2, 1939, 1945, 'Segunda Guerra Mundial');

INSERT INTO Bandos(BandosID, ganadores, nombre, GuerraID) 
VALUES 
    (1, true, 'Aliados', 1),
    (2, false, 'Potencias Centrales', 1),
    (3, true, 'Aliados', 2),
    (4, false, 'Eje', 2);

INSERT INTO Paises(nombre, año_independiente_inicio, año_independiente_fin, BandosID) 
VALUES 
    ('Francia', 843, NULL, 1),
    ('Alemania', 1871, NULL, 2),
    ('Reino Unido', 1066, NULL, 3),
    ('Italia', 1861, NULL, 4);
