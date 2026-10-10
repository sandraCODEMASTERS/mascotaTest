<?php
/**
 * MascotasTest - Encabezado comun de las pantallas
 * Las paginas deben definir $pagina antes de incluir este archivo.
 */

require_once __DIR__ . "/sesion.php";

$pagina = $pagina ?? "";
$nombreUsuario = usuario_logueado() ? $_SESSION['usuario_nombre'] : "";
$iniciales = "";

if ($nombreUsuario !== "") {
    $partes    = explode(" ", $nombreUsuario);
    $iniciales = mb_strtoupper(
        mb_substr($partes[0], 0, 1) . (isset($partes[1]) ? mb_substr($partes[1], 0, 1) : "")
    );
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title><?= $nombrePagina ?? "MascotasTest" ?> | MascotasTest</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body>

  <header>
    <div class="contenedor">
      <div class="marca">
        <div class="logo">MT</div>
        <div>
          <h1>MascotasTest</h1>
          <span>Alcaldia de la ciudad</span>
        </div>
      </div>
      <nav>
        <ul>
          <li><a href="index.html" class="<?= $pagina === "inicio" ? "activo" : "" ?>">Inicio</a></li>
          <li><a href="servicios.html" class="<?= $pagina === "servicios" ? "activo" : "" ?>">Servicios</a></li>

          <?php if (usuario_logueado()): ?>
            <li><a href="mis-mascotas.php" class="<?= $pagina === "mascotas" ? "activo" : "" ?>">Mis mascotas</a></li>
            <li><a href="perfil.php" class="<?= $pagina === "perfil" ? "activo" : "" ?>">Perfil</a></li>
            <li><a href="logout.php">Salir (<?= htmlspecialchars($nombreUsuario) ?>)</a></li>
          <?php else: ?>
            <li><a href="login.php" class="<?= $pagina === "login" ? "activo" : "" ?>">Login</a></li>
            <li><a href="registro.php" class="<?= $pagina === "registro" ? "activo" : "" ?>">Registro</a></li>
          <?php endif; ?>
        </ul>
      </nav>
    </div>
  </header>

  <main>
