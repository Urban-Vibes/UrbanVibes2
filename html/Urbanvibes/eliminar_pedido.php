<?php
$servername = "db";
$username = "root";
$password = "12345678";
$database = "urbanvibes";

if (!isset($_POST['id_pedido']) || empty($_POST['id_pedido'])) {
    die("Error: No se especificó el ID del pedido.");
}

$id_pedido = $_POST['id_pedido'];

$return_url = isset($_POST['return_url']) ? $_POST['return_url'] : 'index.php';

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

$id_pedido = $conn->real_escape_string($id_pedido);
$sql = "DELETE FROM pedidos WHERE id_pedido = $id_pedido";

if ($conn->query($sql)) {
    $conn->close();
    header("Location: $return_url");
    exit;
} else {
    echo "Error al eliminar el pedido: " . $conn->error;
    $conn->close();
}
?>
