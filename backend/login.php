<?php
session_start();
$conn = mysqli_connect('localhost', 'root', '12345678', 'urbanvibes');

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['correo'];
    $password = $_POST['contrasena'];

    $result = mysqli_query($conn, "SELECT dni, email, contrasena, nombre FROM empleados WHERE email = '$email' and contrasena='$password'");

    if ($result && mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result);
            $_SESSION['loggedin'] = true;
			$_SESSION['id'] = $row['dni'];
            $_SESSION['name'] = $row['nombre'];
            $_SESSION['email'] = $row['email'];
            
            header("Location: todo/index.php");
            exit();
    } else {
        $message = "<div style='text-align: center; color: red;'>Email o contraseña incorrectos!<br><b>¡Inténtalo de nuevo!</b></div>";
    }
}

mysqli_close($conn);
?>
<html>
<head>
<title>Administrador Urbanvibes</title>
<link rel="stylesheet" href="styly.css">
</head>
<body>
<div class="general">
<div class="caja"></div>
<div class="caja2"></div>
<div class="caja3"></div>
<div class="titulo">Administrador de Urbanvibes</div>
<div class="fondo">
<form method="POST">
<div class="campo">
<label for="correo">Correo Electrónico</label>
<input type="email" id="correo" name="correo" required>
</div>
<div class="campo">
<label for="contrasena">Contraseña</label>
<input type="password" id="contrasena" name="contrasena" required>
</div>
<button class="boton" type="submit">Iniciar Sesión</button>
<?php
if (isset($message)) {
    echo $message;
}
?>
</form>

</div>
</div>
</body>
</html>