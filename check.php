<?php
session_start();

if (isset($_SESSION['name'])) {
    header("Location: registrarse/sesion.php");
} else {
    header("Location: registrarse/index.php");
}
exit();
?>
