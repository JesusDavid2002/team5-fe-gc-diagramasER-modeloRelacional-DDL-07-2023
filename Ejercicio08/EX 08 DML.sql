INSERT INTO Clientes (DNI, nombre, apellidos, direccion, telefono, tarjeta_credito)
VALUES
    (123456789, 'Juan', 'Perez', 'Calle Principal 7', '6251324', '6467-2023-4357-9452'),
    (987654321, 'Maria', 'Gomez', 'Avenida Central 42', '6455629', '3214-2023-3421-7163'),
    (536452317, 'Pedro', 'Lopez', 'Plaza San jose 1', '6479851', '3425-2023-6702-7451');

INSERT INTO Aviones (Codigo, numero_plazas)
VALUES
    (101, 220),
    (102, 160),
    (103, 135);

INSERT INTO Aeropuertos (Codigo, nombre, localidad, pais)
VALUES
    (1001, 'Aeropuerto Internacional BRC 1', 'Barcelona', 'España'),
    (1002, 'Aeropuerto Nacional MDR 2', 'Madrid', 'España'),
    (1003, 'Aeropuerto Local ALB 3', 'Albacete', 'España');

INSERT INTO Vuelos (Codigo, fecha_salida, hora_salida, fecha_llegada, hora_llegada, aeropuerto_llegada, codigo_avion)
VALUES
    (10001, '2023-08-10', '10:00:00', '2023-08-10', '12:00:00', 1001, 101),
    (10002, '2023-08-11', '15:30:00', '2023-08-11', '18:00:00', 1002, 102),
    (10003, '2023-08-12', '09:45:00', '2023-08-12', '11:30:00', 1003, 103);

INSERT INTO Asientos (Codigo_fila, Codigo_columna, Codigo_planta, codigo_avion) VALUES
    (1, 1, 1, 101),
    (1, 2, 1, 101),
    (2, 1, 1, 101),
    (2, 2, 1, 101),
    (3, 1, 1, 101),
    (3, 2, 1, 101),
    (4, 1, 1, 101),
    (1, 1, 2, 102),
    (1, 2, 2, 102),
    (1, 3, 2, 102),
    (2, 1, 2, 102),
    (2, 2, 2, 102),
    (1, 1, 3, 103),
    (1, 2, 3, 103),
    (2, 1, 3, 103);

INSERT INTO Tarjetas_de_embarque (Codigo_tarjeta, DNI_clientes, Codigo_fila_asientos, Codigo_columna_asientos, Codigo_planta_asientos)
VALUES
    (5001, 123456789, 1, 1, 1),
    (5002, 987654321, 2, 2, 1),
    (5003, 536452317, 1, 1, 1),
    (5004, 123456789, 2, 1, 1);


UPDATE Clientes
SET telefono = '6466221'
WHERE DNI = 987654321;

UPDATE Aviones
SET numero_plazas = 180
WHERE Codigo = 102;

DELETE FROM Vuelos
WHERE Codigo = 10003;


SELECT * FROM Clientes;
SELECT * FROM Aviones;
SELECT * FROM Aeropuertos;
SELECT * FROM Vuelos;
SELECT * FROM Asientos;
SELECT * FROM Tarjetas_de_embarque;
