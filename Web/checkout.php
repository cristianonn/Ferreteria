<?php
    /* Ferreteria online - Bases de Datos II
     * checkout.php - Facturación
     * Creado: 29/11/16 Gabriela Garro
     */
    include("session.php");
    $arrayProductos = [];
    $total = 0;
    //Si recibió la info de facturación
    if (isset($_POST["submit"])) {
        $idPedido = 0;
        //Iterar por los POST
        for ($i = 0; isset($_POST["producto" . $i]); $i++) {
            $idProducto = $_POST["producto" . $i];
            $cantidad = $_POST["cantidad" . $i];
            if ($cantidad == 0 && $cantidad != "") {
                eliminarDeCarrito($idProducto);
            }
            elseif ($cantidad > 0) {
                eliminarDeCarrito($idProducto);
                if ($idPedido == 0) { // El pedido no ha sido hecho
                    $idEmpleado = $_POST['idEmpleado'];
                    $idPedido = hacerPedido($idEmpleado);
                }
                agregarAPedido($idProducto, $idPedido, $cantidad);
            }
        }
        //Hacer la facturación
        $arrayProductos = getProductosDePedido($idPedido);
        $total = getTotalPedido($idPedido);
    }
    //Truco para ver otras facturas
    elseif (isset($_GET['idPedido'])) {
        $idPedido = $_GET['idPedido'];
        $arrayProductos = getProductosDePedido($idPedido);
        $total = getTotalPedido($idPedido);
    }
    else {
        echo "No hay información de compra.";
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

    <title>Checkout</title>

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
        arrayProductos = <?php echo json_encode($arrayProductos); ?>;
        function popularTabla() {
            var table = document.getElementById("tablaProductos").getElementsByTagName('tbody')[0];
            for (var i = 0; i < arrayProductos.length; i++) {
                var row = table.insertRow(i);
                var nombre = row.insertCell(0);
                nombre.innerHTML = arrayProductos[i]["nombreProducto"];
                var ferreteria = row.insertCell(1);
                ferreteria.innerHTML = arrayProductos[i]["nombreFerreteria"];
                var cantidad = row.insertCell(2);
                cantidad.innerHTML = arrayProductos[i]["cantidad"];
                var precio = row.insertCell(3);
                precio.innerHTML = arrayProductos[i]["precio"];
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
                <h2>Facturación</h1><br>
                <div class="col-lg-12">
                    <table class="table" class="table table-hover table-striped" id="tablaProductos">
                        <thead>
                            <tr >
                                <th>Producto</th>
                                <th>Ferretería</th>
                                <th>Cantidad</th>
                                <th>Precio</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                        </tbody>
                    </table>
                    <script>
                        popularTabla();
                    </script>
                    <div class="pull-right">
                        <h3>Total: ₡<?php echo $total;?></h3>
                    </div>
                </div>
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

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
