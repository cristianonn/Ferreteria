<?php
	/* Ferreteria - Bases de Datos II
	 * login.php - Validación de inicio de sesión
	 * Creado: 18/11/16 Gabriela Garro
	 */
	header('Content-type: text/html; charset=utf-8');
	if (session_status() == PHP_SESSION_NONE) {
        session_start();
    }
	include('connection.php');
	//header("Location: scrummaster/index.php");

	if (empty($_POST['usuario']) || empty($_POST['contrasena'])) {
		// Manejar el error, puede ser guardarlo en una variable
		header("Location: index.php#invalidData"); // Devolver a la pág principal
	}
	else {

		if ($conn == true) {
			echo "Connected!\n";

			$user = $_POST['usuario'];
			$pass = $_POST['contrasena'];

			/*$query = mysqli_query($conn, "SELECT idUsuarioCliente, usuariocliente, contrasenacliente, nombreCliente
			 FROM usuariocliente, cliente
			 WHERE usuariocliente = '$user'
			 AND cliente_idCliente = idCliente;");*/
			$query = mysqli_query($conn, "CALL getUser('$user');");
			if (!$query) {
		    	die("Error: ".mysqli_error($conn));
			}
			$numrows = mysqli_num_rows($query);

			if ($numrows!=0) {
				while ($row = mysqli_fetch_assoc($query)){
				    if ($row['contrasenaCliente'] == $pass) {

				    	//Store the userID
				    	$_SESSION['userID'] = $row['userID'];

				    	//Store the user's name
				    	$_SESSION['correo'] = $row['usuarioCliente'];

				    	$_SESSION['nombreCliente'] = $row['nombreCliente'];

				    	$_SESSION['apellidosCliente'] = $row['apellidosCliente'];

				    	header("Location: index.php#Welcome");
				    }
				}
				mysqli_next_result($conn); //TIENE que ir o hay error
			    die("Usuario o contraseña incorrectos.");
			}
			else
				echo "Usuario no existe";
		} 
			else die("No sé cuál es el problema.");
	}

?>