USE ejercicio13;


CREATE TABLE Empleados (
    DNI VARCHAR(9) NOT NULL,
    num_seguiridad_social VARCHAR(12),
    nombre VARCHAR(255),
    apellidos VARCHAR(255),
    telefono_fijo VARCHAR(12),
    telefono_movil VARCHAR(12),
    PRIMARY KEY (DNI)
);

CREATE TABLE Almacenes (
    almacenID INT NOT NULL,
    nombre VARCHAR(255),
    numero INT,
    descripcion VARCHAR(255),
    PRIMARY KEY (almacenID)
);

CREATE TABLE Cocineros (
    ID_cocinero INT NOT NULL,
    DNI_empleados VARCHAR(9) NOT NULL,
    años_servicio INT,
    PRIMARY KEY (ID_cocinero, DNI_empleados),
    FOREIGN KEY (DNI_empleados) REFERENCES Empleados(DNI)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE Pinches (
    ID_pinches INT NOT NULL,
    DNI_empleados VARCHAR(9) NOT NULL,
    fecha_nacimiento DATE,
    ID_cocinero INT NOT NULL,
    PRIMARY KEY (ID_pinches, DNI_empleados),
    FOREIGN KEY (DNI_empleados) REFERENCES Empleados(DNI)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (ID_cocinero) REFERENCES Cocineros(ID_cocinero)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE Platos (
    platoID INT NOT NULL,
    nombre_plato VARCHAR(255),
    precio DECIMAL(8,2),
    tipo_plato VARCHAR(255),
    PRIMARY KEY (platoID)
);

CREATE TABLE Ingredientes (
    ingredientesID INT NOT NULL,
    nombre VARCHAR(255),
    cantidad INT,
    platoID INT,
    PRIMARY KEY (ingredientesID),
    FOREIGN KEY (platoID) REFERENCES Platos(platoID)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE Estanterias (
    estanteriaID INT NOT NULL,
    letras_identificacion VARCHAR(255),
    tamaño_cm INT,
    num_ingredientes INT,
    almacenID INT,
    PRIMARY KEY (estanteriaID),
    FOREIGN KEY (almacenID) REFERENCES Almacenes(almacenID)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE Preparar_platos (
    ID_cocinero INT NOT NULL,
    platoID INT NOT NULL,
    PRIMARY KEY (ID_cocinero, platoID),
    FOREIGN KEY (ID_cocinero) REFERENCES Cocineros(ID_cocinero)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (platoID) REFERENCES Platos(platoID)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE Estanteria_ingrediente (
    ingredientesID INT NOT NULL,
    estanteriaID INT NOT NULL,
    PRIMARY KEY (ingredientesID, estanteriaID),
    FOREIGN KEY (ingredientesID) REFERENCES Ingredientes(ingredientesID)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (estanteriaID) REFERENCES Estanterias(estanteriaID)
    ON DELETE cascade
    ON UPDATE cascade
);

-- DML

-- Insertando datos en la tabla Empleados
INSERT INTO Empleados(DNI, num_seguiridad_social, nombre, apellidos, telefono_fijo, telefono_movil)
VALUES 
    ('12345678A', '111222333', 'Juan', 'Perez', '912345678', '612345678'),
    ('23456789B', '222333444', 'Ana', 'Lopez', '913456789', '623456789');

-- Insertando datos en la tabla Almacenes
INSERT INTO Almacenes(almacenID, nombre, numero, descripcion)
VALUES 
    (1, 'Almacen Central', 100, 'Almacen principal de la empresa'),
    (2, 'Almacen Secundario', 200, 'Almacen secundario de la empresa');

-- Insertando datos en la tabla Cocineros
INSERT INTO Cocineros(ID_cocinero, DNI_empleados, años_servicio)
VALUES 
    (1, '12345678A', 10),
    (2, '23456789B', 5);

-- Insertando datos en la tabla Pinches
INSERT INTO Pinches(ID_pinches, DNI_empleados, fecha_nacimiento, ID_cocinero)
VALUES 
    (1, '12345678A', '1990-01-01', 1),
    (2, '23456789B', '1995-01-01', 2);

-- Insertando datos en la tabla Platos
INSERT INTO Platos(platoID, nombre_plato, precio, tipo_plato)
VALUES 
    (1, 'Paella', 15.0, 'Arroz'),
    (2, 'Tortilla de patatas', 10.0, 'Tapa');

-- Insertando datos en la tabla Ingredientes
INSERT INTO Ingredientes(ingredientesID, nombre, cantidad, platoID)
VALUES 
    (1, 'Arroz', 500, 1),
    (2, 'Pollo', 200, 1),
    (3, 'Huevos', 6, 2),
    (4, 'Patatas', 500, 2);

-- Insertando datos en la tabla Estanterias
INSERT INTO Estanterias(estanteriaID, letras_identificacion, tamaño_cm, num_ingredientes, almacenID)
VALUES 
    (1, 'A1', 200, 10, 1),
    (2, 'B1', 150, 8, 2);

-- Insertando datos en la tabla Preparar_platos
INSERT INTO Preparar_platos(ID_cocinero, platoID)
VALUES 
    (1, 1),
    (2, 2);

-- Insertando datos en la tabla Estanteria_ingrediente
INSERT INTO Estanteria_ingrediente(ingredientesID, estanteriaID)
VALUES 
    (1, 1),
    (2, 1),
    (3, 2),
    (4, 2);

