<?php
	header('Content-type: text/html; charset=utf-8');
	header('Content-type: text/html; charset=utf-8');
	if (session_status() == PHP_SESSION_NONE) {
        session_start();
    }
	$dbhost = "localhost";
	$dbuser = "usuarionormal";
	$dbpass = "12345";
	$dbname = "ferreterias";
	$dberror = "No se pudo conectar a la base de datos.";

	$conn = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname) or die($dberror);
	$_SESSION['conn'] = $conn;
?>