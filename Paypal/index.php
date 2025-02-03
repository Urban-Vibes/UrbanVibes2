<!DOCTYPE html>
<html lang= "es">
<head>
	<meta charset="UTF-8">
	<title>PayPal</title>
    <script src="https://www.paypal.com/sdk/js?client-id=test&buyer-country=US&currency=USD&components=buttons&enable-funding=venmo,paylater,card" data-sdk-integration-source="developer-studio">
	</script>
    <script src="app.js"></script>
	<script src="https://www.paypal.com/sdk/js?client-id=AWbXZwQPidHR-Sv0IEOPTPUWX_nMbecnOi178uOiwjq1zWO2uN2Rr6ySFMVhp_jQ2_q1Ly2UbepBXd7r&currency=EUR">
</head>
<body>
    <div id="paypal-button-container"></div>
    <p id="result-message"></p>
	
	<script>
		paypal.Buttons({
			style:{
				color: 'green',
				shape: 'pill',
				label: 'buy now'
			},
			createOrder: function(data, actions){
					return action.order.create({
							purchase_units: [{
								amount: {
									value: 100
								}
							}]
					});
			},
			
			onApprove: function(data,actions){
					actions.order.capture().then(function(detalles){
						console.log(detalles);
						window.location.href="pago-completado.html"
					});
			},
			
			onCnacel: function(data){
				alert("Pago Cancelado");
				consoles.log(data)
			}
		}).render('#paypal-button-container');
	</script>
</body>
</html>