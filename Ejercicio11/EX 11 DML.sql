INSERT INTO Paises (id_paises, nombre, extension, poblacion)
VALUES (1, 'España', 505990, 47329000);

INSERT INTO AccidentesGeograficos (id_accidente, posicion_horizontal, posicion_vertical, nombre, id_paises)
VALUES (1, 40.4168, -3.7038, 'Madrid', 1);

INSERT INTO AccidentesGeograficos (id_accidente, posicion_horizontal, posicion_vertical, nombre, id_paises)
VALUES (2, 41.3851, 2.1734, 'Barcelona', 1);

INSERT INTO Rios (id_rios, longitud, id_accidente)
VALUES (1, 925, 2);

INSERT INTO Montañas (id_montañas, altura, id_accidente)
VALUES (1, 3482, 1);

INSERT INTO Lagos (id_lagos, extension, id_accidente)
VALUES (1, 367.86, 2);

INSERT INTO Localidades (id_localidades, nombre, id_paises)
VALUES (1, 'Sevilla', 1);

INSERT INTO RiosLocalidades (id_localidades, id_rios)
VALUES (1, 1);

UPDATE Paises
SET poblacion = 47000000
WHERE id_paises = 1;

UPDATE Montañas
SET altura = 3718
WHERE id_montañas = 1;

DELETE FROM Localidades
WHERE id_localidades = 1;

SELECT * FROM Paises;
SELECT * FROM AccidentesGeograficos;
SELECT * FROM Rios;
SELECT * FROM Montañas;
SELECT * FROM Lagos;
SELECT * FROM Localidades;
SELECT * FROM RiosLocalidades;

