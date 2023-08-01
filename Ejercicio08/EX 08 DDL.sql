USE ejercicio08;

CREATE TABLE Clientes (
    DNI INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellidos VARCHAR(50),
    direccion VARCHAR(30),
    telefono VARCHAR(10),
    tarjeta_credito VARCHAR(35)
);

CREATE TABLE Aviones (
    Codigo INT PRIMARY KEY,
    numero_plazas INT
);

CREATE TABLE Aeropuertos (
    Codigo INT PRIMARY KEY,
    nombre VARCHAR(50),
    localidad VARCHAR(50),
    pais VARCHAR(50)
);

CREATE TABLE Vuelos (
    Codigo INT PRIMARY KEY,
    fecha_salida DATE,
    hora_salida TIME,
    fecha_llegada DATE,
    hora_llegada TIME,
    aeropuerto_llegada INT,
    codigo_avion INT,
    FOREIGN KEY (aeropuerto_llegada) REFERENCES Aeropuertos(Codigo),
    FOREIGN KEY (codigo_avion) REFERENCES Aviones(Codigo)
);

CREATE TABLE Asientos (
    Codigo_fila INT,
    Codigo_columna INT,
    Codigo_planta INT,
    codigo_avion INT,
    PRIMARY KEY (Codigo_fila, Codigo_columna, Codigo_planta),
    FOREIGN KEY (codigo_avion) REFERENCES Aviones(Codigo)
);

CREATE TABLE Tarjetas_de_embarque (
    Codigo_tarjeta INT PRIMARY KEY,
    DNI_clientes INT,
    Codigo_fila_asientos INT,
    Codigo_columna_asientos INT,
    Codigo_planta_asientos INT,
    FOREIGN KEY (DNI_clientes) REFERENCES Clientes(DNI),
    FOREIGN KEY (Codigo_fila_asientos, Codigo_columna_asientos, Codigo_planta_asientos) REFERENCES Asientos(Codigo_fila, Codigo_columna, Codigo_planta)
);
