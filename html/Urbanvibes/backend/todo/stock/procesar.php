	<?php
	$conexion = new mysqli("db", "root", "12345678", "urbanvibes");

	if ($conexion->connect_error) {
		die("Error de conexión: " . $conexion->connect_error);
	}

	// Si se envió el formulario
	$productos = [];
	if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['categoria'])) {
		$cat1 = $_POST['categoria1'];
		$cat2 = $_POST['categoria2'];
		$cat3 = $_POST['categoria3'];
		$cat4 = $_POST['categoria4'];
		// Consulta basada en la categoría seleccionada
		$sql = "SELECT * FROM productos WHERE nombre = '$cat1' and talla = '$cat2'and precio = '$cat3' and marca = '$cat4'";
		$consulta = mysqli_query($conexion, $sql);
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
	}
	?>