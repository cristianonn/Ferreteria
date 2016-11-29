<?php
    /* Ferreteria - Bases de Datos II
     * nuevoempleado.php - Agregar un nuevo empleado
     * Creado: 25/11/16 Gabriela Garro
     */
    include("session.php");
    $arrayRutas = getRutas();

    //Chequear si se envió el form
    if (isset($_POST['submit'])) {
        unset($_POST['submit']);
        $identificacion = $_POST['identificacion'];
        $nombre = $_POST['nombre'];
        $apellidos = $_POST['apellidos'];
        $telefono = $_POST['telefono'];
        $correo = $_POST['correo'];
        $idRuta = $_POST['idRuta'];
        agregarCliente($identificacion, $nombre, $apellidos, $telefono, $correo);
        agregarClienteARuta($idRuta, $identificacion);
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

    <title>Agregar nuevo cliente</title>

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
        arrayRutas = <?php echo json_encode($arrayRutas); ?>;
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
                    <h1 class="page-header">Agregar nuevo cliente</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <form role="form" action="nuevocliente.php" method="POST" class="registration-form">
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Identificación (cédula)</label>
                            <input type="number" class="form-control" placeholder="Identificación" name="identificacion" id="identificacion" step="1" min="100000000" max="900000000">
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Nombre</label>
                            <input type="text" class="form-control" placeholder="Nombre" name="nombre" id="nombre" maxlength="100" required data-validation-required-message="Por favor ingrese el nombre">
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Apellidos</label>
                            <input type="text" class="form-control" placeholder="Apellidos" name="apellidos" id="apellidos" maxlength="100" required data-validation-required-message="Por favor ingrese los apellidos">
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Número de teléfono</label>
                            <input type="number" class="form-control" placeholder="Número de teléfono" name="telefono" id="telefono" step="1" min="20000000" max="89999999">
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Correo electrónico</label>
                            <input type="text" class="form-control" placeholder="Correo" name="correo" id="correo" maxlength="100" required data-validation-required-message="Por favor ingrese el correo">
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Ruta</label>
                            <select name="idRuta" id="idRuta" class="form-control">
                                <option>Seleccione una ruta...</option>
                            </select>
                            <script>
                                popular("idRuta", arrayRutas, "idRuta", "zona");
                            </script>
                        </div>
                    </div>
                    <hr>
                    <input name="submit" type="submit" class="btn btn-primary" value = "Agregar cliente">
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
