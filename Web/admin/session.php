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


    function getTodasFerreterias() {
        $conn = $_SESSION['conn'];
        $arrayFerreterias = [];
        $query = mysqli_query($conn, "CALL getFerreterias();");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        $numrows = mysqli_num_rows($query);
        if ($numrows!=0) {
            while($row = mysqli_fetch_assoc($query)) {
                $arrayFerreterias[] = [$row['idFerreteria'], $row['nombreFerreteria'], 
                    $row['telefonoFerreteria'],$row['latitud'], $row['longitud'], $row['direccion'],
                    "<a class=\"btn btn-default\" href=\"ferreterias.php?editar=" . $row['idFerreteria'] . "\"><i class=\"fa fa-pencil\" aria-hidden=\"true\"></i></a>",
                    "<a class=\"btn btn-default\" href=\"ferreterias.php?eliminar=" . $row['idFerreteria'] . "\"><i class=\"fa fa-trash\" aria-hidden=\"true\"></i></a>"];
            }
        }
        mysqli_next_result($conn); //TIENE que ir o hay error
        return $arrayFerreterias;
    }

    /*----------------------Empleados-----------------------*/
    function getEmpleados() {
        $conn = $_SESSION['conn'];
        $arrayEmpleados = [];
        $query = mysqli_query($conn, "CALL getEmpleados();");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        $numrows = mysqli_num_rows($query);
        if ($numrows!=0) {
            while($row = mysqli_fetch_assoc($query)) {
                $arrayEmpleados[] = [$row['idEmpleado'], $row['nombreEmpleado'], 
                    $row['apellidosEmpleado'], $row['telEmpleado'], $row['fechaEntrada'],
                    $row['vacacionesEmpleado'], $row['tipo'],
                    "<a class=\"btn btn-default\" href=\"empleados.php?editar=" . $row['idEmpleado'] . "\"><i class=\"fa fa-pencil\" aria-hidden=\"true\"></i></a>",
                    "<a class=\"btn btn-default\" href=\"empleados.php?eliminar=" . $row['idEmpleado'] . "\"><i class=\"fa fa-trash\" aria-hidden=\"true\"></i></a>"];
            }
        }
        mysqli_next_result($conn); 
        return $arrayEmpleados;
    }


    function getTipoEmpleadosEditar() {
        $conn = $_SESSION['conn'];
        $arrayTiposs = [];
        $query = mysqli_query($conn, "CALL getTipoEmpleados();");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        $numrows = mysqli_num_rows($query);
        if ($numrows!=0) {
            while($row = mysqli_fetch_assoc($query)) {
                $arrayTipos[] = [$row['idTipoEmpleado'], $row['tipo'],
                    "<a class=\"btn btn-default\" href=\"empleados.php?editar=" . $row['idTipoEmpleado'] . "\"><i class=\"fa fa-pencil\" aria-hidden=\"true\"></i></a>",
                    "<a class=\"btn btn-default\" href=\"empleados.php?eliminar=" . $row['idTipoEmpleado'] . "\"><i class=\"fa fa-trash\" aria-hidden=\"true\"></i></a>"];
            }
        }
        mysqli_next_result($conn);
        return $arrayTipos;
    }

    function agregarEmpleado($pId,$pNombre,$pApe,$pTel,$pTipo) {
        $conn = $_SESSION['conn'];
        $query = mysqli_query($conn, "CALL agregarEmpleado('$pId', '$pNombre','$pApe','$pTel','$pTipo');");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        else {
            echo "Empleado " . $pId . " agregado.";
        }
    }

    function getTiposEmpleado() {
        $conn = $_SESSION['conn'];
        $arrayTiposs = [];
        $query = mysqli_query($conn, "CALL getTipoEmpleados();");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        $numrows = mysqli_num_rows($query);
        if ($numrows != 0) {
            while($row = mysqli_fetch_assoc($query)) {
                $arrayTipos[] = [$row['idTipoEmpleado'], $row['tipo']];
            }
        }
        mysqli_next_result($conn);
        return $arrayTipos;
    }

    function getDepartamentos() {
        $conn = $_SESSION['conn'];
        $arrayDepartamentos = [];
        $query = mysqli_query($conn, "CALL getDepartamentos();");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        $numrows = mysqli_num_rows($query);
        if ($numrows != 0) {
            while($row = mysqli_fetch_assoc($query)) {
                $arrayDepartamentos[] = [$row['idDepartamento'], $row['nombreDepartamento'],
                "<a class=\"btn btn-default\" href=\"empleados.php?editar=" . $row['idDepartamento'] . "\"><i class=\"fa fa-pencil\" aria-hidden=\"true\"></i></a>",
                "<a class=\"btn btn-default\" href=\"empleados.php?eliminar=" . $row['idDepartamento'] . "\"><i class=\"fa fa-trash\" aria-hidden=\"true\"></i></a>"];
            }
        }
        mysqli_next_result($conn);
        return $arrayDepartamentos;
    }

    function getPasillos() {
        $conn = $_SESSION['conn'];
        $arrayPasillos = [];
        $query = mysqli_query($conn, "CALL getPasillos();");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        $numrows = mysqli_num_rows($query);
        if ($numrows != 0) {
            while($row = mysqli_fetch_assoc($query)) {
                $arrayPasillos[] = [$row['idPasillo'], $row['numeroPasillo'],
                "<a class=\"btn btn-default\" href=\"pasillos.php?editar=" . $row['idPasillo'] . "\"><i class=\"fa fa-pencil\" aria-hidden=\"true\"></i></a>",
                "<a class=\"btn btn-default\" href=\"pasillos.php?eliminar=" . $row['idPasillo'] . "\"><i class=\"fa fa-trash\" aria-hidden=\"true\"></i></a>"];
            }
        }
        mysqli_next_result($conn);
        return $arrayPasillos;
    }

    function getEstantes() {
        $conn = $_SESSION['conn'];
        $arrayEstantes = [];
        $query = mysqli_query($conn, "CALL getEstantes();");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        $numrows = mysqli_num_rows($query);
        if ($numrows != 0) {
            while($row = mysqli_fetch_assoc($query)) {
                $arrayEstantes[] = [$row['idEstante'], $row['numeroEstante'],
                "<a class=\"btn btn-default\" href=\"empleados.php?editar=" . $row['idEstante'] . "\"><i class=\"fa fa-pencil\" aria-hidden=\"true\"></i></a>",
                "<a class=\"btn btn-default\" href=\"empleados.php?eliminar=" . $row['idEstante'] . "\"><i class=\"fa fa-trash\" aria-hidden=\"true\"></i></a>"];
            }
        }
        mysqli_next_result($conn);
        return $arrayEstantes;
    }

    function getMarcas() {
        $conn = $_SESSION['conn'];
        $arrayMarcas = [];
        $query = mysqli_query($conn, "CALL getMarcas();");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        $numrows = mysqli_num_rows($query);
        if ($numrows != 0) {
            while($row = mysqli_fetch_assoc($query)) {
                $arrayMarcas[] = [$row['idMarca'], $row['nombreMarca']];
            }
        }
        mysqli_next_result($conn);
        return $arrayMarcas;
    }

    function agregarProducto($nombre, $precio, $descripcion, $aspectostecnicos, $utilidad,
            $garantia, $idDepartamento, $idMarca, $carpeta, $arrayImagen) {
        $conn = $_SESSION['conn'];
        $idProducto = 0;
        $query = mysqli_query($conn, "CALL agregarProducto('$nombre', '$precio', '$descripcion', 
            '$aspectostecnicos', '$utilidad', '$garantia', '$idDepartamento', '$idMarca');");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        else {
            $numrows = mysqli_num_rows($query);
            if ($numrows != 0) {
                while($row = mysqli_fetch_assoc($query)) {
                    $idProducto = $row['idProducto'];
                }
            }
            echo "Producto " . $idProducto . " agregado.\n";
            mysqli_next_result($conn);
            //Agregar imagen
            $nombreImagen = basename($arrayImagen['name']);
            $query = mysqli_query($conn, "CALL agregarImagenProducto('$idProducto', '$nombreImagen');");
            if (!$query) {
                die ("Error: " . mysqli_error($conn));
            }
            else {
                if (move_uploaded_file($arrayImagen['tmp_name'], $carpeta . $nombreImagen)) {
                    echo "Imagen " . $nombreImagen . " subida.";
                }
                else {
                    echo "Error subiendo imagen.";
                }
            }
            //Agregar producto a todos los inventarios
            $query = mysqli_query($conn, "CALL agregarProductoAInventarios('$idProducto');");
            if (!$query) {
                die ("Error: " . mysqli_error($conn));
            }
            else {
                " Producto agregado a inventarios.";
            }
        }  
    }

    function eliminarProducto($pId) {
        $conn = $_SESSION['conn'];
        $query = mysqli_query($conn, "CALL eliminarProducto('$pId');");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        else {
            echo "Producto " . $pId . " eliminado.";
        }
    }

