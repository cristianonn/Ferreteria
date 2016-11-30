<?php
    /* Ferreteria - Bases de Datos II
     * despacharpedido.php - Despachar pedidos por ruta
     * Creado: 30/11/16 Gabriela Garro
     */
    include("session.php"); 
    if (isset($_GET['despachar'])) {
        $idPedido = $_GET['despachar'];
        despacharPedido($idPedido);
    }    
    $arrayRutas = getRutas();
    $arrayPedidos = getPedidosPorRutaNoDespachados();
?>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Despachar pedidos</title>

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

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>
        arrayRutas = <?php echo json_encode($arrayRutas); ?>;
        arrayPedidos = <?php echo json_encode($arrayPedidos); ?>;
        function popular(selectId, array, pvalue, ptext) {
            var select = document.getElementById(selectId);
            for (var i = 0; i < array.length; i++) {
                var value = array[i][pvalue];
                var text = array[i][ptext];
                var option = document.createElement("option");
                option.textContent = text;
                option.value = value;
                select.appendChild(option);
            }
        }

        function rutaOnChange() {
            idRuta = document.getElementById("idRuta").value;
            arrayPedidosXRuta = arrayPedidos[idRuta];
            if (typeof tabla === 'undefined') {
                tabla = $('#pedidos').DataTable( {
                    data: arrayPedidosXRuta,
                    columns: [
                        {title: "Id."},
                        {title: "Nombre de Cliente"},
                        {title: "Estado"},
                        {title: "Fecha"},
                        {title: "Total (₡)"},
                        {title: "Despachar"}
                    ]
                } );
            }
            else { 
                idRuta = document.getElementById("idRuta").value;
                arrayPedidosXRuta = arrayPedidos[idRuta];
                tabla.clear().draw();
                if (arrayPedidosXRuta.length != 0) {
                    tabla.rows.add(arrayPedidosXRuta).draw();
                }
            }
        }
    </script>

</head>

<body>

    <div id="wrapper">

    <?php include("toolbar.php"); ?>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Pedidos</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <select name="idRuta" id="idRuta" class="form-control" onchange="rutaOnChange();">
                    <option>Seleccione una ruta...</option>
                </select>
                <script>
                    popular("idRuta", arrayRutas, "idRuta", "zona");
                </script>
                <br/>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <table id="pedidos" 
                        class="table table-striped table-bordered table-hover" 
                        width="100%"></table>
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

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>
