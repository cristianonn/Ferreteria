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
                        $row['marcaProducto'], $row['nombreDepartamento'], $row['cantidad']];
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

    function getProductosCarrito() {
        $conn = $_SESSION['conn'];
        $idCliente = $_SESSION['userID'];
        $arrayCarrito = [];
        $query = mysqli_query($conn, "CALL productosCarrito('$idCliente');");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        $numrows = mysqli_num_rows($query);
        if ($numrows != 0) {
            while($row = mysqli_fetch_assoc($query)) {
                $arrayCarrito[] = $row;
            }
        }
        mysqli_next_result($conn);
        return $arrayCarrito;
    }

    function eliminarDeCarrito($idInventario) {
        $conn = $_SESSION['conn'];
        $idCliente = $_SESSION['userID'];
        $query = mysqli_query($conn, "CALL eliminarDeCarrito('$idInventario', '$idCliente');");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
    }

    function hacerPedido($idEmpleado) {
        $conn = $_SESSION['conn'];
        $idCliente = $_SESSION['userID'];
        $idPedido = 0;
        if ($idEmpleado == 0) {
            $query = mysqli_query($conn, "CALL hacerPedido('$idCliente', NULL);");
        }
        else {
            $query = mysqli_query($conn, "CALL hacerPedido('$idCliente', '$idEmpleado');");
        }
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        $numrows = mysqli_num_rows($query);
        if ($numrows != 0) {
            while($row = mysqli_fetch_assoc($query)) {
                $idPedido = $row['idPedido'];
            }
        }
        mysqli_next_result($conn);
        return $idPedido;
    }

    function getEmpleados() {
        $conn = $_SESSION['conn'];
        $arrayEmpleados = [];
        $query = mysqli_query($conn, "CALL getEmpleados();");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        $numrows = mysqli_num_rows($query);
        if ($numrows != 0) {
            while($row = mysqli_fetch_assoc($query)) {
                $arrayEmpleados[] = ["idEmpleado" => $row['idEmpleado'],
                    "nombreEmpleado" => $row['nombreEmpleado'] . " " . $row['apellidosEmpleado']];
            }
        }
        mysqli_next_result($conn);
        return $arrayEmpleados;
    }

    function agregarAPedido($idInventario, $idPedido, $cantidad) {
        $conn = $_SESSION['conn'];
        $idCliente = $_SESSION['userID'];
        $query = mysqli_query($conn, "CALL agregarAPedido('$idInventario', '$idPedido', '$cantidad');");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
    }
    function getProductosDePedido($idPedido) {
        $conn = $_SESSION['conn'];
        $arrayProductos = [];
        $query = mysqli_query($conn, "CALL getProductosDePedido('$idPedido');");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        $numrows = mysqli_num_rows($query);
        if ($numrows != 0) {
            while($row = mysqli_fetch_assoc($query)) {
                $arrayProductos[] = $row;
            }
        }
        mysqli_next_result($conn);
        return $arrayProductos;
    }

    function getTotalPedido($idPedido) {
        $conn = $_SESSION['conn'];
        $total = 0;
        $query = mysqli_query($conn, "CALL getTotalPedido('$idPedido');");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        $numrows = mysqli_num_rows($query);
        if ($numrows != 0) {
            while($row = mysqli_fetch_assoc($query)) {
                $total = $row['precio'];
            }
        }
        mysqli_next_result($conn);
        return $total;
    }

?>