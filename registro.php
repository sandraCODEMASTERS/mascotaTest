<?php
/**
 * MascotasTest - Pantalla de Registro de ciudadanos
 */

require_once __DIR__ . "/conexion.php";
require_once __DIR__ . "/includes/sesion.php";

if (usuario_logueado()) {
    header("Location: mis-mascotas.php");
    exit;
}

$error  = "";
$nombre = "";
$correo = "";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $nombre    = trim($_POST["nombre"]);
    $correo    = trim($_POST["correo"]);
    $password  = $_POST["password"] ?? "";

    if ($nombre === "" || $correo === "" || $password === "") {
        $error = "Todos los campos son obligatorios.";
    } elseif (strlen($password) < 8) {
        $error = "La contrasena debe tener al menos 8 caracteres.";
    } else {
        $stmt = mysqli_prepare($conexion, "SELECT id FROM usuarios WHERE correo = ?");
        mysqli_stmt_bind_param($stmt, "s", $correo);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_store_result($stmt);
        $existe = mysqli_stmt_num_rows($stmt) > 0;
        mysqli_stmt_close($stmt);

        if ($existe) {
            $error = "Ese correo ya esta registrado.";
        } else {
            $hash = password_hash($password, PASSWORD_DEFAULT);

            $stmt = mysqli_prepare(
                $conexion,
                "INSERT INTO usuarios (nombre, correo, password) VALUES (?, ?, ?)"
            );
            mysqli_stmt_bind_param($stmt, "sss", $nombre, $correo, $hash);
            mysqli_stmt_execute($stmt);
            mysqli_stmt_close($stmt);

            header("Location: login.php?ok=1");
            exit;
        }
    }
}

$nombrePagina = "Registro";
$pagina       = "registro";
require __DIR__ . "/includes/header.php";
?>

    <section class="centrado">
      <div class="tarjeta">
        <h2 style="border:none; padding:0; margin-bottom:6px;">Crear cuenta</h2>
        <p class="parrafo">Registrate como ciudadano para inscribir tus mascotas en las jornadas.</p>

        <?php if ($error !== ""): ?>
          <div class="aviso error"><?= htmlspecialchars($error) ?></div>
        <?php endif; ?>

        <form method="post" action="">
          <div class="campo">
            <label for="nombre">Nombre</label>
            <input type="text" id="nombre" name="nombre" placeholder="Nombre completo"
                   value="<?= htmlspecialchars($nombre) ?>" required>
          </div>

          <div class="campo">
            <label for="correo">Correo</label>
            <input type="email" id="correo" name="correo" placeholder="ciudadano@correo.com"
                   value="<?= htmlspecialchars($correo) ?>" required>
          </div>

          <div class="campo">
            <label for="password">Contrasena</label>
            <input type="password" id="password" name="password" placeholder="Contrasena segura" required>
            <span class="ayuda">Minimo 8 caracteres. Se guarda cifrada en la base de datos.</span>
          </div>

          <button type="submit" class="boton bloque">Registrarme</button>
        </form>

        <p class="enlace-centro">
          Ya tienes cuenta? <a href="login.php">Inicia sesion</a>
        </p>
      </div>
    </section>

<?php require __DIR__ . "/includes/footer.php"; ?>
