USE ejercicio14;

CREATE TABLE Usuarios (
  id_usuario INT PRIMARY KEY,
  contraseña VARCHAR(255),
  direccion VARCHAR(255),
  nombre VARCHAR(50),
  apellidos VARCHAR(50),
  telefono VARCHAR(15),
  email VARCHAR(60),
  foto VARCHAR(255),
  INDEX idx_usuario_contraseña (id_usuario, contraseña)
);

CREATE TABLE Celebridades (
  id_celebridad INT PRIMARY KEY,
  contraseña_celebridad VARCHAR(255),
  nombre VARCHAR(50),
  apellidos VARCHAR(50),
  foto VARCHAR(255),
  id_usuario INT,
  contraseña VARCHAR(255),
  FOREIGN KEY (id_usuario, contraseña) REFERENCES Usuarios(id_usuario, contraseña)
);

CREATE TABLE Publicaciones (
  id_publicacion INT PRIMARY KEY,
  visibilidad VARCHAR(10),
  texto TEXT,
  imagen VARCHAR(255),
  id_usuario INT,
  contraseña VARCHAR(255),
  FOREIGN KEY (id_usuario, contraseña) REFERENCES Usuarios(id_usuario, contraseña)
);

CREATE TABLE Contactos (
  id_contacto INT PRIMARY KEY,
  comentario TEXT,
  id_usuario INT,
  FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE Grupos (
  id_grupo INT PRIMARY KEY,
  nombre VARCHAR(50),
  id_usuario INT,
  contraseña VARCHAR(255),
  id_contacto INT,
  FOREIGN KEY (id_usuario, contraseña) REFERENCES Usuarios(id_usuario, contraseña),
  FOREIGN KEY (id_contacto) REFERENCES Contactos(id_contacto)
);

CREATE TABLE Usuarios_bloqueados (
  id_usuario_bloqueado INT PRIMARY KEY,
  id_usuario INT,
  FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);
