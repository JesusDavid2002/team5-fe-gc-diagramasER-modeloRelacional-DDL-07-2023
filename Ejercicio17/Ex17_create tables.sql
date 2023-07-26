use ejercicio17;

CREATE TABLE Asignaturas(
    codigo_interno INT PRIMARY KEY,
    nombre VARCHAR(255),
    codigo_europeo INT,
    codigo_interno_asignatura INT,
    FOREIGN KEY (codigo_interno_asignatura) REFERENCES Asignaturas(codigo_interno)
);

CREATE TABLE Profesores(
    dni VARCHAR(9) PRIMARY KEY,
    nombre VARCHAR(255),
    direccion VARCHAR(255),
    telefono VARCHAR(15),
    email VARCHAR(255),
    num_seguridad_social VARCHAR(11),
    codigo_interno INT,
    años_antiguedad INT,
    esTutor BOOLEAN,
    tiempo_tutor INT,
    fecha_inicio_impartir_asignatura DATE,
    fecha_final_impartir_asignatura DATE,
    codigo_interno_asignatura INT,
    FOREIGN KEY (codigo_interno_asignatura) REFERENCES Asignaturas(codigo_interno)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE Ciclos(
    codigo_interno INT PRIMARY KEY,
    grado INT,
    nombre VARCHAR(255)
);

CREATE TABLE Pertenece(
    codigo_interno_asignatura INT,
    codigo_interno_ciclo INT,
    PRIMARY KEY (codigo_interno_asignatura, codigo_interno_ciclo),
    FOREIGN KEY (codigo_interno_asignatura) REFERENCES Asignaturas(codigo_interno)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (codigo_interno_ciclo) REFERENCES Ciclos(codigo_interno)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE Horarios(
    id_horario INT PRIMARY KEY,
    hora TIME,
    dia_semana VARCHAR(15),
    codigo_interno_asignatura INT,
    FOREIGN KEY (codigo_interno_asignatura) REFERENCES Asignaturas(codigo_interno)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE Tener(
    codigo_interno_asignatura INT,
    id_horario INT,
    PRIMARY KEY (codigo_interno_asignatura, id_horario),
    FOREIGN KEY (codigo_interno_asignatura) REFERENCES Asignaturas(codigo_interno)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (id_horario) REFERENCES Horarios(id_horario)
    ON DELETE cascade
    ON UPDATE cascade
);

CREATE TABLE Aulas(
    nombre VARCHAR(255),
    numero INT,
    codigo_aula INT,
    metros INT,
    id_horario INT,
    PRIMARY KEY (nombre, numero),
    FOREIGN KEY (id_horario) REFERENCES Horarios(id_horario)
    ON DELETE cascade
    ON UPDATE cascade
);
