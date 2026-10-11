-- =========================================================
-- MascotasTest - Esquema para importar en phpMyAdmin de InfinityFree
-- 1. Crear la base desde "MySQL Databases" en el panel
-- 2. Abrir phpMyAdmin y seleccionar esa base
-- 3. Pestana Import > elegir este archivo > Go
-- (No incluye CREATE DATABASE ni USE)
-- =========================================================

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
