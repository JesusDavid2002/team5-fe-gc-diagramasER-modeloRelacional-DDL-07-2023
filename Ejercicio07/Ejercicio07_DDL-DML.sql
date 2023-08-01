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

-- Insertando datos en la tabla Trabajadores
INSERT INTO Trabajadores(DNI, num_seguridad_social, codigo_trabajador, nombre, apellidos, direccion, telefono) 
VALUES 
    ('12345678A', '111222333', 1, 'Juan', 'Pérez', 'Calle de la Paz, 1', '666111222'),
    ('87654321B', '444555666', 2, 'Maria', 'Lopez', 'Avenida del Sol, 10', '666222333'),
    ('23456789C', '777888999', 3, 'Carlos', 'Sanchez', 'Calle de la Luna, 20', '666333444');

-- Insertando datos en la tabla Responsable
INSERT INTO Responsable(DNI, num_seguridad_social, codigo_trabajador, nombre, apellidos, direccion, telefono, DNI_trabajadores) 
VALUES 
    ('34567890D', '000111222', 4, 'Laura', 'Gonzalez', 'Calle de las Estrellas, 30', '666444555', '12345678A');

-- Insertando datos en la tabla Departamento
INSERT INTO Departamento(codigo_departamento, nombre, DNI_trabajador)
VALUES 
    (1, 'Marketing', '12345678A'),
    (2, 'Ventas', '87654321B'),
    (3, 'IT', '23456789C');

-- Insertando datos en la tabla Contratos
INSERT INTO Contratos(codigo_contrato, fecha_inicio, fecha_final, DNI_trabajador)
VALUES 
    (1, '2023-01-01', '2023-12-31', '12345678A'),
    (2, '2023-01-15', '2023-12-31', '87654321B'),
    (3, '2023-02-01', NULL, '23456789C');

-- Insertando datos en la tabla CategoríaProfesional
INSERT INTO CategoriaProfesional(codigo_categoria_profesional, descripcion, DNI_trabajador)
VALUES 
    (1, 'Junior', '12345678A'),
    (2, 'Senior', '87654321B'),
    (3, 'Manager', '23456789C');

-- Insertando datos en la tabla Nóminas
INSERT INTO Nominas(id_nomina, fecha, salario, direccion, DNI_trabajador)
VALUES 
    (1, '2023-01-31', 2000.00, 'Calle de la Paz, 1', '12345678A'),
    (2, '2023-01-31', 3000.00, 'Avenida del Sol, 10', '87654321B'),
    (3, '2023-01-31', 4000.00, 'Calle de la Luna, 20', '23456789C');
