-- =========================================================
-- MascotasTest - Base de datos
-- Importar desde phpMyAdmin (pestana SQL) o con:
--   /opt/lampp/bin/mysql -u root < sql/mascotatest.sql
-- =========================================================

CREATE DATABASE IF NOT EXISTS mascotatest
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE mascotatest;

DROP TABLE IF EXISTS mascotas;
DROP TABLE IF EXISTS usuarios;

CREATE TABLE usuarios (
  id        INT AUTO_INCREMENT PRIMARY KEY,
  nombre    VARCHAR(100) NOT NULL,
  correo    VARCHAR(120) NOT NULL UNIQUE,
  password  VARCHAR(255) NOT NULL,
  creado_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE mascotas (
  id         INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT NOT NULL,
  nombre     VARCHAR(100) NOT NULL,
  especie    ENUM('perro', 'gato') NOT NULL,
  raza       VARCHAR(100) NOT NULL,
  creado_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_mascotas_usuario
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
