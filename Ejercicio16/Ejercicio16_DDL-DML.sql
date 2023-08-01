USE ejercicio16;


CREATE TABLE Usuarios (
    userID INT NOT NULL,
    nombre VARCHAR(100),
    correo_electronico VARCHAR(100),
    telefono VARCHAR(15),
    foto_perfil BLOB,
    userID_2 INT,
    PRIMARY KEY (userID),
    FOREIGN KEY (userID_2) REFERENCES Usuarios(userID)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE Mensajes (
    mensajeID INT NOT NULL,
    contenido TEXT,
    fecha_publicacion DATE,
    hora_publicacion TIME,
    userID INT,
    PRIMARY KEY (mensajeID),
    FOREIGN KEY (userID) REFERENCES Usuarios(userID)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE Favoritos (
    favoritoID INT NOT NULL,
    fecha DATE,
    hora TIME,
    mensajeID INT,
    userID INT,
    PRIMARY KEY (favoritoID),
    FOREIGN KEY (mensajeID) REFERENCES Mensajes(mensajeID)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (userID) REFERENCES Usuarios(userID)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE Retweets (
    retweetID INT NOT NULL,
    fecha DATE,
    hora TIME,
    mensajeID INT,
    userID INT,
    PRIMARY KEY (retweetID),
    FOREIGN KEY (mensajeID) REFERENCES Mensajes(mensajeID)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (userID) REFERENCES Usuarios(userID)
    ON DELETE cascade
    ON UPDATE cascade
);


-- DML


-- Insertando datos en la tabla Usuarios
INSERT INTO Usuarios(userID, nombre, correo_electronico, telefono, foto_perfil, userID_2)
VALUES 
    (1, 'Juan Perez', 'juan@example.com', '600123456', NULL, NULL),
    (2, 'Maria Lopez', 'maria@example.com', '600789456', NULL, 1);

-- Insertando datos en la tabla Mensajes
INSERT INTO Mensajes(mensajeID, contenido, fecha_publicacion, hora_publicacion, userID)
VALUES 
    (1, 'Hola, este es mi primer mensaje', '2023-08-01', '10:00:00', 1),
    (2, 'Este es otro mensaje', '2023-08-02', '10:30:00', 2);

-- Insertando datos en la tabla Favoritos
INSERT INTO Favoritos(favoritoID, fecha, hora, mensajeID, userID)
VALUES 
    (1, '2023-08-02', '11:00:00', 1, 2),
    (2, '2023-08-03', '09:00:00', 2, 1);

-- Insertando datos en la tabla Retweets
INSERT INTO Retweets(retweetID, fecha, hora, mensajeID, userID)
VALUES 
    (1, '2023-08-02', '12:00:00', 1, 2),
    (2, '2023-08-03', '10:00:00', 2, 1);
