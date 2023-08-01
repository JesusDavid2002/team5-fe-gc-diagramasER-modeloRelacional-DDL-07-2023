INSERT INTO Usuarios (id_usuario, contraseña, direccion, nombre, apellidos, telefono, email, foto)
VALUES
  (1, 'CONTraseña155$', 'Calle principal 1', 'Juan', 'Perez', '66416572', 'juanP@gmail.com', 'Juan.jpg'),
  (2, 'celebridadContraseña1', 'Avenida celebridad 2', 'Pablo', 'Sanchez', '62567346', 'PabloSanchez@gmail.com', 'Sanchez.jpg');

INSERT INTO Celebridades (id_celebridad, contraseña_celebridad, nombre, apellidos, foto, id_usuario, contraseña)
VALUES
  (101, 'celeb123', 'Juan', 'Perez', 'PerezCelebridad.jpg', 1, 'CONTraseña155$'),
  (102, 'celeb456', 'Pablo', 'Sanchez', 'SanchezCelebridad.jpg', 2, 'celebridadContraseña1');

INSERT INTO Publicaciones (id_publicacion, visibilidad, texto, imagen, id_usuario, contraseña)
VALUES
  (1001, 'publico', 'Hola mundo!', 'Hola.jpg', 1, 'CONTraseña155$'),
  (1002, 'privado', 'Post privado.', 'CelebridadPost.jpg', 2, 'celebridadContraseña1');

INSERT INTO Contactos (id_contacto, comentario, id_usuario)
VALUES
  (201, 'Conocido de un evento', 2),
  (202, 'Viejo amigo', 1);

INSERT INTO Grupos (id_grupo, nombre, id_usuario, contraseña, id_contacto)
VALUES
  (301, 'Art Club', 2, 'celebridadContraseña1', 201),
  (302, 'Colegas de trabajo', 1, 'CONTraseña155$', 202);

INSERT INTO Usuarios_bloqueados (id_usuario_bloqueado, id_usuario)
VALUES
  (401, 2);

UPDATE Usuarios
SET telefono = '66221133'
WHERE id_usuario = 1;

UPDATE Grupos
SET id_contacto = NULL
WHERE id_contacto = 201;

DELETE FROM Contactos
WHERE id_contacto = 201;

SELECT * FROM Usuarios;
SELECT * FROM Celebridades;
SELECT * FROM Publicaciones;
SELECT * FROM Contactos;
SELECT * FROM Grupos;
SELECT * FROM Usuarios_bloqueados;

