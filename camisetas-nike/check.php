<?php
session_start();

if (isset($_SESSION['name'])) {
    header("Location: ../carrito.php");
} else {
    header("Location: ../registrarse/index.php");
}
exit();
?>
