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
                    $row['vacacionesEmpleado'], $row['TipoEmpleado_idTipoEmpleado'],
                    "<a class=\"btn btn-default\" href=\"empleados.php?editar=" . $row['idEmpleado'] . "\"><i class=\"fa fa-pencil\" aria-hidden=\"true\"></i></a>",
                    "<a class=\"btn btn-default\" href=\"empleados.php?eliminar=" . $row['idEmpleado'] . "\"><i class=\"fa fa-trash\" aria-hidden=\"true\"></i></a>"];
            }
        }
        mysqli_next_result($conn); //TIENE que ir o hay error
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
                $arrayDepartamentos[] = [$row['idDepartamento'], $row['nombreDepartamento']];
            }
        }
        mysqli_next_result($conn);
        return $arrayDepartamentos;
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
        $query = mysqli_query($conn, "CALL agregarCliente('$pId', '$pNombre','$pApe','$pTel','$pCorreo');");
        if (!$query) {
            die ("Error: " . mysqli_error($conn));
        }
        else {
            echo "Cliente " . $pId . " agregado.";
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
?>