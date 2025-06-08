<?php
session_start();
?>
<html>
<head>
<title>Administrador Urbanvibes</title>
<link rel="stylesheet" href="stile.css">
</head>
<body>
<div class="general">
<div class="caja">
<?php if (isset($_SESSION['name'])): ?>
<div class="session-banner" style="display: flex; align-items: center; gap: 10px;">
<?php echo htmlspecialchars($_SESSION['name']); ?>
<img src="../../usuario.png" alt="Usuario" style="height: 30px;">
<form action="logout.php" method="post">
<button class="buttone">Cerrar Sesion</button>
</form>
</div>
<?php endif; ?>
</div>
<div class="caja2"></div>
<div class="caja3"></div>
<div class="titulo">Administrador de Urbanvibes</div>
<div class="fondo">
	<button onclick="window.location.href='stock/index.php'">Stock</button>
	<button onclick="window.location.href='clientes/index.php'">Clientes</button>
	<button onclick="window.location.href='pedidos/index.php'">Pedidos</button>
	<button onclick="window.location.href='editor/index.php'">Editor</button>
</div>
</div>
</body>
</html>