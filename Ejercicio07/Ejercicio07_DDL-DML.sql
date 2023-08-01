USE ejercicio7;


CREATE TABLE Trabajadores (
    DNI VARCHAR(9) NOT NULL,
    num_seguridad_social VARCHAR(12),
    codigo_trabajador INT,
    nombre VARCHAR(255),
    apellidos VARCHAR(255),
    direccion VARCHAR(255),
    telefono VARCHAR(20),
    PRIMARY KEY (DNI)
);

CREATE TABLE Responsable (
    DNI VARCHAR(9) NOT NULL,
    num_seguridad_social VARCHAR(12),
    codigo_trabajador INT,
    nombre VARCHAR(255),
    apellidos VARCHAR(255),
    direccion VARCHAR(255),
    telefono VARCHAR(20),
    DNI_trabajadores VARCHAR(9),
    PRIMARY KEY (DNI),
    FOREIGN KEY (DNI_trabajadores) REFERENCES Trabajadores(DNI)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE Departamento (
    codigo_departamento INT NOT NULL,
    nombre VARCHAR(255),
    DNI_trabajador VARCHAR(9),
    PRIMARY KEY (codigo_departamento),
    FOREIGN KEY (DNI_trabajador) REFERENCES Trabajadores(DNI)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE Contratos (
    codigo_contrato INT NOT NULL,
    fecha_inicio DATE,
    fecha_final DATE,
    DNI_trabajador VARCHAR(9),
    PRIMARY KEY (codigo_contrato),
    FOREIGN KEY (DNI_trabajador) REFERENCES Trabajadores(DNI)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE CategoriaProfesional (
    codigo_categoria_profesional INT NOT NULL,
    descripcion TEXT,
    DNI_trabajador VARCHAR(9),
    PRIMARY KEY (codigo_categoria_profesional),
    FOREIGN KEY (DNI_trabajador) REFERENCES Trabajadores(DNI)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE Nominas (
    id_nomina INT NOT NULL,
    fecha DATE,
    salario DECIMAL(10, 2),
    direccion VARCHAR(255),
    DNI_trabajador VARCHAR(9),
    PRIMARY KEY (id_nomina),
    FOREIGN KEY (DNI_trabajador) REFERENCES Trabajadores(DNI)
    ON DELETE cascade
    ON UPDATE cascade
);


-- DML

-- Insertar
INSERT INTO Trabajadores(DNI, num_seguridad_social, codigo_trabajador, nombre, apellidos, direccion, telefono) 
VALUES 
    ('12345678A', '123456789012', 1, 'Juan', 'Pérez', 'Calle Falsa 123', '123456789');

INSERT INTO Responsable(DNI, num_seguridad_social, codigo_trabajador, nombre, apellidos, direccion, telefono, DNI_trabajadores) 
VALUES 
    ('87654321Z', '210987654321', 2, 'Ana', 'López', 'Avenida Siempre Viva 321', '987654321', '12345678A');

INSERT INTO Departamento(codigo_departamento, nombre, DNI_trabajador)
VALUES
    (1, 'Recursos Humanos', '12345678A');

INSERT INTO Contratos(codigo_contrato, fecha_inicio, fecha_final, DNI_trabajador)
VALUES
    (1, '2023-01-01', '2023-12-31', '12345678A');

INSERT INTO CategoriaProfesional(codigo_categoria_profesional, descripcion, DNI_trabajador)
VALUES
    (1, 'Programador Junior', '12345678A');

INSERT INTO Nominas(id_nomina, fecha, salario, direccion, DNI_trabajador)
VALUES
    (1, '2023-01-01', 1800.00, 'Calle Falsa 123', '12345678A');



-- Actualizar
UPDATE Trabajadores
SET direccion = 'Calle Real 456'
WHERE DNI = '12345678A';

UPDATE Contratos
SET fecha_final = '2024-12-31'
WHERE codigo_contrato = 1;

UPDATE CategoriaProfesional
SET descripcion = 'Programador Senior'
WHERE codigo_categoria_profesional = 1;


-- Eliminar
DELETE FROM Nominas
WHERE id_nomina = 1;

DELETE FROM CategoriaProfesional
WHERE codigo_categoria_profesional = 1;

DELETE FROM Contratos
WHERE codigo_contrato = 1;

DELETE FROM Departamento
WHERE codigo_departamento = 1;

DELETE FROM Responsable
WHERE DNI = '87654321Z';

DELETE FROM Trabajadores
WHERE DNI = '12345678A';
