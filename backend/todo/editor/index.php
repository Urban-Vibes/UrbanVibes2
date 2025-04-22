<?php
session_start();
?>
<html>
<head>
<title>Administrador Urbanvibes</title>
<link rel="stylesheet" href="stoale.css">
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
<div class="titulo">Editor</div>
<div class="fondo">
<?php
$basePath = realpath("../../../../UrbanVibes");
$dir = isset($_GET['dir']) ? $_GET['dir'] : '';
$actual = realpath($basePath . DIRECTORY_SEPARATOR . $dir);

// Seguridad: evitar salirse de la carpeta base
if (strpos($actual, $basePath) !== 0 || !is_dir($actual)) {
    $actual = $basePath;
}

// Si se ha solicitado abrir un archivo
if (isset($_GET['abrir'])) {
    $archivo = $_GET['abrir'];
    $rutaCompleta = realpath($actual . DIRECTORY_SEPARATOR . $archivo);

    // Seguridad: solo si está dentro de UrbanVibes y es archivo
    if ($rutaCompleta && strpos($rutaCompleta, $basePath) === 0 && is_file($rutaCompleta)) {
        // Comando para abrir con Notepad (asegúrate de que Notepad está en el PATH)
        $comando = 'start notepad "' . $rutaCompleta . '"';
        shell_exec($comando);

        // Mensaje opcional de depuración
        echo "<pre>Abriendo archivo: $rutaCompleta</pre>";
    } else {
        echo "<pre style='color:red;'>No se pudo abrir el archivo.</pre>";
    }
}

// Leer archivos y carpetas
$elementos = scandir($actual);
$elementos = array_diff($elementos, ['.', '..']);

// Obtener ruta relativa para mostrar
$relativePath = str_replace($basePath, '', $actual);
$relativePath = ltrim(str_replace('\\', '/', $relativePath), '/');
?>

<?php if ($relativePath): ?>
    <a href="?dir=<?= urlencode(dirname($relativePath)) ?>">
	<button class="h">
		<svg class="svgIcon" viewBox="0 0 384 512">
		<path d="M214.6 41.4c-12.5-12.5-32.8-12.5-45.3 0l-160 160c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0L160 141.2V448c0 17.7 14.3 32 32 32s32-14.3 32-32V141.2L329.4 246.6c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3l-160-160z"></path>
		</svg>
	</button>
	</a>
<?php endif; ?>
<table class="hola">
        <tr><th>Nombre</th><th>Tipo</th><th>Tamaño</th><th>Modificado</th><th>Acción</th></tr>
        <?php foreach ($elementos as $elemento): 
            $ruta = $actual . DIRECTORY_SEPARATOR . $elemento;
            $esCarpeta = is_dir($ruta);
            $rutaRelativa = $relativePath ? $relativePath . '/' . $elemento : $elemento;
        ?>
            <tr>
                <td>
                    <?php if ($esCarpeta): ?>
                        📁 <a href="?dir=<?= urlencode($rutaRelativa) ?>"><?= htmlspecialchars($elemento) ?></a>
                    <?php else: ?>
                        📄 <?= htmlspecialchars($elemento) ?>
                    <?php endif; ?>
                </td>
                <td><?= $esCarpeta ? "Carpeta" : "Archivo" ?></td>
                <td><?= $esCarpeta ? "-" : round(filesize($ruta) / 1024, 2) . " KB" ?></td>
                <td><?= date("d-m-Y H:i", filemtime($ruta)) ?></td>
                <td>
                    <?php if (!$esCarpeta): ?>
						<a href="?dir=<?= urlencode($relativePath) ?>&abrir=<?= urlencode($elemento) ?>">Abrir</a>
                    <?php else: ?>
                        -
                    <?php endif; ?>
                </td>
            </tr>
        <?php endforeach; ?>
</table>
</div>
</div>
</body>
</html>