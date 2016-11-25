<?php
	include("../connection.php");
	header('Content-type: text/html; charset=utf-8');
	if (session_status() == PHP_SESSION_NONE) {
        session_start();
    }
    $conn = $_SESSION['conn'];

    //Si por alguna razón está en estas páginas sin haber iniciado sesión...
    if (!isset($_SESSION['userIDEmpleado'])) {
        header("../index.php#NotLoggedIn");
    }

    function getFerreterias() {
        $conn = $_SESSION['conn'];
        $arrayFerreterias = [];
        $query = mysqli_query($conn, "CALL getFerreterias();");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        $numrows = mysqli_num_rows($query);
        if ($numrows!=0) {
            while($row = mysqli_fetch_assoc($query)) {
                $arrayFerreterias[] = $row;
            }
        }
        mysqli_next_result($conn); //TIENE que ir o hay error
        return $arrayFerreterias;
    }

    function getProductosPorFerreteria() {
        $conn = $_SESSION['conn'];
        $arrayFerreterias = getFerreterias();
        $arrayProductos = [];
        for ($i = 0; $i < sizeof($arrayFerreterias); $i++) {
            $idFerreteria = $arrayFerreterias[$i]["idFerreteria"];
            $query = mysqli_query($conn, "CALL seleccionarProductosPorFerreteria('$idFerreteria')");
            if (!$query) {
                die ("Error: " . mysqli_error($conn));
            }
            $numrows = mysqli_num_rows($query);
            if ($numrows != 0) {
                while($row = mysqli_fetch_assoc($query)) {
                    $arrayProductos[$idFerreteria][] = [$row['idProducto'], $row['nombreProducto'], 
                        $row['precioProducto'], $row['marcaProducto'], $row['nombreDepartamento'], 
                        $row['cantidad'], "<a class=\"btn btn-default\" href=\"inventario.php?editar=" . $row['idProducto'] . "&idf=" . $idFerreteria . "\"><i class=\"fa fa-pencil\" aria-hidden=\"true\"></i></a>",
                        "<a class=\"btn btn-default\" href=\"inventario.php?eliminar=" . $row['idProducto'] . "&idf=" . $idFerreteria . "\"><i class=\"fa fa-trash\" aria-hidden=\"true\"></i></a>"];
                }
            }
            mysqli_next_result($conn);
        }
        return $arrayProductos;
    }

    function eliminarLineaInventario($idInventario, $idFerreteria) {
    	$conn = $_SESSION['conn'];
    	$query = mysqli_query($conn, "CALL eliminarLineaInventario('$idInventario', '$idFerreteria');");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
    }

    function getProductos() {
    	$conn = $_SESSION['conn'];
    	$arrayProductos = [];
    	$query = mysqli_query($conn, "CALL getProductos();");
    	if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        $numrows = mysqli_num_rows($query);
        if ($numrows!=0) {
            while($row = mysqli_fetch_assoc($query)) {
                $arrayProductos[] = [$row['idProducto'], $row['nombreProducto'], 
                	$row['precioProducto'], $row['descripcionProducto'], $row['garantia'],
                	$row['nombreDepartamento'], $row['nombreMarca'],
                	"<a class=\"btn btn-default\" href=\"productos.php?editar=" . $row['idProducto'] . "\"><i class=\"fa fa-pencil\" aria-hidden=\"true\"></i></a>",
                	"<a class=\"btn btn-default\" href=\"productos.php?eliminar=" . $row['idProducto'] . "\"><i class=\"fa fa-trash\" aria-hidden=\"true\"></i></a>"];
            }
        }
        mysqli_next_result($conn); //TIENE que ir o hay error
        return $arrayProductos;
    }
?>