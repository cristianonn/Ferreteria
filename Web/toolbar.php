<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            
            <a class="navbar-brand" href="#"><img src="img/icono40x40.png" class="img-responsive"></a>
            <a class="navbar-brand" href="#page-top"> FerreteríaOnline</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li>
                    <a href="#"></a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                
                <li><a href="buscarProductos.php"><i class="fa fa-search" aria-hidden="true"></i> Buscar productos </a></li>
                <li><a href="#"><i class="fa fa-comments" aria-hidden="true"></i> Chat</a></li>
                <li><a href="#"><i class="fa fa-shopping-cart" aria-hidden="true"></i> Carrito:
                <?php
                    if (isset($_SESSION['userID'])) {
                        $_SESSION['cantidadCarrito'] = getCantidadCarrito();
                        echo " " . $_SESSION['cantidadCarrito'];
                    }
                    else {
                        echo " 0";
                    }
                ?> 
                <li><a href="#"><i class="fa fa-list-alt" aria-hidden="true"></i> Back order
                <?php
                    if (isset($_SESSION['userID'])) {
                        $_SESSION['cantidadBackOrder'] = getCantidadBackOrder();
                        echo " " . $_SESSION['cantidadBackOrder'];
                    }
                    else {
                        echo " 0";
                    }
                ?>
                </a></li>                    
                <?php 
                    if (isset($_SESSION['nombreCliente'])) {
                        echo "<li class=\"dropdown\">
                                <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">
                                    <i class=\"fa fa-user fa-fw\"></i> " . $_SESSION['nombreCliente'] . 
                                    " <i class=\"fa fa-caret-down\"></i>
                                </a>
                                <ul class=\"dropdown-menu dropdown-user\">
                                    <li><a href=\"#\"><i class=\"fa fa-user fa-fw\"></i> Perfil</a>
                                    </li>
                                    <li><a href=\"#\"><i class=\"fa fa-gear fa-fw\"></i> Configuración</a>
                                    </li>
                                    <li class=\"divider\"></li>
                                    <li><a href=\"logout.php\"><i class=\"fa fa-sign-out fa-fw\"></i> Cerrar sesión</a>
                                    </li>
                                </ul>
                                <!-- /.dropdown-user -->
                            </li>
                            <!-- /.dropdown -->";
                    }
                    else {
                        echo "<li><a href=\"#\" data-toggle=\"modal\" data-target=\"#login\">
                        <i class=\"fa fa-user\" aria-hidden=\"true\"></i> Iniciar sesión</a></li>";
                    }
                ?>
                
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>