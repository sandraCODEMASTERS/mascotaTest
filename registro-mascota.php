<?php
/**
 * MascotasTest - Pantalla de Registro de mascota
 */

require_once __DIR__ . "/conexion.php";
require_once __DIR__ . "/includes/sesion.php";

proteger();

$error = "";
$nombre   = "";
$especie  = "";
$raza     = "";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $nombre  = trim($_POST["nombre"]);
    $especie = $_POST["especie"] ?? "";
    $raza    = trim($_POST["raza"]);

    if ($nombre === "" || $raza === "" || !in_array($especie, ["perro", "gato"], true)) {
        $error = "Completa todos los datos y selecciona una especie valida.";
    } else {
        $stmt = mysqli_prepare(
            $conexion,
            "INSERT INTO mascotas (usuario_id, nombre, especie, raza) VALUES (?, ?, ?, ?)"
        );
        mysqli_stmt_bind_param($stmt, "isss", $_SESSION['usuario_id'], $nombre, $especie, $raza);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_close($stmt);

        header("Location: mis-mascotas.php?ok=1");
        exit;
    }
}

$nombrePagina = "Registro mascota";
$pagina       = "mascotas";
require __DIR__ . "/includes/header.php";
?>

    <section class="centrado">
      <div class="tarjeta">
        <h2 style="border:none; padding:0; margin-bottom:6px;">Registrar mascota</h2>
        <p class="parrafo">Registra un perro o un gato para poder inscribirlo en las jornadas.</p>

        <?php if ($error !== ""): ?>
          <div class="aviso error"><?= htmlspecialchars($error) ?></div>
        <?php endif; ?>

        <form method="post" action="">
          <div class="campo">
            <label for="nombre">Nombre de la mascota</label>
            <input type="text" id="nombre" name="nombre" placeholder="Ej: Firulais"
                   value="<?= htmlspecialchars($nombre) ?>" required>
          </div>

          <div class="campo">
            <label for="especie">Especie</label>
            <select id="especie" name="especie" required>
              <option value="">Seleccione una especie</option>
              <option value="perro" <?= $especie === "perro" ? "selected" : "" ?>>Perro</option>
              <option value="gato" <?= $especie === "gato" ? "selected" : "" ?>>Gato</option>
            </select>
          </div>

          <div class="campo">
            <label for="raza">Raza</label>
            <input type="text" id="raza" name="raza" placeholder="Ej: Criollo"
                   value="<?= htmlspecialchars($raza) ?>" required>
          </div>

          <button type="submit" class="boton bloque">Registrar mascota</button>
        </form>

        <p class="enlace-centro">
          <a href="mis-mascotas.php">Ver mis mascotas</a>
        </p>
      </div>
    </section>

<?php require __DIR__ . "/includes/footer.php"; ?>
