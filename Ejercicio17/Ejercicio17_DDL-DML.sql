USE ejercicio17;


CREATE TABLE Asignaturas (
    codigo_interno INT NOT NULL,
    nombre VARCHAR(100),
    codigo_europeo VARCHAR(100),
    codigo_interno_asignatura INT,
    PRIMARY KEY (codigo_interno),
    FOREIGN KEY (codigo_interno_asignatura) REFERENCES Asignaturas(codigo_interno)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE Profesores (
    dni VARCHAR(9) NOT NULL,
    nombre VARCHAR(100),
    direccion VARCHAR(200),
    telefono VARCHAR(15),
    email VARCHAR(100),
    num_seguridad_social VARCHAR(15),
    codigo_interno INT,
    años_antiguedad INT,
    esTutor BOOLEAN,
    tiempo_tutor INT,
    codigo_interno_asignatura INT,
    PRIMARY KEY (dni),
    FOREIGN KEY (codigo_interno_asignatura) REFERENCES Asignaturas(codigo_interno)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE Ciclos (
    codigo_interno INT NOT NULL,
    grado VARCHAR(50),
    nombre VARCHAR(100),
    PRIMARY KEY (codigo_interno)
);

CREATE TABLE Cursos (
    id_curso INT NOT NULL,
    dni VARCHAR(9),
    codigo_interno_curso INT,
    PRIMARY KEY (id_curso),
    FOREIGN KEY (dni) REFERENCES Profesores(dni)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (codigo_interno_curso) REFERENCES Ciclos(codigo_interno)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE Ciclos_asignaturas (
    codigo_interno_asignatura INT NOT NULL,
    codigo_interno_ciclo INT NOT NULL,
    PRIMARY KEY (codigo_interno_asignatura, codigo_interno_ciclo),
    FOREIGN KEY (codigo_interno_asignatura) REFERENCES Asignaturas(codigo_interno)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (codigo_interno_ciclo) REFERENCES Ciclos(codigo_interno)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE Horarios (
    id_horario INT NOT NULL,
    hora TIME,
    dia_semana VARCHAR(10),
    PRIMARY KEY (id_horario)
);

CREATE TABLE Aulas (
    nombre VARCHAR(50) NOT NULL,
    numero INT NOT NULL,
    codigo_aula INT,
    metros INT,
    PRIMARY KEY (nombre, numero)
);

CREATE TABLE Aulas_asignaturas_horarios (
    codigo_interno_asignatura INT NOT NULL,
    id_horario INT NOT NULL,
    nombre_aula VARCHAR(50) NOT NULL,
    numero_aula INT NOT NULL,
    PRIMARY KEY (codigo_interno_asignatura, id_horario, nombre_aula, numero_aula),
    FOREIGN KEY (codigo_interno_asignatura) REFERENCES Asignaturas(codigo_interno)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (id_horario) REFERENCES Horarios(id_horario)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (nombre_aula, numero_aula) REFERENCES Aulas(nombre, numero)
    ON DELETE cascade
    ON UPDATE cascade
);



-- DML


-- Insertando datos en la tabla Asignaturas
INSERT INTO Asignaturas(codigo_interno, nombre, codigo_europeo, codigo_interno_asignatura)
VALUES 
    (101, 'Matemáticas', 'EU101', NULL),
    (102, 'Física', 'EU102', 101);

-- Insertando datos en la tabla Profesores
INSERT INTO Profesores(dni, nombre, direccion, telefono, email, num_seguridad_social, codigo_interno, años_antiguedad, esTutor, tiempo_tutor, codigo_interno_asignatura)
VALUES 
    ('12345678A', 'Juan Perez', 'Calle Ejemplo, 1', '600123456', 'juan@example.com', '1234567890', 5, 10, TRUE, 2, 101),
    ('87654321B', 'Maria Lopez', 'Avenida Ejemplo, 2', '600789456', 'maria@example.com', '0987654321', 7, 8, FALSE, 0, 102);

-- Insertando datos en la tabla Ciclos
INSERT INTO Ciclos(codigo_interno, grado, nombre)
VALUES 
    (1, 'Grado Superior', 'Informática'),
    (2, 'Grado Medio', 'Administración');

-- Insertando datos en la tabla Cursos
INSERT INTO Cursos(id_curso, dni, codigo_interno_curso)
VALUES 
    (1, '12345678A', 1),
    (2, '87654321B', 2);

-- Insertando datos en la tabla Ciclos_asignaturas
INSERT INTO Ciclos_asignaturas(codigo_interno_asignatura, codigo_interno_ciclo)
VALUES 
    (101, 1),
    (102, 2);

-- Insertando datos en la tabla Horarios
INSERT INTO Horarios(id_horario, hora, dia_semana)
VALUES 
    (1, '08:00:00', 'Lunes'),
    (2, '10:00:00', 'Martes');

-- Insertando datos en la tabla Aulas
INSERT INTO Aulas(nombre, numero, codigo_aula, metros)
VALUES 
    ('Aula 101', 101, 1, 40),
    ('Aula 102', 102, 2, 50);

-- Insertando datos en la tabla Aulas_asignaturas_horarios
INSERT INTO Aulas_asignaturas_horarios(codigo_interno_asignatura, id_horario, nombre_aula, numero_aula)
VALUES 
    (101, 1, 'Aula 101', 101),
    (102, 2, 'Aula 102', 102);
