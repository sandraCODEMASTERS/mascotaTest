<?php
/**
 * MascotasTest - Pantalla de Login
 */

require_once __DIR__ . "/conexion.php";
require_once __DIR__ . "/includes/sesion.php";

if (usuario_logueado()) {
    header("Location: mis-mascotas.php");
    exit;
}

$error = "";
$correo = "";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $correo    = trim($_POST["correo"]);
    $password  = $_POST["password"] ?? "";

    if ($correo === "" || $password === "") {
        $error = "Ingresa tu correo y tu contrasena.";
    } else {
        $stmt = mysqli_prepare($conexion, "SELECT id, nombre, password FROM usuarios WHERE correo = ?");
        mysqli_stmt_bind_param($stmt, "s", $correo);
        mysqli_stmt_execute($stmt);
        $fila = mysqli_stmt_get_result($stmt)->fetch_assoc();
        mysqli_stmt_close($stmt);

        if ($fila && password_verify($password, $fila["password"])) {
            iniciar_sesion($fila["id"], $fila["nombre"]);
            header("Location: mis-mascotas.php");
            exit;
        }

        $error = "Correo o contrasena incorrectos.";
    }
}

$nombrePagina = "Login";
$pagina       = "login";
require __DIR__ . "/includes/header.php";
?>

    <section class="centrado">
      <div class="tarjeta">
        <h2 style="border:none; padding:0; margin-bottom:6px;">Iniciar sesion</h2>
        <p class="parrafo">Ingresa con el correo y la contrasena que registraste.</p>

        <?php if (isset($_GET["ok"])): ?>
          <div class="aviso">Cuenta creada. Ya puedes iniciar sesion.</div>
        <?php endif; ?>

        <?php if (isset($_GET["salir"])): ?>
          <div class="aviso">Cerraste sesion correctamente.</div>
        <?php endif; ?>

        <?php if ($error !== ""): ?>
          <div class="aviso error"><?= htmlspecialchars($error) ?></div>
        <?php endif; ?>

        <form method="post" action="">
          <div class="campo">
            <label for="correo">Correo</label>
            <input type="email" id="correo" name="correo" placeholder="ciudadano@correo.com"
                   value="<?= htmlspecialchars($correo) ?>" required>
          </div>

          <div class="campo">
            <label for="password">Contrasena</label>
            <input type="password" id="password" name="password" placeholder="Contrasena segura" required>
          </div>

          <button type="submit" class="boton bloque">Entrar</button>
        </form>

        <p class="enlace-centro">
          A&uacute;n no tienes cuenta? <a href="registro.php">Registrate</a>
        </p>
      </div>
    </section>

<?php require __DIR__ . "/includes/footer.php"; ?>
