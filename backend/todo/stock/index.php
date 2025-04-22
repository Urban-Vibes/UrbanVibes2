<?php
session_start();
?>
<html>
<head>
<title>Administrador Urbanvibes</title>
<link rel="stylesheet" href="stqle.css">
</head>
  <script>
    addEventListener('load', inicio, false);

    function inicio() {
      document.getElementById('dinero').addEventListener('input', actualizarValor, false);
    }

    function actualizarValor() {    
      document.getElementById('valor').innerHTML = document.getElementById('dinero').value + "€";
    }
  </script>
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
<div class="titulo">Stock</div>
<div class="fondo">
	<form method="POST">
	<div class="buscador">
    <label for="opciones">Tipo:</label>
    <select class="button" id="opciones" name="categoria1">
        <option value="">...</option>
		<option value="camiseta">Camiseta</option>
		<option value="pantalon">Pantalon</option>
        <option value="chaqueta">Chaqueta</option>
        <option value="sudadera">Sudadera</option>
    </select>
	<label for="opciones">Talla:</label>
	<select class="button" id="opciones" name="categoria2">
		<option value="">...</option>
		<option value="S">S</option>
		<option value="M">M</option>
		<option value="L">L</option>
	</select>
	<label for="opciones">Precio:</label>
	<input name="categoria3" type="range" id="dinero" min="0" max="100" value="0" step="1">
    <span id="valor">0€</span>
		<label for="opciones">Marca:</label>
	<select class="button" id="opciones" name="categoria4">
		<option value="">...</option>
		<option value="adidas">Adidas</option>
		<option value="jordan">Jordan</option>
		<option value="lacoste">Lacoste</option>
		<option value="nike">Nike</option>
		<option value="puma">Puma</option>
		<option value="vans">Vans</option>
	</select>
	<button type="submit" class="lo" onclick="cambiarConsulta()">
    <svg class="svgIcon" viewBox="0 0 512 512" height="1em" xmlns="http://www.w3.org/2000/svg" id="cambiarConsulta" ><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zm50.7-186.9L162.4 380.6c-19.4 7.5-38.5-11.6-31-31l55.5-144.3c3.3-8.5 9.9-15.1 18.4-18.4l144.3-55.5c19.4-7.5 38.5 11.6 31 31L325.1 306.7c-3.2 8.5-9.9 15.1-18.4 18.4zM288 256a32 32 0 1 0 -64 0 32 32 0 1 0 64 0z"></path></svg>
	BUSCAR
	</button>
	</div>
	</form>
	<?php
	$servidor = "localhost";
	$usuario = "root";
	$contraseña = "12345678";
	$bd = "urbanvibes";
	$conexion = mysqli_connect($servidor, $usuario, $contraseña, $bd);
	if (!$conexion) {
		die("La conexión ha fallado, Error: " . mysqli_connect_error());
	}
	$seleccion = "SELECT * FROM productos";
	$consulta = mysqli_query($conexion, $seleccion);
	$filas = mysqli_num_rows($consulta);
	if ($filas > 0) {
		echo "<table class = 'hola'>";
		echo "<tr><th>Código</th><th >Nombre</th><th>Talla</th><th>Precio</th><th>Marca</th><th>Descripción</th></tr>";
		while ($fila = mysqli_fetch_assoc($consulta)) {
			echo "<tr>
					<td>{$fila['codigo']}</td>
					<td>{$fila['nombre']}</td>
					<td>{$fila['talla']}</td>
					<td>{$fila['precio']}</td>
					<td>{$fila['marca']}</td>
					<td>{$fila['descripcion']}</td>
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