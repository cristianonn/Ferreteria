<?php
    /* Ferreteria online - Bases de Datos II
     * carrito.php - Artículos en carrito
     * Creado: 29/11/16 Gabriela Garro
     */
    include("session.php");
    $arrayCarrito = [];
    if (isset($_SESSION['userID'])) {
        $arrayCarrito = getProductosCarrito();
    }
    else {
        echo "No se encuentra registrado.";
    }
    $arrayEmpleados = getEmpleados();
    $carpetaImagenes = "../BD/Images/";
?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Carrito</title>

    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="icon" href="img/favicon.ico" type="image/x-icon">

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/shop-homepage.css" rel="stylesheet">

    <!-- Font Awesome -->
    <script src="https://use.fontawesome.com/554db7ace5.js"></script>

    <!-- Custom Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>
        arrayCarrito = <?php echo json_encode($arrayCarrito); ?>;
        var carpetaImagenes = "../BD/Images/";
        function popularTabla() {
            var table = document.getElementById("tablaProductos").getElementsByTagName('tbody')[0];
            for (var i = 0; i < arrayCarrito.length; i++) {
                var row = table.insertRow(i);
                var foto = row.insertCell(0);
                foto.innerHTML = "<div class=\"thumbnail thumbnail200\"><img src=\"" + carpetaImagenes + arrayCarrito[i]["imagenProducto"] + "\" class=\"thumbnail100\"></div>";
                var nombre = row.insertCell(1);
                nombre.innerHTML = arrayCarrito[i]["nombreProducto"];
                var marca = row.insertCell(2);
                marca.innerHTML = arrayCarrito[i]["nombreMarca"];
                var precio = row.insertCell(3);
                precio.innerHTML = arrayCarrito[i]["precioProducto"];
                var ferreteria = row.insertCell(4);
                ferreteria.innerHTML = arrayCarrito[i]["nombreFerreteria"];
                var cantidad = row.insertCell(5);
                cantidad.innerHTML = "<input type=\"hidden\" name=\"producto" + i + "\" value=\"" +
                    arrayCarrito[i]["idInventario"] + "\">" +
                    "<input type=\"number\" class=\"form-control\" step=\"1\" max=\"" +
                    arrayCarrito[i]["disponible"] + "\" placeholder=\"Disponible = " +
                    arrayCarrito[i]["disponible"] + "\" name=\"cantidad" + i + "\">" ;
            }
        }
        arrayEmpleados = <?php echo json_encode($arrayEmpleados); ?>;
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

    <?php //Para que sea el mismo toolbar en todas las páginas
        include("toolbar.php");
    ?>

    <!-- Page Content -->
    <div class="container">

        <div class="row">

            <!-- <div class="col-md-3">
                <p class="lead">Shop Name</p>
                <div class="list-group">
                    <a href="#" class="list-group-item">Category 1</a>
                    <a href="#" class="list-group-item">Category 2</a>
                    <a href="#" class="list-group-item">Category 3</a>
                </div>
            </div> -->
            <div class="col-md-1"></div>

            <div class="col-md-10">

                <div class="row">
                <h2>Artículos en carrito</h1><br>
                <form role="form" action="checkout.php" method="POST" class="registration-form">
                    <table class="table table-hover table-striped" id="tablaProductos">
                        <thead>
                            <tr >
                                <th>Fotografía</th>
                                <th>Nombre</th>
                                <th>Marca</th>
                                <th>Precio</th>
                                <th>Ferretería</th>
                                <th>Cantidad</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                        </tbody>
                    </table>
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <hr>
                            <p>¿Recibió ayuda de algún empleado?</p>
                            <select name="idEmpleado" id="idEmpleado" class="form-control">
                                <option value="0">Seleccione un empleado...</option>
                            </select><br>
                            <script>
                                popular("idEmpleado", arrayEmpleados, "idEmpleado", "nombreEmpleado");
                            </script>
                        </div>
                    </div>
                    <div class="pull-right"><br>
                        <input name="submit" type="submit" class=
                        <?php
                            if (isset($_SESSION['userID'])) {
                                echo "\"btn btn-primary\"";
                            }
                            else {
                                echo "\"btn btn-danger\" disabled=\"disabled\"";
                            }

                        ?>
                         value = "Comprar">
                    </div>
                </form>
                <script>
                    popularTabla();
                </script>
                </div>
            </div>
            <div class="col-md-1"></div>

        </div>

    </div>
    <!-- /.container -->

    <div class="container">

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-md-6">
                    <a href="#" data-toggle="modal" data-target="#loginEmpleado">
                    <i class="fa fa-user" aria-hidden="true"></i> Iniciar sesión (empleado)</a>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Ferretería Online 2016</p>
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

    <div class="portfolio-modal modal fade" id="loginEmpleado" tabindex="-1" role="dialog" aria-hidden="true">
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
                                    <h2>Iniciar sesión (empleado)</h2>
                                    <form role="form" action="admin/login.php" method="POST" class="registration-form">
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

</body>

</html>
