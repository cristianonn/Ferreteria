<?php
    /* Ferreteria online - Bases de Datos II
     * buscarproductos.php - Buscar los productos que tiene cada ferretería
     * Creado: 21/11/16 Gabriela Garro
     */
    include("session.php");
    $arrayFerreterias = getFerreterias();
    $arrayProductos = getProductosPorFerreteria();
    
?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Ferretería Online</title>

    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="icon" href="img/favicon.ico" type="image/x-icon">

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/shop-homepage.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="js/datatables/css/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="css/dataTables.responsive.css" rel="stylesheet">

    <!-- Font Awesome -->
    <script src="https://use.fontawesome.com/554db7ace5.js"></script>

    <!-- Custom Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

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
        arrayFerreterias = <?php echo json_encode($arrayFerreterias); ?>;
        arrayProductos = <?php echo json_encode($arrayProductos); ?>;
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

        function ferreteriaOnChange() {
            /*if (typeof tabla != 'undefined') {
                tabla.fnClearTable();
            }*/
            idFerreteria = document.getElementById("idFerreteria").value;
            arrayProductosXFerreteria = arrayProductos[idFerreteria];
            if (typeof tabla === 'undefined') {
                tabla = $('#productos').DataTable( {
                    data: arrayProductosXFerreteria,
                    columns: [
                        {title: "Nombre"},
                        {title: "Precio"},
                        {title: "Descripción"},
                        {title: "Marca"},
                        {title: "Departamento"},
                        {title: "Cantidad"}
                    ]
                } );
            }
            else { 
                idFerreteria = document.getElementById("idFerreteria").value;
                arrayProductosXFerreteria = arrayProductos[idFerreteria];
                tabla.clear().draw();
                if (arrayProductosXFerreteria.length != 0) {
                    tabla.rows.add(arrayProductosXFerreteria).draw();
                }
            }
        }
    </script>

</head>

<body>

    <?php //Para que sea el mismo toolbar en todas las páginas
        include("toolbar.php");
    ?>

    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Búsqueda de productos por ferretería</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <label>Ferretería</label>
        <select name="idFerreteria" id="idFerreteria" class="form-control" onchange="ferreteriaOnChange()">
            <option>Seleccione una ferretería...</option>
        </select>
        <script>
            popular("idFerreteria", arrayFerreterias, "idFerreteria", "nombreFerreteria");
        </script>
        <br/>
        <div class="panel panel-default">
            <div class="panel-body">
                <table id="productos" 
                class="table table-striped table-bordered table-hover" 
                width="100%"></table>
            </div>
        </div>

    </div>
    <!-- /.container -->

    <div class="container">

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-md-6">
                    <a href="#">Enlaces de abajo</a>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Ferretería Online 2014</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-top page-scroll hidden-sm hidden-xs hidden-lg hidden-md">
        <a class="btn btn-primary" href="#page-top">
            <i class="fa fa-chevron-up"></i>
        </a>
    </div>

    <div class="portfolio-modal modal fade" id="login" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="vertical-alignment-helper">
            <div class="modal-dialog vertical-align-center">
                <div class="modal-content">
                    <div class="close-modal" data-dismiss="modal">
                        <div class="lr">
                            <div class="rl">
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8 col-lg-offset-2">
                                <div class="modal-body">
                                    <h2>Iniciar sesión</h2>
                                    <form role="form" action="login.php" method="POST" class="registration-form">
                                        <div class="row control-group">
                                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                                <label>Usuario</label>
                                                <input type="text" class="form-control" placeholder="Usuario" name="usuario" id="usuario" required data-validation-required-message="Por favor ingrese su usuario.">
                                                <p class="help-block text-danger"></p>
                                            </div>
                                        </div>
                                        <div class="row control-group">
                                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                                <label>Password</label>
                                                <input type="password" class="form-control" placeholder="Contraseña" name="contrasena" id="contrasena" required data-validation-required-message="Por favor ingrese su contraseña.">
                                                <p class="help-block text-danger"></p>
                                            </div>
                                        </div>
                                        <div class="modal-footer text-center">
                                            <div class = "container">
                                                <div class="text-center">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Cerrar</button>
                                                    <input name = "submit" type = "submit" class="btn btn-primary" value = "Iniciar sesión">
                                                </div>  
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="js/datatables/js/jquery.dataTables.min.js"></script>
    <script src="js/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="js/datatables-responsive/dataTables.responsive.js"></script>

</body>

</html>
