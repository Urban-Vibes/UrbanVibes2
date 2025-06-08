<?php
session_start();
$email = $_SESSION['email'];
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require 'PHPMailer-master/src/PHPMailer.php';
require 'PHPMailer-master/src/SMTP.php';
require 'PHPMailer-master/src/Exception.php';

$servername = "db";
$username = "root";
$password = "12345678";
$database = "urbanvibes";
$conn = new mysqli($servername, $username, $password, $database);
if ($conn->connect_error) {
    die("Conexion fallida: " . $conn->connect_error);
}
$dni = $_SESSION['id'];
$sql = "DELETE FROM pedidos WHERE dni_cliente = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $dni);
$result = $stmt->execute();

if ($result === TRUE) {
    $mail = new PHPMailer(true);

    try {
        $mail->SMTPDebug = SMTP::DEBUG_OFF;
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com';
        $mail->SMTPAuth = true;
        $mail->Username = 'urbanvibesmdrz@gmail.com';
        $mail->Password = 'emgj nvna yrpu cmfp';
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $mail->Port = 587;

        $mail->setFrom('urbanvibesmdrz@gmail.com');
        $mail->addAddress($email);

        $mail->isHTML(true);
        $mail->Subject = 'UrbanVibes- Factura';
        $mail->Body = "Muchas Gracias por tu compra";
        $mail->addAttachment('factura.pdf');
        $mail->send();
        
    } catch (Exception $e) {
        echo "Error al enviar el correo: " . $mail->ErrorInfo;
    }
    
} else {
    echo "Error al eliminar el pedido: " . $conn->error;
}

$stmt->close();
$conn->close();
?>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<title>Gracias por su pago</title>
	<link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
	<style>
	#map {
	  height: 400px;
	  width: 80%;
	  margin: 20px auto;
	  border: 2px solid #000;
	}
    body {
      margin: 0;
      padding: 0;
      background: #f4f7fa;
      font-family: 'Segoe UI', sans-serif;
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
    }

    .container {
      text-align: center;
      background: white;
      padding: 40px;
      border-radius: 12px;
      box-shadow: 0 4px 20px rgba(0,0,0,0.1);
      width: 50%;
    }

    .logo {
      width: 80px;
      margin-bottom: 20px;
    }

    .checkmark {
      font-size: 60px;
      color: #4CAF50;
      margin-bottom: 20px;
    }

    h1 {
      color: #333;
      font-size: 24px;
    }

    p {
      color: #666;
      font-size: 16px;
      margin: 10px 0;
    }

    .btn {
      margin-top: 20px;
      padding: 12px 24px;
      background-color: #4CAF50;
      color: white;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      font-size: 16px;
      text-decoration: none;
    }

    .btn:hover {
      background-color: #45a049;
    }
  </style>
</head>
<body style="background-image: url('image.jpeg')">
  <div class="container">
    <img src="logo (1).png" alt="Gracias" class="logo">
    <div class="checkmark">✔</div>
    <h1>¡Gracias por su compra!</h1>
	<div id="map"></div>
    <p>Hemos recibido su transacción con éxito.</p>
    <p>Un correo electrónico con la factura ha sido enviado a su dirección.</p>
    <p>Si tiene alguna pregunta, no dude en contactarnos.</p>
	<p>urbanvibesmdrz@gmail.com</p>
	<br>
    <a href="carrito.php" class="btn">Volver al inicio</a>
	
  </div>
  
	<script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>

	<script>
	const params = new URLSearchParams(window.location.search);
	const destinoDireccion = params.get("destino");
	const origen = "Cobo calleja"; // origen fijo

	let map, rutaLayer;

	function initMap() {
	  map = L.map('map').setView([40.4168, -3.7038], 6);
	  L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
		attribution: '© OpenStreetMap contributors'
	  }).addTo(map);
	}

	async function geocode(direccion) {
	  const url = `https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(direccion)}`;
	  const response = await fetch(url);
	  const data = await response.json();
	  if (data.length === 0) throw new Error("No se encontró: " + direccion);
	  return [parseFloat(data[0].lat), parseFloat(data[0].lon)];
	}

	async function calcularRuta(origenCoords, destinoCoords) {
	  const url = `https://router.project-osrm.org/route/v1/driving/${origenCoords[1]},${origenCoords[0]};${destinoCoords[1]},${destinoCoords[0]}?overview=full&geometries=geojson`;
	  const response = await fetch(url);
	  const data = await response.json();
	  return data.routes[0].geometry;
	}

	async function mostrarRuta() {
	  try {
		const origenCoords = await geocode(origen);
		const destinoCoords = await geocode(destinoDireccion);

		if (rutaLayer) map.removeLayer(rutaLayer);

		const rutaGeojson = await calcularRuta(origenCoords, destinoCoords);
		rutaLayer = L.geoJSON(rutaGeojson).addTo(map);

		L.marker(origenCoords, {title: "Origen"}).addTo(map);
		L.marker(destinoCoords, {title: "Destino"}).addTo(map);

		map.fitBounds(rutaLayer.getBounds(), {padding: [50, 50]});
	  } catch (e) {
		alert("Error: " + e.message);
	  }
	}

	initMap();
	if (destinoDireccion) {
	  mostrarRuta();
	} else {
	  alert("No se especificó dirección de destino.");
	}
	</script>
</body>
</html>
