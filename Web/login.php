<?php
	/* AP - MySCRUM Web
	 * login.php - Validación de inicio de sesión
	 * Creado: 12/10/16 Gabriela Garro
	 */
	session_start();
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

			$query = mysqli_query($conn, "SELECT idUsuario, correo, contrasena, idRol, nombreRol
			 FROM usuario, rol 
			 WHERE correo = '$user'
			 AND idRol = Rol_idRol;");
			$numrows = mysqli_num_rows($query);

			if ($numrows!=0) {
				while ($row = mysqli_fetch_assoc($query)){
				    if ($row['contrasena'] == $pass) {

				    	//Store the user type
				    	$_SESSION['userType'] = $row['idRol'];
				    	$_SESSION['userTypeName'] = $row['nombreRol'];

				    	//Store the userID
				    	$_SESSION['userID'] = $row['idUsuario'];

				    	//Store the user's name
				    	$_SESSION['correo'] = $row['correo'];

				    	//User type check
				    	/*if ($row['Rol_idRol'] == 3) //si es scrummaster
				    		header("Location: proyecto/");
				    	elseif ($row['Rol_idRol'] == 2) {
				    		header("Location: productowner/");
				    	}*/
				    	header("Location: proyecto/");
				    	/*poner más ifs para cada tipo de usuario*/
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