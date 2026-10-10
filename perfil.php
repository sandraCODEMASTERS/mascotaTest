<?php
/**
 * MascotasTest - Pantalla de Perfil del usuario
 */

require_once __DIR__ . "/conexion.php";
require_once __DIR__ . "/includes/sesion.php";

proteger();

$usuario = datos_usuario();
$error   = "";
$exito   = "";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $nombre        = trim($_POST["nombre"]);
    $nuevaPassword = $_POST["password"] ?? "";

    if ($nombre === "") {
        $error = "El nombre no puede quedar vacio.";
    } else {
        if ($nuevaPassword !== "") {
            if (strlen($nuevaPassword) < 8) {
                $error = "La nueva contrasena debe tener al menos 8 caracteres.";
            } else {
                $hash = password_hash($nuevaPassword, PASSWORD_DEFAULT);
                $stmt = mysqli_prepare($conexion, "UPDATE usuarios SET nombre = ?, password = ? WHERE id = ?");
                mysqli_stmt_bind_param($stmt, "ssi", $nombre, $hash, $_SESSION['usuario_id']);
                mysqli_stmt_execute($stmt);
                mysqli_stmt_close($stmt);
            }
        } else {
            $stmt = mysqli_prepare($conexion, "UPDATE usuarios SET nombre = ? WHERE id = ?");
            mysqli_stmt_bind_param($stmt, "si", $nombre, $_SESSION['usuario_id']);
            mysqli_stmt_execute($stmt);
            mysqli_stmt_close($stmt);
        }

        if ($error === "") {
            $_SESSION['usuario_nombre'] = $nombre;
            $usuario = datos_usuario();
            $exito   = "Datos actualizados correctamente.";
        }
    }
}

$nombrePagina = "Perfil";
$pagina       = "perfil";
require __DIR__ . "/includes/header.php";
?>

    <div class="contenedor">
      <section class="seccion">
        <div class="tarjeta">
          <div class="datos-usuario">
            <div class="avatar"><?= $iniciales ?></div>
            <div>
              <h2><?= htmlspecialchars($usuario["nombre"]) ?></h2>
              <p>Ciudadano registrado</p>
            </div>
          </div>

          <?php if ($error !== ""): ?>
            <div class="aviso error"><?= htmlspecialchars($error) ?></div>
          <?php endif; ?>

          <?php if ($exito !== ""): ?>
            <div class="aviso"><?= htmlspecialchars($exito) ?></div>
          <?php endif; ?>

          <h3 style="margin: 16px 0 14px;">Mis datos</h3>

          <form method="post" action="">
            <div class="campo">
              <label for="nombre">Nombre</label>
              <input type="text" id="nombre" name="nombre" value="<?= htmlspecialchars($usuario["nombre"]) ?>" required>
            </div>

            <div class="campo">
              <label for="correo">Correo</label>
              <input type="email" id="correo" name="correo" value="<?= htmlspecialchars($usuario["correo"]) ?>" disabled>
              <span class="ayuda">El correo de registro no se puede cambiar.</span>
            </div>

            <div class="campo">
              <label for="password">Nueva contrasena</label>
              <input type="password" id="password" name="password" placeholder="Contrasena segura">
              <span class="ayuda">Dejalo vacio si no quieres cambiar tu contrasena.</span>
            </div>

            <div class="acciones">
              <button type="submit" class="boton">Guardar cambios</button>
              <a class="boton secundario" href="mis-mascotas.php">Ver mis mascotas</a>
            </div>
          </form>
        </div>
      </section>
    </div>

<?php require __DIR__ . "/includes/footer.php"; ?>
