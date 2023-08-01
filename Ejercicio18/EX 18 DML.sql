INSERT INTO clientes (DNI, nombre, apellidos, teléfono_fijo, móvil, código_personal)
VALUES ('6347856B', 'Jose', 'Garcia', 4326566, 4256343, 1);

INSERT INTO trabajadores (DNI, nombre, apellidos, teléfono_fijo, móvil, código_personal, DNI_clientes)
VALUES ('3652775C', 'Javier', 'Renzo', 64637378, 5325246, 2, '6347856B');

INSERT INTO inmuebles (código_inmueble, metros, descripción, dirección)
VALUES (1, 100.5, 'Apartmento', 'Calle principal 1');

INSERT INTO locales (código_local, uso, tieneServicio, código_inmuebles)
VALUES (1, 'Comercial', true, 1);

INSERT INTO pisos (código_especial, código_inmuebles)
VALUES (1, 1);

INSERT INTO garajes (código_local, número_garaje, planta, código_inmuebles, código_piso)
VALUES (1, 1, 1, 1, 1);

INSERT INTO titulares (titularID, nombre, apellidos)
VALUES (1, 'Maria', 'Judith');

INSERT INTO comprar (código_compra, fecha, valor_compra, DNI_clientes, código_inmuebles, titularID)
VALUES (1, '2023-08-01', 200000, '6347856B', 1, 1);

INSERT INTO pagos (código_pago_alquiler, año, mes, valor, número_alquiler, nombre_agente, DNI_clientes, código_inmuebles)
VALUES (1, 2023, 8, 1000, 1, ' Efraín', '6347856B', 1);

UPDATE clientes SET nombre = 'Abraham' WHERE DNI = '6347856B';
UPDATE inmuebles SET metros = 120.5 WHERE código_inmueble = 1;

DELETE FROM clientes WHERE DNI = '3652775C';

SELECT * FROM clientes;
SELECT * FROM trabajadores;
SELECT * FROM inmuebles;
SELECT * FROM locales;
SELECT * FROM garajes;
SELECT * FROM titulares;
SELECT * FROM comprar;
SELECT * FROM pagos;

