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
// Configuración
// Define el directorio raíz - AJUSTA ESTA LÍNEA según tu estructura
$directorioRaiz = 'C:\\Apache24\\htdocs\\tfg\\UrbanVibes\\'; // Usa la ubicación actual del script como raíz

// Activar reporte de errores para depuración
ini_set('display_errors', 1);
error_reporting(E_ALL);
$actual = $directorioRaiz;
$relativePath = '';

// Procesar la navegación de directorios
if (isset($_GET['dir']) && !empty($_GET['dir'])) {
    $relativePath = $_GET['dir'];
    $actual = $directorioRaiz . DIRECTORY_SEPARATOR . $relativePath;
    
    // Verificar que el directorio existe
    if (!file_exists($actual) || !is_dir($actual)) {
        echo "Directorio no encontrado o no es un directorio válido: " . htmlspecialchars($actual);
        echo "<br>Directorio raíz: " . htmlspecialchars($directorioRaiz);
        echo "<br>Ruta relativa: " . htmlspecialchars($relativePath);
        echo "<br><a href='?'>Volver al inicio</a>";
        exit;
    }
}

// Modo edición de archivo
$modoEdicion = false;
$contenidoArchivo = '';
$archivoParaEditar = '';

// Si se solicita abrir un archivo
if (isset($_GET['abrir']) && !empty($_GET['abrir'])) {
    $nombreArchivo = $_GET['abrir'];
    $rutaArchivo = $actual . DIRECTORY_SEPARATOR . $nombreArchivo;
    
    // Verificar que el archivo existe
    if (file_exists($rutaArchivo) && is_file($rutaArchivo)) {
        $modoEdicion = true;
        $archivoParaEditar = $nombreArchivo;
        $contenidoArchivo = file_get_contents($rutaArchivo);
    } else {
        echo "Archivo no encontrado: " . htmlspecialchars($rutaArchivo);
        echo "<br><a href='?dir=" . urlencode($relativePath) . "'>Volver</a>";
        exit;
    }
}

// Si se envía el formulario para guardar cambios
if (isset($_POST['guardar']) && isset($_POST['archivo']) && isset($_POST['contenido'])) {
    $nombreArchivo = $_POST['archivo'];
    $rutaArchivo = $actual . DIRECTORY_SEPARATOR . $nombreArchivo;
    
    // Verificar que el archivo existe
    if (file_exists($rutaArchivo) && is_file($rutaArchivo)) {
        // Intentar guardar los cambios en el archivo
        if (is_writable($rutaArchivo)) {
            file_put_contents($rutaArchivo, $_POST['contenido']);
            
            // Redirigir para evitar reenvío del formulario
            header("Location: ?dir=" . urlencode($relativePath) . "&guardado=1");
            exit;
        } else {
            echo "Error: No se puede escribir en el archivo. Verifica los permisos.";
            echo "<br><a href='?dir=" . urlencode($relativePath) . "'>Volver</a>";
            exit;
        }
    } else {
        echo "Archivo no encontrado al guardar: " . htmlspecialchars($rutaArchivo);
        echo "<br><a href='?dir=" . urlencode($relativePath) . "'>Volver</a>";
        exit;
    }
}

// Obtener elementos del directorio actual
$elementos = array_diff(scandir($actual), ['.', '..']);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Explorador de Archivos</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .container {
            display: flex;
            flex-direction: <?php echo $modoEdicion ? 'column' : 'column'; ?>;
            gap: 20px;
        }
        .explorador {
            flex: 1;
        }
        .editor {
            flex: 2;
        }
        .breadcrumb {
            margin-bottom: 15px;
            padding: 10px;
            background-color: #f8f9fa;
            border-radius: 4px;
        }
        .hola {
            width: 100%;
            border-collapse: collapse;
        }
        .hola th, .hola td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        .hola th {
            background-color: #f2f2f2;
        }
        .hola tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .hola tr:hover {
            background-color: #f1f1f1;
        }
        textarea {
            width: 100%;
            height: 500px;
            font-family: monospace;
            padding: 10px;
            border: 1px solid #ddd;
        }
        button {
            padding: 6px 12px;
            cursor: pointer;
        }
        .mensaje {
            padding: 10px;
            background-color: #d4edda;
            color: #155724;
            border-radius: 4px;
            margin-bottom: 15px;
        }
        .volver {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <h1>Explorador de Archivos</h1>
    
    <?php if (isset($_GET['guardado']) && $_GET['guardado'] == 1): ?>
        <div class="mensaje">¡Archivo guardado correctamente!</div>
    <?php endif; ?>
    
    <div class="container">
        <!-- Explorador de archivos -->
        <div class="explorador">
            <!-- Breadcrumb para navegación -->
            <div class="breadcrumb">
                <a href="?">Inicio</a>
                <?php
                if (!empty($relativePath)) {
                    $partes = explode(DIRECTORY_SEPARATOR, $relativePath);
                    $rutaAcumulada = '';
                    foreach ($partes as $parte) {
                        $rutaAcumulada .= ($rutaAcumulada ? DIRECTORY_SEPARATOR : '') . $parte;
                        echo ' / <a href="?dir=' . urlencode($rutaAcumulada) . '">' . htmlspecialchars($parte) . '</a>';
                    }
                }
                ?>
            </div>
            
            <!-- Tabla de archivos y carpetas -->
            <table class="hola">
                <tr>
                    <th>Nombre</th>
                    <th>Tipo</th>
                    <th>Tamaño</th>
                    <th>Modificado</th>
                    <th>Acción</th>
                </tr>
                <?php foreach ($elementos as $elemento): 
                    $ruta = $actual . DIRECTORY_SEPARATOR . $elemento;
                    $esCarpeta = is_dir($ruta);
                    $rutaRelativa = $relativePath ? $relativePath . DIRECTORY_SEPARATOR . $elemento : $elemento;
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
                                <form method="GET" style="display: inline;">
                                    <input type="hidden" name="dir" value="<?= urlencode($relativePath) ?>">
                                    <input type="hidden" name="abrir" value="<?= urlencode($elemento) ?>">
                                    <button type="submit">Abrir</button>
                                </form>
                            <?php else: ?>
                                -
                            <?php endif; ?>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </table>
        </div>
        
        <!-- Editor de archivo (aparece solo cuando se abre un archivo) -->
        <?php if ($modoEdicion): ?>
        <div class="editor">
            <h2>Editando: <?= htmlspecialchars($archivoParaEditar) ?></h2>
            <form method="POST">
                <input type="hidden" name="archivo" value="<?= htmlspecialchars($archivoParaEditar) ?>">
                <textarea name="contenido"><?= htmlspecialchars($contenidoArchivo) ?></textarea>
                <div style="margin-top: 10px;">
                    <button type="submit" name="guardar">Guardar cambios</button>
                    <a href="?dir=<?= urlencode($relativePath) ?>"><button type="button">Cancelar</button></a>
                </div>
            </form>
        </div>
        <?php endif; ?>
    </div>
</div>
</div>
</body>
</html>