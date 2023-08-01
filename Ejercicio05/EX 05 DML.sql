ALTER TABLE Piezas DROP FOREIGN KEY Piezas_ibfk_1;

INSERT INTO Almacenes (numero, descripcion, direccion)
VALUES
  (1, 'Almacén Amazon', 'Calle Principal 123'),
  (2, 'Almacén Google', 'Avenida Norte 456'),
  (3, 'Almacén Madrid', 'Calle Sur 789');

INSERT INTO Piezas (tipo, modelo, descripcion, precio, tipo_2, modelo_2)
VALUES
  (101, 1, 'Pieza A1', 10.50, 101, 2),
  (101, 2, 'Pieza B2', 15.75, 102, 1),
  (102, 1, 'Pieza C3', 20.00, 101, 1),
  (102, 2, 'Pieza D4', 8.90, 102, 2);

INSERT INTO Estanterias (id_estanteria, nombre, numero_almacen)
VALUES
  (1, 'Estantería num 1', 1),
  (2, 'Estantería num 2', 1),
  (3, 'Estantería num 3', 2),
  (4, 'Estantería num 4', 3);

INSERT INTO Guardar (tipo, modelo, id_estanteria)
VALUES
  (101, 1, 1),
  (101, 2, 2),
  (102, 1, 3),
  (102, 2, 4);

UPDATE Almacenes
SET descripcion = 'Nuevo Almacén de amazon', direccion = 'Avenida Principal 789'
WHERE numero = 1;

UPDATE Piezas
SET precio = 12.99
WHERE tipo = 101 AND modelo = 1;

DELETE FROM Guardar WHERE id_estanteria = 3;
DELETE FROM Estanterias WHERE id_estanteria = 3;

ALTER TABLE Piezas ADD CONSTRAINT Piezas_ibfk_1 FOREIGN KEY (tipo_2, modelo_2) REFERENCES Piezas(tipo, modelo);
SELECT * FROM Almacenes;
SELECT * FROM Piezas;
SELECT * FROM Estanterias;
SELECT * FROM Guardar;
