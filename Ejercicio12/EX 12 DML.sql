SELECT * FROM ejercicio12.trabajadores;
INSERT INTO ejercicio12.trabajadores VALUES 
('99954524D', 54, 'Juan', 'Martinez Pérez'),
('89763214X', 21, 'Maria', 'Gomez Rodriguez'),
('74568932A', 36, 'Pedro', 'Lopez Fernandez'),
('36547892B', 45, 'Laura', 'Garcia Sanchez'),
('45678901C', 63, 'Ana', 'Fernandez Lopez');
DELETE FROM ejercicio12.trabajadores WHERE DNI='99954524D';

SELECT * FROM ejercicio12.empresas;
INSERT INTO ejercicio12.empresas VALUES 
('4512545FDC', 408, 'Grupo Castilla', 'Riudoms, Tarragona', 977586568),
('5412587AFG', 120, 'Implika', 'Barcelona, Barcelona', 977123547),
('3512987ABC', 202, 'Tech Solutions', '123 Main St, Anytown', 551234567),
('9587612XYZ', 512, 'Global Widgets Inc.', '456 Elm St, Metropolis', 99876543),
('7894561LMN', 315, 'Superior Services Co.', '789 Oak Ave, Cityville', 1112223333);
UPDATE ejercicio12.empresas SET codigo_interno=codigo_interno+20 LIMIT 2;

SELECT * FROM ejercicio12.proyectos;
REPLACE INTO ejercicio12.proyectos (ID_proyecto, fecha_inicio, fecha_fin, fecha_prevista, dia, CIF_empresas) VALUES 
(124, '2020-05-12', '2021-11-05', '2021-11-10', '12', '4512545FDC'),
(510, '2019-08-20', '2022-12-25', '2022-11-30', '20', '3512987ABC'),
(50, '2023-10-08', '2025-07-30', '2025-08-10', '08', '5412587AFG');
INSERT INTO ejercicio12.proyectos VALUES (200, '2020-05-12', '2022-07-05', '2022-10-10', '12', 124, '7894561LMN');
DELETE FROM ejercicio12.proyectos WHERE ID_proyecto='124';

SELECT * FROM ejercicio12.profesiones;
INSERT INTO ejercicio12.profesiones (codigo_profesion, descripcion, DNI_trabajadores, ID_proyectos) VALUES 
(20, 'analista', '99954524D', 124),
(05, 'jefe', '99954524D', 50),
(01, 'programador', '89763214X', 50),
(01, 'programador', '74568932A', 510),
(20, 'analista', '45678901C', 200);
UPDATE ejercicio12.profesiones SET codigo_profesion=22 WHERE id=1 OR id=5;
DELETE FROM ejercicio12.profesiones WHERE id=2;

SELECT * FROM ejercicio12.participar;
INSERT INTO ejercicio12.participar (hora_proyecto, DNI_trabajadores, ID_proyectos) VALUES
(100, '99954524D', 124),
(150, '99954524D', 200),
(42, '89763214X', 50),
(65, '74568932A', 510),
(74, '45678901C', 200);
DELETE FROM ejercicio12.participar WHERE id=2;

SELECT * FROM ejercicio12.realizar;
INSERT INTO ejercicio12.realizar (CIF_empresas, ID_proyectos) VALUES 
('4512545FDC', 124),
('7894561LMN', 200),
('3512987ABC', 510),
('5412587AFG', 50);
