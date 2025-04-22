<?php
session_start();
$conexion = new mysqli("localhost", "root", "12345678", "urbanvibes");

if ($conexion->connect_error) {
    die("Error de conexión: " . $conexion->connect_error);
}

$dni = $_POST['dni'];
$nombre = $_POST['nombre'];
$apellidos = $_POST['apellidos'];
$nueva = $_POST['contrasena'];
$ciudad = $_POST['ciudad'];

$nueva_encriptada = password_hash($nueva, PASSWORD_DEFAULT);

$sql = "UPDATE clientes SET nombre='$nombre', apellidos='$apellidos', contrasena='$nueva_encriptada', ciudad='$ciudad' WHERE dni=$dni";

if ($conexion->query($sql) === TRUE) {
    // Actualizar la sesión con el nuevo nombre
    $_SESSION['name'] = $nombre;

    // Redirigir a la página principal
    header("Location: sesion.php");
    exit();
} else {
    echo "Error al actualizar: " . $conexion->error;
}

$conexion->close();
?>

