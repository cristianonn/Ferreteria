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
    function getCantidadBackOrder() {
        $conn = $_SESSION['conn'];
        $userID = $_SESSION['userID'];
        $cantidadBackOrder = 0;
        $query = mysqli_query($conn, "CALL getCantidadBackOrder('$userID');");
        if (!$query) {
            die("Error: ".mysqli_error($conn));
        }
        $numrows = mysqli_num_rows($query);
        if ($numrows!=0) {
            while($row = mysqli_fetch_assoc($query)) {
                $cantidadBackOrder = $row['cantidad'];
            }
        }
        mysqli_next_result($conn); //TIENE que ir o hay error
        return $cantidadBackOrder;
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
                    $arrayProductos[$idFerreteria][] = ["<a href=\"producto.php?idf=" . $idFerreteria .
                    "&idp=" . $row['idProducto'] . "\">" . $row['nombreProducto'] . "</a>", 
                        $row['precioProducto'], $row['descripcionProducto'], 
                        $row['marcaProducto'], $row['nombreDepartamento'], $row['cantidad'],];
                }
            }
            mysqli_next_result($conn);
        }
        return $arrayProductos;
    }

    function getProductoEnFerreteria($idProducto, $idFerreteria) {
        $conn = $_SESSION['conn'];
        $arrayProducto = [];
        $query = mysqli_query($conn, "CALL getProductoEnFerreteria('$idProducto', '$idFerreteria');");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        $numrows = mysqli_num_rows($query);
        if ($numrows != 0) {
            while($row = mysqli_fetch_assoc($query)) {
                $arrayProducto = $row;
            }
        }
        mysqli_next_result($conn);
        return $arrayProducto;
    }

    function estaEnCarrito($idProducto, $idFerreteria) {
        $conn = $_SESSION['conn'];
        $idCliente = $_SESSION['userID'];
        $cantidad = 0;
        $query = mysqli_query($conn, "CALL estaEnCarrito('$idProducto', '$idFerreteria', '$idCliente');");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        $numrows = mysqli_num_rows($query);
        if ($numrows != 0) {
            while($row = mysqli_fetch_assoc($query)) {
                $cantidad = $row['cantidad'];
            }
        }
        mysqli_next_result($conn);
        return $cantidad;
    }

    function agregarACarrito($idProducto, $idFerreteria) {
        $conn = $_SESSION['conn'];
        $idCliente = $_SESSION['userID'];
        $query = mysqli_query($conn, "CALL agregarACarrito('$idProducto', '$idFerreteria', '$idCliente');");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        //mysqli_next_result($conn);
    }

    function estaEnBackOrder($idProducto, $idFerreteria) {
        $conn = $_SESSION['conn'];
        $idCliente = $_SESSION['userID'];
        $cantidad = 0;
        $query = mysqli_query($conn, "CALL estaEnbackOrder('$idProducto', '$idFerreteria', '$idCliente');");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        $numrows = mysqli_num_rows($query);
        if ($numrows != 0) {
            while($row = mysqli_fetch_assoc($query)) {
                $cantidad = $row['cantidad'];
            }
        }
        mysqli_next_result($conn);
        return $cantidad;
    }

    function agregarABackOrder($idProducto, $idFerreteria) {
        $conn = $_SESSION['conn'];
        $idCliente = $_SESSION['userID'];
        $query = mysqli_query($conn, "CALL agregarABackOrder('$idProducto', '$idFerreteria', '$idCliente');");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        //mysqli_next_result($conn);
    }

?>