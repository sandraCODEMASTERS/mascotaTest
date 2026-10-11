<?php
/**
 * MascotasTest - Conexion a la base de datos MySQL (XAMPP local o produccion)
 */

// Si existe config_local.php (credenciales de InfinityFree), se usan esas.
// Si no existe, se usan las de XAMPP local.
$config_local = __DIR__ . "/config_local.php";
if (file_exists($config_local)) {
    require_once $config_local;
}

$host = defined("DB_HOST") ? DB_HOST : "localhost";
$user = defined("DB_USER") ? DB_USER : "root";
$pass = defined("DB_PASS") ? DB_PASS : "";
$db   = defined("DB_NAME") ? DB_NAME : "mascotatest";

$conexion = mysqli_connect($host, $user, $pass, $db);

if (!$conexion) {
    die("Error de conexion a la base de datos: " . mysqli_connect_error());
}

mysqli_set_charset($conexion, "utf8mb4");
