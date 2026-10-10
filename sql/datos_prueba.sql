-- =========================================================
-- MascotasTest - Datos de prueba
--
-- Importar DESPUES de sql/mascotatest.sql
--   phpMyAdmin -> base de datos mascotatest -> Importar
--   o por consola:
--     /opt/lampp/bin/mysql -u root < sql/datos_prueba.sql
--
-- Contenido: 50 usuarios y 50 mascotas (una por usuario).
-- Contrasena de todos los usuarios: clave1234
--   usuario: ciudadano01@correo.com  ...  ciudadano50@correo.com
-- =========================================================

USE mascotatest;

-- Se borra cualquier dato previo para empezar limpio.
-- Se usa DELETE y no TRUNCATE porque usuarios esta referenciada
-- por una foreign key desde mascotas y MySQL no permite TRUNCATE.
DELETE FROM mascotas;
DELETE FROM usuarios;
ALTER TABLE mascotas  AUTO_INCREMENT = 1;
ALTER TABLE usuarios   AUTO_INCREMENT = 1;

-- -----------------------------------------------------------------
-- Usuarios (ciudadanos)
-- -----------------------------------------------------------------
INSERT INTO usuarios (id, nombre, correo, password, creado_at) VALUES  (1, 'Ana Giraldo', 'ciudadano01@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-09-01 08:00:00'),
  (2, 'Luis Fernandez', 'ciudadano02@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-09-02 09:07:00'),
  (3, 'Carlos Mendoza', 'ciudadano03@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-09-03 10:14:00'),
  (4, 'Maria Rojas', 'ciudadano04@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-09-04 11:21:00'),
  (5, 'Jorge Velasquez', 'ciudadano05@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-09-05 12:28:00'),
  (6, 'Laura Torres', 'ciudadano06@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-09-06 13:35:00'),
  (7, 'Andres Castillo', 'ciudadano07@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-09-07 14:42:00'),
  (8, 'Sofia Ramirez', 'ciudadano08@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-09-08 15:49:00'),
  (9, 'Miguel Arias', 'ciudadano09@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-09-09 16:56:00'),
  (10, 'Daniel Quintero', 'ciudadano10@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-09-10 17:03:00'),
  (11, 'Juan Molina', 'ciudadano11@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-09-11 08:10:00'),
  (12, 'Veronica Ortiz', 'ciudadano12@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-09-12 09:17:00'),
  (13, 'Camilo Restrepo', 'ciudadano13@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-09-13 10:24:00'),
  (14, 'Paula Salazar', 'ciudadano14@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-09-14 11:31:00'),
  (15, 'Sebastian Villa', 'ciudadano15@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-09-15 12:38:00'),
  (16, 'Carolina Acosta', 'ciudadano16@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-09-16 13:45:00'),
  (17, 'Fernando Lozano', 'ciudadano17@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-09-17 14:52:00'),
  (18, 'Diana Marquez', 'ciudadano18@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-09-18 15:59:00'),
  (19, 'Ricardo Pena', 'ciudadano19@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-09-19 16:06:00'),
  (20, 'Claudia Herrera', 'ciudadano20@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-09-20 17:13:00'),
  (21, 'Eduardo Zapata', 'ciudadano21@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-09-21 08:20:00'),
  (22, 'Marcela Vargas', 'ciudadano22@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-09-22 09:27:00'),
  (23, 'Julio Moreno', 'ciudadano23@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-09-23 10:34:00'),
  (24, 'Natalia Cortes', 'ciudadano24@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-09-24 11:41:00'),
  (25, 'Oscar Prieto', 'ciudadano25@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-09-25 12:48:00'),
  (26, 'Luz Rios', 'ciudadano26@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-09-26 13:55:00'),
  (27, 'Hector Bonilla', 'ciudadano27@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-09-27 14:02:00'),
  (28, 'Adriana Gallardo', 'ciudadano28@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-09-28 15:09:00'),
  (29, 'Mauricio Silva', 'ciudadano29@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-09-29 16:16:00'),
  (30, 'Teresa Londo', 'ciudadano30@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-09-30 17:23:00'),
  (31, 'Olga Mancera', 'ciudadano31@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-10-01 08:30:00'),
  (32, 'Ivan Duarte', 'ciudadano32@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-10-02 09:37:00'),
  (33, 'Valentina Ruiz', 'ciudadano33@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-10-03 10:44:00'),
  (34, 'German Palacio', 'ciudadano34@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-10-04 11:51:00'),
  (35, 'Beatriz Espinosa', 'ciudadano35@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-10-05 12:58:00'),
  (36, 'Rodrigo Castano', 'ciudadano36@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-10-06 13:05:00'),
  (37, 'Camila Naranjo', 'ciudadano37@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-10-07 14:12:00'),
  (38, 'Esteban Barraza', 'ciudadano38@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-10-08 15:19:00'),
  (39, 'Ximena Medina', 'ciudadano39@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-10-09 16:26:00'),
  (40, 'Alberto Correa', 'ciudadano40@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-10-10 17:33:00'),
  (41, 'Sandra Pardo', 'ciudadano41@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-10-11 08:40:00'),
  (42, 'Yolanda Escobar', 'ciudadano42@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-10-12 09:47:00'),
  (43, 'Nelson Toro', 'ciudadano43@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-10-13 10:54:00'),
  (44, 'Gloria Montoya', 'ciudadano44@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-10-14 11:01:00'),
  (45, 'Ramiro Wilches', 'ciudadano45@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-10-15 12:08:00'),
  (46, 'Pilar Zambrano', 'ciudadano46@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-10-16 13:15:00'),
  (47, 'Fabian Bermudez', 'ciudadano47@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-10-17 14:22:00'),
  (48, 'Monica Cepeda', 'ciudadano48@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-10-18 15:29:00'),
  (49, 'Diego Fuentes', 'ciudadano49@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-10-19 16:36:00'),
  (50, 'Julia Ocampo', 'ciudadano50@correo.com', '$2y$10$02DOaJm9hAmYtVLvkg2Xa.6zQHWFAjtEALpG1sHFPTYLqkZE4ODR.', '2026-10-20 17:43:00');

