<?php
/**
 * MascotasTest - Cierre de sesion
 */

require_once __DIR__ . "/includes/sesion.php";

unset($_SESSION['usuario_id'], $_SESSION['usuario_nombre']);
session_destroy();

header("Location: login.php?salir=1");
exit;
