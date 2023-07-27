-- INSERT
-- Insertamos data a las tablas
INSERT INTO Profesores (DNI, nombre, apellidos, telefono, direccion)
VALUES 
	('12345678A', 'Juan', 'Gomez', '123456789', 'Calle Mayor 123'),
	('34567890B', 'Pablo', 'Ramirez', '987654321', 'Calle Menor 321'),
	('56789012C', 'Laura', 'García', '456789012', 'Avenida Principal 789');

INSERT INTO Cursos (Codigo, programa_curso, hora_duracion, titulo, fecha_inicio, fecha_final, DNI_profesores)
VALUES 
	(1, 'Programación en SQL', 40, 'Curso de Bases de Datos', '2023-08-01', '2023-10-30', '12345678A'),
	(2, 'Introducción a Python', 30, 'Curso de Programación', '2023-09-01', '2023-09-30', '34567890B'),
	(3, 'Diseño Gráfico', 50, 'Curso de Creatividad', '2023-10-15', '2023-12-15', '56789012C'),
	(4, 'Inteligencia Artificial', 60, 'Curso Avanzado', '2023-11-01', '2024-01-31', '34567890B'),
	(5, 'Marketing Digital', 35, 'Curso de Estrategias', '2024-01-15', '2024-02-28', '12345678A');

INSERT INTO Alumnos (DNI, direccion, telefono, edad, esTrabajador)
VALUES 
	('98765432B', 'Avenida Principal 456', '987654321', 30, true),
	('23456789D', 'Calle Secundaria 789', '789012345', 25, false),
	('45678901E', 'Avenida Comercial 123', '012345678', 28, true);

INSERT INTO Asistir (Codigo_cursos, DNI_alumnos, nota)
VALUES 
	(1, '98765432B', 7.5),
	(2, '23456789D', 8.0),
	(3, '98765432B', 6.8),
	(4, '45678901E', 9.2),
	(5, '23456789D', 7.0);

INSERT INTO Empresas (CIF, nombre, direccion, telefono, DNI_alumnos)
VALUES 
	('ABC123', 'Empresa ABC', 'Calle Comercial 789', '654321987', '98765432B'),
	('DEF456', 'Empresa Twinte', 'Avenida Industrial 321', '987654321', '23456789D');

-- UPDATE
-- Actualizar dirección de un profesor
UPDATE Profesores
SET direccion = 'Calle Nueva 456'
WHERE DNI = '12345678A';

UPDATE Cursos
SET titulo = 'Curso de Desarrollo Web', fecha_final = '2023-11-15'
WHERE Codigo = 5;

UPDATE Alumnos
SET telefono = '9876543210', edad = 32
WHERE DNI = '98765432B';

UPDATE Asistir
SET nota = 9.0
WHERE Codigo_cursos = 1 AND DNI_alumnos = '98765432B';

UPDATE Empresas
SET nombre = 'Empresa Skyble'
WHERE CIF = 'ABC123';

-- DELETE
-- Usaremos delete para borrar datos que no queramos
DELETE FROM Profesores
WHERE DNI = '34567890B';

DELETE FROM Cursos
WHERE Codigo = 5;

DELETE FROM Alumnos
WHERE DNI = '45678901E';

DELETE FROM Asistir
WHERE DNI_alumnos = '45678901E';

DELETE FROM Empresas
WHERE CIF = 'DEF456';

-- SELECT
-- Hacemos select de todas las tablas para comprobar sus datos
SELECT * FROM ejercicio02.Profesores;
SELECT * FROM ejercicio02.Cursos;
SELECT * FROM ejercicio02.Alumnos;
SELECT * FROM ejercicio02.Asistir;
SELECT * FROM ejercicio02.Empresas;