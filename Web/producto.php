<?php
    /* Ferreteria online - Bases de Datos II
     * producto.php - Página para ver un producto de cerca
     * Creado: 21/11/16 Gabriela Garro
     */
    include("session.php");
    $carpetaImagenes = "../BD/Images/";

    //Agarrar los valores desde arriba
    if (isset($_GET['idp']) && isset($_GET['idf'])) {
        $idProducto = $_GET['idp'];
        $idFerreteria = $_GET['idf'];
        //Presetear todo en caso de que los parámetros vengan malos
        $nombreProducto = "";
        $precioProducto = "";
        $fotoProducto = "";
        $descripcionProducto = "";
        $marcaProducto = "";
        $aspectosTecnicosProducto = "";
        $utilidadProducto = "";
        $garantia = "";
        $nombreDepartamento = "";
        $cantidad = "";
        $nombreFerreteria = "";
        $cantidadCarrito = -1;
        $cantidadBackOrder = -1;
        //Obtener aquí toda la información del producto
        $arrayProducto = getProductoEnFerreteria($idProducto, $idFerreteria);
        if ($arrayProducto != null) {
            $nombreProducto = $arrayProducto['nombreProducto'];
            $precioProducto = $arrayProducto['precioProducto'];
            $fotoProducto = $carpetaImagenes . $arrayProducto['fotoProducto'];
            $descripcionProducto = $arrayProducto['descripcionProducto'];
            $marcaProducto = $arrayProducto['marcaProducto'];
            $aspectosTecnicosProducto = $arrayProducto['aspectosTecnicosProducto'];
            $utilidadProducto = $arrayProducto['utilidadProducto'];
            $garantia = $arrayProducto['garantia'];
            $nombreDepartamento = $arrayProducto['nombreDepartamento'];
            $cantidad = $arrayProducto['cantidad'];
            $nombreFerreteria = $arrayProducto['nombreFerreteria'];
            //Y si todo está bien con el producto, chequear si el usuario pidió meterlo en el carrito
            if (isset($_GET['carrito'])) {
                agregarACarrito($idProducto, $idFerreteria);
            }
            //Obtener la cantidad de veces que este producto está en el carrito
            /*if (isset($_SESSION['userID'])) {
                $cantidadCarrito = estaEnCarrito($idProducto, $idFerreteria);
            }*/
            if (isset($_SESSION['userID'])) {
                $cantidadBackOrder = estaEnBackOrder($idProducto, $idFerreteria);
            }
        }
        else {
            echo "Producto no existente";
        }
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

    <title>Producto</title>

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

</head>

<body>

    <?php //Para que sea el mismo toolbar en todas las páginas
        include("toolbar.php");
    ?>

    <!-- Page Content -->
    <div class="container">

        <div class="row">
            <div class="col-md-6">
                <div class="thumbnail">
                    <img src=<?php echo "\"" . $fotoProducto . "\""; ?>>
                </div>
            </div>
            <div class="col-md-6">
                <h1 class="page-header"><?php echo $nombreProducto; ?></h1>
                <h3><?php echo "₡" . $precioProducto;?></h3>
                <br>
                <table class="table">
                    <tbody>
                        <tr>
                            <th><b>Descripción</b></th>
                            <td><?php echo $descripcionProducto; ?></td>
                        </tr>
                        <tr>
                            <th>Marca</th>
                            <td><?php echo $marcaProducto; ?></td>
                        </tr>
                        <tr>
                            <th>Aspectos técnicos</th>
                            <td><?php echo $aspectosTecnicosProducto; ?></td>
                        </tr>
                        <tr>
                            <th>Utilidad</th>
                            <td><?php echo $utilidadProducto; ?></td>
                        </tr>
                        <tr>
                            <th>Garantía (días)</th>
                            <td><?php echo $garantia; ?></td>
                        </tr>
                        <tr>
                            <th>Departamento</th>
                            <td><?php echo $nombreDepartamento; ?></td>
                        </tr>
                        <tr>
                            <th>Cantidad en Ferretería <?php echo $nombreFerreteria;?></th>
                            <td><?php echo $cantidad; ?></td>
                        </tr>
                    </tbody>
                </table>
                <br>
                <form role="form" action="producto.php" method="GET" class="registration-form">
                <input type="hidden" name="idf" value=<?php echo "\"" . $_GET['idf'] . "\""; ?>>
                <input type="hidden" name="idp" value=<?php echo "\"" . $_GET['idp'] . "\""; ?>>
                <?php 
                    if ($cantidadCarrito != 0) {
                        echo "<button type=\"button\" class=\"btn btn-danger\" disabled=\"disabled\">Añadir a carrito</button>";
                    }
                    else {
                        echo "<input name=\"carrito\" type=\"submit\" class=\"btn btn-danger\" value = \"Añadir a carrito\">";
                    }
                    
                ?>
                <?php 
                    if ($cantidadBackOrder != 0) {
                        echo "<button type=\"button\" class=\"btn btn-danger\" disabled=\"disabled\">Añadir a Back order</button>";
                    }
                    else {
                        echo "<input name=\"carrito\" type=\"submit\" class=\"btn btn-danger\" value = \"Añadir a Back order\">";
                    }
                    
                ?>
                </form>
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

</body>

</html>
