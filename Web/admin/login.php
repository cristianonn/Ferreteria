<?php
	/* Ferreteria - Bases de Datos II
	 * login.php - Validación de inicio de sesión (para empleado)
	 * Creado: 24/11/16 Gabriela Garro
	 */
	header('Content-type: text/html; charset=utf-8');
	if (session_status() == PHP_SESSION_NONE) {
        session_start();
    }
	include('../connection.php');
	//header("Location: scrummaster/index.php");

	if (empty($_POST['usuario']) || empty($_POST['contrasena'])) {
		// Manejar el error, puede ser guardarlo en una variable
		header("Location: ../index.php#invalidData"); // Devolver a la pág principal
	}
	else {

		if ($conn == true) {
			echo "Connected!\n";

			$user = $_POST['usuario'];
			$pass = $_POST['contrasena'];

			$query = mysqli_query($conn, "CALL getUsuarioEmpleado('$user');");
			if (!$query) {
		    	die("Error: ".mysqli_error($conn));
			}
			$numrows = mysqli_num_rows($query);

			if ($numrows!=0) {
				while ($row = mysqli_fetch_assoc($query)){
				    if ($row['contrasenaEmpleado'] == $pass) {
				    	$_SESSION['userIDEmpleado'] = $row['userID'];
				    	$_SESSION['correoEmpleado'] = $row['usuarioEmpleado'];
				    	$_SESSION['nombreEmpleado'] = $row['nombreEmpleado'];
				    	$_SESSION['apellidosEmpleado'] = $row['apellidosEmpleado'];
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