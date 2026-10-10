<?php
/**
 * MascotasTest - Manejo de la sesion del usuario
 */

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

/** Indica si hay un usuario con sesion iniciada. */
function usuario_logueado()
{
    return isset($_SESSION['usuario_id']);
}

/** Protege las paginas privadas: sin sesion, vuelve al login. */
function proteger()
{
    if (!usuario_logueado()) {
        header("Location: login.php");
        exit;
    }
}

/** Consulta los datos del usuario de la sesion. */
function datos_usuario()
{
    global $conexion;

    $stmt = mysqli_prepare($conexion, "SELECT id, nombre, correo FROM usuarios WHERE id = ?");
    mysqli_stmt_bind_param($stmt, "i", $_SESSION['usuario_id']);
    mysqli_stmt_execute($stmt);

    $fila = mysqli_stmt_get_result($stmt)->fetch_assoc();
    mysqli_stmt_close($stmt);

    return $fila;
}

/** Inicia la sesion del usuario. */
function iniciar_sesion($id, $nombre)
{
    session_regenerate_id(true);
    $_SESSION['usuario_id']    = $id;
    $_SESSION['usuario_nombre'] = $nombre;
}
