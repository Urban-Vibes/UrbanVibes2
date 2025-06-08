<?php
session_start();
if (isset($_SESSION['name'])) {
    $host = 'db';
    $usuario = 'root';
    $contrasena = '12345678';
    $base_datos = 'urbanvibes';
    $conexion = mysqli_connect($host, $usuario, $contrasena, $base_datos);
    if (!$conexion) {
        die("Error de conexión: " . mysqli_connect_error());
    }
    
    if (isset($_POST['producto_id'])) {
        $producto_id = $_POST['producto_id'];
    } else {
        die("Error: No se recibió el ID del producto. Vuelve a intentarlo.");
    }
    $cliente_id = $_SESSION['id'];
    $sql_insertar = "INSERT INTO pedidos (dni_cliente, codigo, numero_productos) VALUES ('$cliente_id', '$producto_id', 1)";
    if (mysqli_query($conexion, $sql_insertar)) {
        mysqli_close($conexion);
        header("Location: ../carrito.php");
        exit();
    } else {
        echo "Error al agregar producto: " . mysqli_error($conexion);
        mysqli_close($conexion);
    }
} else {
    header("Location: ../registrarse/index.php");
    exit();
}
?>
