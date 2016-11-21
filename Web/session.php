<?php
	include("connection.php");
	header('Content-type: text/html; charset=utf-8');
	if (session_status() == PHP_SESSION_NONE) {
        session_start();
    }
    $conn = $_SESSION['conn'];

    //Cantidad de artículos en el carrito
    function getCantidadCarrito() {
    	$conn = $_SESSION['conn'];
    	$userID = $_SESSION['userID'];
    	$cantidadCarrito = 0;
    	$query = mysqli_query($conn, "CALL getCantidadCarrito('$userID');");
    	if (!$query) {
		    die("Error: ".mysqli_error($conn));
		}
		$numrows = mysqli_num_rows($query);
		if ($numrows!=0) {
	    	while($row = mysqli_fetch_assoc($query)) {
	    		$cantidadCarrito = $row['cantidad'];
	    	}
	    }
    	mysqli_next_result($conn); //TIENE que ir o hay error
    	return $cantidadCarrito;
    }

    //Poner el id de la ferretería en la que uno está comprando por defecto

?>