<?php
	header('Content-type: text/html; charset=utf-8');
	$dbhost = "localhost";
	$dbuser = "usuarionormal";
	$dbpass = "12345";
	$dbname = "myscrum";
	$dberror = "No se pudo conectar a la base de datos.";

	$conn = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname) or die($dberror);
	$_SESSION['conn'] = $conn;
?>