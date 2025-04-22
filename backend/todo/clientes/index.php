<?php
session_start();
?>
<html>
<head>
<title>Administrador Urbanvibes</title>
<link rel="stylesheet" href="stiale.css">
</head>
<body>
<div class="general">
<div class="caja">
<button class="fo" onclick="window.location.href='../index.php'">
  <svg height="16" width="16" xmlns="http://www.w3.org/2000/svg" version="1.1" viewBox="0 0 1024 1024"><path d="M874.690416 495.52477c0 11.2973-9.168824 20.466124-20.466124 20.466124l-604.773963 0 188.083679 188.083679c7.992021 7.992021 7.992021 20.947078 0 28.939099-4.001127 3.990894-9.240455 5.996574-14.46955 5.996574-5.239328 0-10.478655-1.995447-14.479783-5.996574l-223.00912-223.00912c-3.837398-3.837398-5.996574-9.046027-5.996574-14.46955 0-5.433756 2.159176-10.632151 5.996574-14.46955l223.019353-223.029586c7.992021-7.992021 20.957311-7.992021 28.949332 0 7.992021 8.002254 7.992021 20.957311 0 28.949332l-188.073446 188.073446 604.753497 0C865.521592 475.058646 874.690416 484.217237 874.690416 495.52477z"></path></svg>
  <span>MENU</span>
</button>
<?php if (isset($_SESSION['name'])): ?>
<div class="session-banner" style="display: flex; align-items: center; gap: 10px;">
<?php echo htmlspecialchars($_SESSION['name']); ?>
<img src="../../../usuario.png" alt="Usuario" style="height: 30px;">
<form action="../logout.php" method="post">
<button class="buttone">Cerrar Sesion</button>
</form>
</div>
<?php endif; ?>
</div>
<div class="caja2"></div>
<div class="caja3"></div>
<div class="titulo">Clientes</div>
<div class="fondo">

<?php
	$servidor = "localhost";
	$usuario = "root";
	$contraseña = "12345678";
	$bd = "urbanvibes";
	$conexion = mysqli_connect($servidor, $usuario, $contraseña, $bd);
	if (!$conexion) {
		die("La conexión ha fallado, Error: " . mysqli_connect_error());
	}
	$seleccion = "SELECT * FROM clientes";
	$consulta = mysqli_query($conexion, $seleccion);
	$filas = mysqli_num_rows($consulta);
	if ($filas > 0) {
		echo "<table class = 'hola'>";
		echo "<tr><th>DNI</th><th >Nombre</th><th>Apellidos</th><th>Email</th><th>Contraseña</th><th>Ciudad</th></tr>";
		while ($fila = mysqli_fetch_assoc($consulta)) {
			echo "<tr>
					<td>{$fila['dni']}</td>
					<td>{$fila['nombre']}</td>
					<td>{$fila['apellidos']}</td>
					<td>{$fila['email']}</td>
					<td>{$fila['contrasena']}</td>
					<td>{$fila['ciudad']}</td>
				  </tr>";
		}
		echo "</table>";
	} else {
		echo "No hay datos en la tabla.";
	}
	mysqli_close($conexion);
	?>

</div>
</div>
</body>
</html>