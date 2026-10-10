<?php
/**
 * MascotasTest - Conexion a la base de datos MySQL de XAMPP
 */

$host = "localhost";
$user = "root";
$pass = "";
$db   = "mascotatest";

$conexion = mysqli_connect($host, $user, $pass, $db);

if (!$conexion) {
    die("Error de conexion a la base de datos: " . mysqli_connect_error());
}

mysqli_set_charset($conexion, "utf8mb4");
