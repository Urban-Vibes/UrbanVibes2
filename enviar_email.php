<?php

use PHPMailer\PHPMailer\{PHPMailer, SMTP, Exception};

require 'phpmailer/src/PHPMailer.php';
require 'phpmailer/src/SMTP.php';
require 'phpmailer/src/Exception.php';

// Leer los datos JSON enviados desde JavaScript
$input = json_decode(file_get_contents('php://input'), true);

// Obtener el ID de la transacción
$idTransaccion = isset($input['id_transaccion']) ? $input['id_transaccion'] : 'NO DISPONIBLE';

// Crear una instancia de PHPMailer
$mail = new PHPMailer(true);

try {
    // Configuración del servidor SMTP
    $mail->SMTPDebug = SMTP::DEBUG_OFF; // Cambia a DEBUG_SERVER para ver errores en detalle
    $mail->isSMTP();
    $mail->Host       = 'smtp.gmail.com';
    $mail->SMTPAuth   = true;
    $mail->Username   = 'urbanvibesmdrz@gmail.com';     // Tu correo
    $mail->Password   = 'urbanvibes12tres.';            // Tu contraseña o clave de aplicación
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
    $mail->Port       = 465;

    // Destinatarios
    $mail->setFrom('urbanvibesmdrz@gmail.com', 'Urban Vibes');
    $mail->addAddress('ismamerbas2005@gmail.com', 'Yo');

    // Contenido del correo
    $mail->isHTML(true);
    $mail->Subject = 'Detalles de Compra';

    $cuerpo = '<h4>Gracias por su compra</h4>';
    $cuerpo .= '<p>El ID de su compra es <strong>' . htmlspecialchars($idTransaccion) . '</strong></p>';

    $mail->Body    = utf8_decode($cuerpo);
    $mail->AltBody = 'Gracias por su compra. ID de compra: ' . $idTransaccion;

    // Enviar correo
    $mail->send();

    // Opcional: responder algo si se llama desde JS
    echo json_encode(['success' => true]);

} catch (Exception $e) {
    echo json_encode([
        'success' => false,
        'message' => "Error al enviar el correo: {$mail->ErrorInfo}"
    ]);
}

?>