/*------------- CLiente ----------*/
    function agregarCliente($pId,$pNombre,$pApe,$pTel,$pCorreo) {
        $conn = $_SESSION['conn'];
        $idCliente = 0;
        $query = mysqli_query($conn, "CALL agregarCliente('$pId', '$pNombre','$pApe','$pTel','$pCorreo');");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        else {
            echo "Cliente " . $pId . " agregado. ";
        }
    }



    function getClientes() {
        $conn = $_SESSION['conn'];
        $arrayClientes = [];
        $query = mysqli_query($conn, "CALL getClientes();");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        $numrows = mysqli_num_rows($query);
        if ($numrows!=0) {
            while($row = mysqli_fetch_assoc($query)) {
                $arrayClientes[] = [$row['idCliente'], $row['nombreCliente'], 
                    $row['apellidosCliente'], $row['telCliente'], $row['correoCliente'],
                    "<a class=\"btn btn-default\" href=\"clientes.php?eliminar=" . $row['idCliente'] . "\"><i class=\"fa fa-trash\" aria-hidden=\"true\"></i></a>"];
            }
        }
        mysqli_next_result($conn); //TIENE que ir o hay error
        return $arrayClientes;
    }

    function eliminarCliente($pId) {
        $conn = $_SESSION['conn'];
        $query = mysqli_query($conn, "CALL eliminarCliente('$pId');");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        else {
            echo "Cliente" . $pId . " eliminado.";
        }
    }



    function getMejorFerreteria() {
        $conn = $_SESSION['conn'];
        $arrayFerreteria = [];
        $query = mysqli_query($conn, "CALL verMejorFerreteria();");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        $numrows = mysqli_num_rows($query);
        if ($numrows != 0) {
            while($row = mysqli_fetch_assoc($query)) {
                $arrayFerreteria = $row;
            }
        }
        mysqli_next_result($conn);
        return $arrayFerreteria;
    }

    function getMejoresFerreterias($fecha1, $fecha2) {
        $conn = $_SESSION['conn'];
        $arrayFerreteria = [];
        $query = mysqli_query($conn, "CALL ventasFerreterias('$fecha1', '$fecha2');");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        $numrows = mysqli_num_rows($query);
        if ($numrows != 0) {
            while($row = mysqli_fetch_assoc($query)) {
                $arrayFerreteria[] = [$row['idFerreteria'], $row['nombreFerreteria'], $row['ventas']];
            }
        }
        mysqli_next_result($conn);
        return $arrayFerreteria;
    }

    function getMejorEmpleado($fecha1, $fecha2) {
        $conn = $_SESSION['conn'];
        $arrayEmpleado = [];
        $query = mysqli_query($conn, "CALL verMejorEmpleado('$fecha1', '$fecha2');");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        $numrows = mysqli_num_rows($query);
        if ($numrows != 0) {
            while($row = mysqli_fetch_assoc($query)) {
                $arrayEmpleado[] = [$row['idEmpleado'], $row['nombreEmpleado'],
                    $row['apellidosEmpleado'], $row['ventas']];
            }
        }
        mysqli_next_result($conn);
        return $arrayEmpleado;
    }

    function getChoferes() {
        $conn = $_SESSION['conn'];
        $arrayEmpleado = [];
        $query = mysqli_query($conn, "CALL getChoferes();");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        $numrows = mysqli_num_rows($query);
        if ($numrows != 0) {
            while($row = mysqli_fetch_assoc($query)) {
                $arrayEmpleado[] = [$row['idEmpleado'], $row['nombreEmpleado'] . " " . $row['apellidosEmpleado']];
            }
        }
        mysqli_next_result($conn);
        return $arrayEmpleado;
    }

    function getClientesSinRuta() {
        $conn = $_SESSION['conn'];
        $arrayClientes = [];
        $query = mysqli_query($conn, "CALL getClientesSinRuta();");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        $numrows = mysqli_num_rows($query);
        if ($numrows != 0) {
            while($row = mysqli_fetch_assoc($query)) {
                $arrayClientes[] = ["idCliente" => $row['idCliente'], 
                    "nombre" => $row['nombreCliente'] . " " . $row['apellidosCliente'],
                    "direccion" => $row['direccion']];
            }
        }
        mysqli_next_result($conn);
        return $arrayClientes;
    }

    function crearRuta($zona, $idChofer) {
        $conn = $_SESSION['conn'];
        $idRuta = 0;
        $query = mysqli_query($conn, "CALL crearRuta('$zona', '$idChofer');");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        $numrows = mysqli_num_rows($query);
        if ($numrows != 0) {
            while($row = mysqli_fetch_assoc($query)) {
                $idRuta = $row['idRuta'];
            }
        }
        mysqli_next_result($conn);
        echo "Ruta " . $idRuta . " creada. ";
        return $idRuta;
    }

    function agregarClienteARuta($idRuta, $idCliente) {
        $conn = $_SESSION['conn'];
        $query = mysqli_query($conn, "CALL agregarClienteARuta('$idRuta', '$idCliente');");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        else {
            echo "Cliente" . $idCliente . " agregado a ruta " . $idRuta;
        }
    }

    function getRutas() {
        $conn = $_SESSION['conn'];
        $arrayRutas = [];
        $query = mysqli_query($conn, "CALL getRutas();");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        $numrows = mysqli_num_rows($query);
        if ($numrows != 0) {
            while($row = mysqli_fetch_assoc($query)) {
                $arrayRutas[] = ["idRuta" => $row['idRuta'],
                    "zona" => $row['zona']];
            }
        }
        mysqli_next_result($conn);
        return $arrayRutas;
    }

    function getTablaRutas() {
        $conn = $_SESSION['conn'];
        $arrayRutas = [];
        $query = mysqli_query($conn, "CALL getRutas();");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        $numrows = mysqli_num_rows($query);
        if ($numrows != 0) {
            while($row = mysqli_fetch_assoc($query)) {
                $arrayRutas[] = [$row['idRuta'], $row['zona'],
                    "<a href=\"#\" data-toggle=\"modal\" data-target=\"#ruta\" id=\"mapa\"
                        onclick=\"cambiarRuta(" . $row['idRuta'] . ")\">
                    <i class=\"fa fa-share\" aria-hidden=\"true\"></i> Ver</a>"];
            }
        }
        mysqli_next_result($conn);
        return $arrayRutas;
    }

    function getRutasClientes() {
        $conn = $_SESSION['conn'];
        $arrayRutas = getRutas();
        $arrayRutasClientes = [];
        for ($i = 0; $i < sizeof($arrayRutas); $i++) {
            $idRuta = $arrayRutas[$i]["idRuta"];
            $zona = $arrayRutas[$i]["zona"];
            //$arrayRutasClientes[$idRuta]["zona"] = $zona;
            $clientes = [];
            $query = mysqli_query($conn, "CALL getClientesPorRuta('$idRuta');");
            if (!$query) {
                die ("Error: " . mysqli_error($conn));
            }
            $numrows = mysqli_num_rows($query);
            if ($numrows != 0) {
                while($row = mysqli_fetch_assoc($query)) {
                    $clientes[] = [$row['idCliente'],
                        $row['nombreCliente'] . " " . $row['apellidosCliente'],
                        $row['latitud'],
                        $row['longitud']];                
                }
                $arrayRutasClientes[$idRuta] = $clientes;
            }
            mysqli_next_result($conn);
        }
        return $arrayRutasClientes;
    }


    function getVentasPorFerreteria() {
        $conn = $_SESSION['conn'];
        $arrayFerreterias = getFerreterias();
        $arrayProductos = [];
        for ($i = 0; $i < sizeof($arrayFerreterias); $i++) {
            $idFerreteria = $arrayFerreterias[$i]["idFerreteria"];
            $query = mysqli_query($conn, "CALL organizarPasillos('$idFerreteria')");
            if (!$query) {
                die ("Error: " . mysqli_error($conn));
            }
            $numrows = mysqli_num_rows($query);
            if ($numrows != 0) {
                while($row = mysqli_fetch_assoc($query)) {
                    $arrayProductos[$idFerreteria][] = [$row['idProducto'], $row['nombreProducto'], 
                        $row['idPasillo'], $row['idEstante'], $row['cantidad'],
                        "<a class=\"btn btn-default\" href=\"mejoresventas.php?editar=" . $row['idProducto'] . "\"><i class=\"fa fa-pencil\" aria-hidden=\"true\"></i></a>"];
                }
            }
            mysqli_next_result($conn);
        }
        return $arrayProductos;
    }
?>