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

			$query = mysqli_query($conn, "SELECT idUsuarioCliente, usuariocliente, contrasenacliente
			 FROM usuariocliente
			 WHERE usuariocliente = '$user';");
			$numrows = mysqli_num_rows($query);

			if ($numrows!=0) {
				while ($row = mysqli_fetch_assoc($query)){
				    if ($row['contrasena'] == $pass) {

				    	//Store the userID
				    	$_SESSION['userID'] = $row['idUsuarioCliente'];

				    	//Store the user's name
				    	$_SESSION['correo'] = $row['usuariocliente'];

				    	header("Location: index.php");
				    }
				}
			    die("Usuario o contraseña incorrectos.");
			}
			else
				echo "Usuario no existe";
		} 
			else die("No sé cuál es el problema.");
	}

?>