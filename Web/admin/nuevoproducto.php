<?php
    /* Ferreteria - Bases de Datos II
     * nuevoproducto.php - Agregar un nuevo producto
     * Creado: 26/11/16 Gabriela Garro
     */
    include("session.php");
    $arrayDepartamentos = getDepartamentos();
    $arrayMarcas = getMarcas();
    //Chequear si se envió el form
    if (isset($_POST['submit'])) {
        unset($_POST['submit']);
        $nombre = $_POST['nombre'];
        $precio = $_POST['precio'];
        $descripcion = $_POST['descripcion'];
        $aspectostecnicos =$_POST['aspectostecnicos'];
        $utilidad = $_POST['utilidad'];
        $garantia = $_POST['garantia'];
        $idDepartamento = $_POST['idDepartamento'];
        $idMarca = $_POST['idMarca'];
        $carpeta = "../../BD/Images/";
        $arrayImagen = $_FILES['imagen'];
        agregarProducto($nombre, $precio, $descripcion, $aspectostecnicos, $utilidad,
            $garantia, $idDepartamento, $idMarca, $carpeta, $arrayImagen);
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

    <title>Agregar nuevo producto</title>

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
        arrayDepartamentos = <?php echo json_encode($arrayDepartamentos); ?>;
        arrayMarcas = <?php echo json_encode($arrayMarcas); ?>;
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
                    <h1 class="page-header">Agregar nuevo producto</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <form role="form" action="nuevoproducto.php" method="POST" class="registration-form" enctype="multipart/form-data">
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Nombre de producto</label>
                            <input type="text" class="form-control" placeholder="Nombre de producto..." name="nombre" id="nombre" maxlength="100">
                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Imagen</label>
                            <input type="file" name="imagen" id="imagen" accept="image/*" class="form-control"/>
                        </div>
                    </div>
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Precio</label>
                            <input type="number" class="form-control" placeholder="Precio..." name="precio" id="precio" step="0.01">
                        </div>
                    </div>
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Descripción</label>
                            <textarea class="form-control" placeholder="Descripción..." name="descripcion" id="descripcion" maxlength="200" rows="4"></textarea>
                        </div>
                    </div>
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Aspectos técnicos</label>
                            <textarea class="form-control" placeholder="Aspectos técnicos..." name="aspectostecnicos" id="aspectostecnicos" maxlength="100" rows="2"></textarea>
                        </div>
                    </div>
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Utilidad</label>
                            <textarea class="form-control" placeholder="Utilidad..." name="utilidad" id="utilidad" maxlength="100" rows="2"></textarea>
                        </div>
                    </div>
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Garantía (días)</label>
                            <input type="number" class="form-control" placeholder="Garantía..." name="garantia" id="garantia" step="1" min="0">
                        </div>
                    </div>
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Departamento</label>
                            <select name="idDepartamento" id="idDepartamento" class="form-control">
                                <option>Seleccione un departamento...</option>
                            </select>
                            <script>
                                popular("idDepartamento", arrayDepartamentos, 0, 1);
                            </script>
                        </div>
                    </div>
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Marca</label>
                            <select name="idMarca" id="idMarca" class="form-control">
                                <option>Seleccione una marca...</option>
                            </select>
                            <script>
                                popular("idMarca", arrayMarcas, 0, 1);
                            </script>
                        </div>
                    </div>
                    <hr>
                    <input name="submit" type="submit" class="btn btn-primary" value = "Agregar producto">
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
