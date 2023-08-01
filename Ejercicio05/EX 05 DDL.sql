USE ejercicio05;

CREATE TABLE Almacenes (
  numero INT PRIMARY KEY,
  descripcion VARCHAR(100),
  direccion VARCHAR(200)
);

CREATE TABLE Piezas (
  tipo INT,
  modelo INT,
  descripcion VARCHAR(100),
  precio DECIMAL(10, 2),
  tipo_2 INT,
  modelo_2 INT,
  PRIMARY KEY (tipo, modelo),
  FOREIGN KEY (tipo_2, modelo_2) REFERENCES Piezas(tipo, modelo)
);

CREATE TABLE Estanterias (
  id_estanteria INT PRIMARY KEY,
  nombre VARCHAR(100),
  numero_almacen INT,
  FOREIGN KEY (numero_almacen) REFERENCES Almacenes(numero)
);

CREATE TABLE Guardar (
  tipo INT,
  modelo INT,
  id_estanteria INT,
  PRIMARY KEY (tipo, modelo, id_estanteria),
  FOREIGN KEY (tipo, modelo) REFERENCES Piezas(tipo, modelo),
  FOREIGN KEY (id_estanteria) REFERENCES Estanterias(id_estanteria)
);
