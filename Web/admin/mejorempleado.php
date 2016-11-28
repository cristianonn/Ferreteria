<?php
    /* Empleado - Bases de Datos II
     * productos.php - Ver catálogo de productos
     * Creado: 25/11/16 Gabriela Garro
     */
    include("session.php");
    /*if (isset($_GET['eliminar']) || isset($_GET['idf'])) {
        $idProducto = $_GET['eliminar'];
        $idEmpleado = $_GET['idf'];
        eliminarLineaInventario($idProducto, $idEmpleado);
        echo "Producto " . $idProducto . " eliminado.";
    }*/
    
    $idEmpleado = '';
    $ventas = '';
    $arrayEmpleado = getMejorEmpleado();
    if ($arrayEmpleado != null) 
    {
        $idEmpleado = $arrayEmpleado['id'];
        $nombre = $arrayEmpleado['nombreEmpleado'];
        $apellidos = $arrayEmpleado['apellidosEmpleado'];
        $ventas = $arrayEmpleado['ventas'];
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Mejor Empleado</title>

    <link rel="shortcut icon" href="../img/favicon.ico" type="image/x-icon">
    <link rel="icon" href="../img/favicon.ico" type="image/x-icon">

    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="../vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="../vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Font Awesome -->
    <script src="https://use.fontawesome.com/554db7ace5.js"></script>

    <!-- Datatables JS -->
    <script src="https://code.jquery.com/jquery-1.12.3.js"></script>
    <script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
 	<![endif]-->
 	<script>
        arrayPasillos
        idEmpleado = <?php echo json_encode($arrayPasillos[0]); ?>;
        ventasEmpleado  = <?php echo json_encode($arrayPasillos[1]); ?>;

    </script>
</head>


<body>

    <div id="wrapper">

    <?php include("toolbar.php"); ?>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Mejor Empleado</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <table class="table" >
                            <tbody>
                                <tr>
                                    <th><b>ID Empleado</b></th>
                                    <td><?php echo $idEmpleado; ?></td>
                                </tr>
                                <tr>
                                    <th>Nombre</th>
                                    <td><?php echo $nombre; ?></td>
                                </tr>
                                <tr>
                                    <th><b>Apellidos</b></th>
                                    <td><?php echo $apellidos; ?></td>
                                </tr>
                                <tr>
                                    <th>Total de ganancias</th>
                                    <td>₡ <?php echo $ventas; ?></td>
                                </tr>
                        </table>
                    </div>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="../vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="../vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="../vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="../vendor/raphael/raphael.min.js"></script>
    <script src="../vendor/morrisjs/morris.min.js"></script>
    <script src="../data/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>