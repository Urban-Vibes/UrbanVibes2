<?php
session_start();

if (isset($_SESSION['name'])) {
    header("Location: ../carrito.html");
} else {
    header("Location: ../registrarse/index.php");
}
exit();
?>
