<?php
    /* Ferreteria - Bases de Datos II
     * reportarvehiculo.php - Agregar una nueva ruta
     * Creado: 29/11/16 Gabriela Garro
     */
    include("session.php");
    //Chequear si se envió el form
    if (isset($_POST['submit'])) {
        $placa = $_POST['placaVehiculo'];
        $kilometros = $_POST['kilometros'];
        if ($kilometros == "") $kilometros = 0;
        $gasolina = $_POST['gasolina'];
        if ($gasolina == "") $gasolina = 0;
        reportarGastosVehiculo($placa, $kilometros, $gasolina);
    }
    $arrayVehiculos = getListaVehiculos();
?>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Reportar gastos de vehículo</title>

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
        arrayVehiculos = <?php echo json_encode($arrayVehiculos); ?>;
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
    </script>

</head>

<body>

    <div id="wrapper">

    <?php include("toolbar.php"); ?>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Reportar gastos de vehículo</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <form role="form" action="reportarvehiculo.php" method="POST" class="registration-form">
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Vehículo</label>
                            <select name="placaVehiculo" id="placaVehiculo" class="form-control">
                                <option>Seleccione un vehículo...</option>
                            </select>
                            <script>
                                popular("placaVehiculo", arrayVehiculos, 0, 1);
                            </script>
                        </div>
                    </div>
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Kilómetros</label>
                            <input type="number" class="form-control" placeholder="Kilómetros..." name="kilometros" id="kilometros" step="0.1">
                        </div>
                    </div>
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Litros de gasolina</label>
                            <input type="number" class="form-control" placeholder="Litros de gasolina..." name="gasolina" id="gasolina" step="0.1">
                        </div>
                    </div>
                    <hr>
                    <input name="submit" type="submit" class="btn btn-primary" value = "Reportar gastos">
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