-- -----------------------------------------------------------------
-- Mascotas (una por usuario)
-- -----------------------------------------------------------------
INSERT INTO mascotas (usuario_id, nombre, especie, raza, creado_at) VALUES  (1, 'Firulais', 'perro', 'Criollo', '2026-09-01 08:05:00'),
  (2, 'Michi', 'gato', 'Siames', '2026-09-02 09:12:00'),
  (3, 'Rocky', 'perro', 'Labrador', '2026-09-03 10:19:00'),
  (4, 'Simba', 'gato', 'Persa', '2026-09-04 11:26:00'),
  (5, 'Max', 'perro', 'Pastor Aleman', '2026-09-05 12:33:00'),
  (6, 'Luna', 'gato', 'Criollo', '2026-09-06 13:40:00'),
  (7, 'Bella', 'perro', 'Bulldog', '2026-09-07 14:47:00'),
  (8, 'Garfield', 'gato', 'Bengal', '2026-09-08 15:54:00'),
  (9, 'Canela', 'perro', 'Poodle', '2026-09-09 17:01:00'),
  (10, 'Nube', 'gato', 'Maine Coon', '2026-09-10 17:08:00'),
  (11, 'Roco', 'perro', 'Golden Retriever', '2026-09-11 08:15:00'),
  (12, 'Cielo', 'gato', 'Ragdoll', '2026-09-12 09:22:00'),
  (13, 'Toby', 'perro', 'Beagle', '2026-09-13 10:29:00'),
  (14, 'Bigotito', 'gato', 'British Shorthair', '2026-09-14 11:36:00'),
  (15, 'Bruno', 'perro', 'Boxer', '2026-09-15 12:43:00'),
  (16, 'Mimoso', 'gato', 'Burmese', '2026-09-16 13:50:00'),
  (17, 'Paco', 'perro', 'Dachshund', '2026-09-17 14:57:00'),
  (18, 'Chiquis', 'gato', 'Habana', '2026-09-18 16:04:00'),
  (19, 'Otto', 'perro', 'Husky', '2026-09-19 16:11:00'),
  (20, 'Copito', 'gato', 'Angora', '2026-09-20 17:18:00'),
  (21, 'Lucky', 'perro', 'Pincher', '2026-09-21 08:25:00'),
  (22, 'Salem', 'gato', 'Norwegian Forest', '2026-09-22 09:32:00'),
  (23, 'Chispa', 'perro', 'Samoyedo', '2026-09-23 10:39:00'),
  (24, 'Tigris', 'gato', 'Manx', '2026-09-24 11:46:00'),
  (25, 'Chocolate', 'perro', 'Rottweiler', '2026-09-25 12:53:00'),
  (26, 'Zoe', 'gato', 'Devon Rex', '2026-09-26 14:00:00'),
  (27, 'Bambino', 'perro', 'Shih Tzu', '2026-09-27 14:07:00'),
  (28, 'Kira', 'gato', 'Cornish Rex', '2026-09-28 15:14:00'),
  (29, 'Tarzan', 'perro', 'Pomerania', '2026-09-29 16:21:00'),
  (30, 'Mora', 'gato', 'Turkish Angora', '2026-09-30 17:28:00'),
  (31, 'Zeus', 'perro', 'Mastin', '2026-10-01 08:35:00'),
  (32, 'Nala', 'gato', 'Chartreux', '2026-10-02 09:42:00'),
  (33, 'Oso', 'perro', 'Caniche', '2026-10-03 10:49:00'),
  (34, 'Cleo', 'gato', 'Tonkinese', '2026-10-04 11:56:00'),
  (35, 'Pelusa', 'perro', 'Collie', '2026-10-05 13:03:00'),
  (36, 'Mila', 'gato', 'Birman', '2026-10-06 13:10:00'),
  (37, 'Nimbo', 'perro', 'Pointer', '2026-10-07 14:17:00'),
  (38, 'Pipa', 'gato', 'Exotic Shorthair', '2026-10-08 15:24:00'),
  (39, 'Rayo', 'perro', 'Schnauzer', '2026-10-09 16:31:00'),
  (40, 'Sisi', 'gato', 'Oriental', '2026-10-10 17:38:00'),
  (41, 'Sultan', 'perro', 'Border Collie', '2026-10-11 08:45:00'),
  (42, 'Vitrina', 'gato', 'Selkirk Rex', '2026-10-12 09:52:00'),
  (43, 'Bigotes', 'perro', 'Akita', '2026-10-13 10:59:00'),
  (44, 'Yuki', 'gato', 'Lykoi', '2026-10-14 11:06:00'),
  (45, 'Nicanor', 'perro', 'Chow Chow', '2026-10-15 12:13:00'),
  (46, 'Zafiro', 'gato', 'Khao Manee', '2026-10-16 13:20:00'),
  (47, 'Botas', 'perro', 'Weimaraner', '2026-10-17 14:27:00'),
  (48, 'Cachito', 'gato', 'Peterbald', '2026-10-18 15:34:00'),
  (49, 'Candil', 'perro', 'Dogo Argentino', '2026-10-19 16:41:00'),
  (50, 'Raton', 'gato', 'Snowshoe', '2026-10-20 17:48:00');
