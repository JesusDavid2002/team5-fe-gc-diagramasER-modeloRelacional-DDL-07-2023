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


-- Insertar
INSERT INTO Usuarios(userID, nombre, correo_electronico, telefono, foto_perfil, userID_2)
VALUES 
    (1, 'Juan', 'juan@gmail.com', '612345678', NULL, NULL),
    (2, 'Maria', 'maria@gmail.com', '623456789', NULL, 1);

INSERT INTO Mensajes(mensajeID, contenido, fecha_publicacion, hora_publicacion, userID)
VALUES 
    (1, 'Hola mundo!', '2023-08-01', '10:30:00', 1),
    (2, 'Bienvenidos a mi perfil', '2023-08-01', '11:00:00', 2);

INSERT INTO Favoritos(favoritoID, fecha, hora, mensajeID, userID)
VALUES 
    (1, '2023-08-01', '12:00:00', 2, 1);

INSERT INTO Retweets(retweetID, fecha, hora, mensajeID, userID)
VALUES 
    (1, '2023-08-01', '13:00:00', 1, 2);

-- Actualizar
UPDATE Usuarios
SET nombre = 'Carlos', correo_electronico = 'carlos@gmail.com'
WHERE userID = 1;

UPDATE Mensajes
SET contenido = 'Actualizando mi primer mensaje', hora_publicacion = '14:00:00'
WHERE mensajeID = 1;

UPDATE Favoritos
SET fecha = '2023-08-02', hora = '10:00:00'
WHERE favoritoID = 1;

UPDATE Retweets
SET fecha = '2023-08-02', hora = '11:00:00'
WHERE retweetID = 1;

-- Eliminar
DELETE FROM Usuarios
WHERE userID = 2;

DELETE FROM Mensajes
WHERE mensajeID = 2;

DELETE FROM Favoritos
WHERE favoritoID = 1;

DELETE FROM Retweets
WHERE retweetID = 1;
