<?php
/**
 * MascotasTest - Pantalla de Mis mascotas
 */

require_once __DIR__ . "/conexion.php";
require_once __DIR__ . "/includes/sesion.php";

proteger();

$mascotas = [];

$stmt = mysqli_prepare(
    $conexion,
    "SELECT id, nombre, especie, raza FROM mascotas WHERE usuario_id = ? ORDER BY nombre"
);
mysqli_stmt_bind_param($stmt, "i", $_SESSION['usuario_id']);
mysqli_stmt_execute($stmt);
$resultado = mysqli_stmt_get_result($stmt);

while ($mascota = mysqli_fetch_assoc($resultado)) {
    $mascotas[] = $mascota;
}
mysqli_stmt_close($stmt);

$nombrePagina = "Mis mascotas";
$pagina       = "mascotas";
require __DIR__ . "/includes/header.php";
?>

    <div class="contenedor">
      <section class="seccion">
        <h2>Mis mascotas</h2>

        <?php if (isset($_GET["ok"])): ?>
          <div class="aviso" style="margin-bottom:18px;">Mascota registrada correctamente.</div>
        <?php endif; ?>

        <div class="acciones" style="margin-bottom:18px;">
          <a class="boton" href="registro-mascota.php">Registrar mascota</a>
          <a class="boton secundario" href="servicios.html">Ver jornadas disponibles</a>
        </div>

        <?php if ($mascotas === []): ?>
          <div class="vacio">
            Todavia no tienes mascotas registradas.
            <a href="registro-mascota.php">Registra la primera</a>.
          </div>
        <?php else: ?>
          <table class="tabla">
            <thead>
              <tr>
                <th>Nombre</th>
                <th>Especie</th>
                <th>Raza</th>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($mascotas as $mascota): ?>
                <tr>
                  <td><?= htmlspecialchars($mascota["nombre"]) ?></td>
                  <td><?= $mascota["especie"] === "perro" ? "Perro" : "Gato" ?></td>
                  <td><?= htmlspecialchars($mascota["raza"]) ?></td>
                </tr>
              <?php endforeach; ?>
            </tbody>
          </table>

          <div class="acciones" style="margin-top:18px;">
            <a class="boton secundario" href="servicios.html">Inscribir en una jornada</a>
          </div>
        <?php endif; ?>
      </section>
    </div>

<?php require __DIR__ . "/includes/footer.php"; ?>
