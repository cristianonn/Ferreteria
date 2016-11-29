<?php
    /* Ferreteria - Bases de Datos II
     * nuevaruta.php - Agregar una nueva ruta
     * Creado: 29/11/16 Gabriela Garro
     */
    include("session.php");
    //Chequear si se envió el form
    if (isset($_POST['submit'])) {
        $idRuta = crearRuta($_POST['zona'], $_POST['idEmpleado']);
        for ($i = 0; $i < $_POST["cantidadClientes"]; $i++) {
            if (isset($_POST["cliente" . $i])) {
                $idCliente = $_POST["cliente" . $i];
                agregarClienteARuta($idRuta, $idCliente);
            }
        }
    }
    $arrayChoferes = getChoferes();
    $arrayClientes = getClientesSinRuta();
    $cantidadClientes = sizeof($arrayClientes);
?>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Agregar nueva ruta</title>

    <link rel="shortcut icon" href="../img/favicon.ico" type="image/x-icon">
    <link rel="icon" href="../img/favicon.ico" type="image/x-icon">

    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

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
        arrayChoferes = <?php echo json_encode($arrayChoferes); ?>;
        arrayClientes = <?php echo json_encode($arrayClientes); ?>;
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
        function crearCheckboxes() {
            var container = document.getElementById("clientes");
            for (var i = 0; i < arrayClientes.length; i++) {
                var checkbox = document.createElement('input');
                checkbox.type = "checkbox";
                checkbox.name = "cliente" + i;
                checkbox.value = arrayClientes[i]["idCliente"];
                checkbox.class = "form-control";

                var label = document.createTextNode(" " + arrayClientes[i]["nombre"] 
                    + " (" + arrayClientes[i]["direccion"] + ")");
                container.appendChild(document.createElement('br'));
                container.appendChild(checkbox);
                container.appendChild(label);
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
                    <h1 class="page-header">Agregar nueva ruta</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <form role="form" action="nuevaruta.php" method="POST" class="registration-form">
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Zona de la ruta</label>
                            <input type="text" class="form-control" placeholder="Zona..." name="zona" id="zona" maxlength="100">
                        </div>
                    </div>
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Chofer</label>
                            <select name="idEmpleado" id="idEmpleado" class="form-control">
                                <option>Seleccione un chofer...</option>
                            </select>
                            <script>
                                popular("idEmpleado", arrayChoferes, 0, 1);
                            </script>
                        </div>
                    </div>
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls" id="clientes">
                            <label>Clientes por ruta</label>
                        </div>
                        <script>
                            crearCheckboxes();
                        </script>
                        <input type="hidden" name="cantidadClientes" value=<?php echo "\"" . $cantidadClientes . "\""; ?>>
                    </div>
                    <hr>
                    <input name="submit" type="submit" class="btn btn-primary" value = "Agregar ruta">
                </form>
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

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>
