<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="index.php">Administración de Ferreterías</a>
    </div>
    <!-- /.navbar-header -->

    <ul class="nav navbar-top-links navbar-right">
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="fa fa-user fa-fw"></i><?php echo " " . $_SESSION['nombreEmpleado']; ?> <i class="fa fa-caret-down"></i>

            </a>
            <ul class="dropdown-menu dropdown-user">
                <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                </li>
                <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                </li>
                <li class="divider"></li>
                <li><a href="logout.php"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                </li>
            </ul>
            <!-- /.dropdown-user -->
        </li>
        <!-- /.dropdown -->
    </ul>
    <!-- /.navbar-top-links -->

    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
                <li class="sidebar-search">
                    <div class="input-group custom-search-form">
                        <input type="text" class="form-control" placeholder="Search...">
                        <span class="input-group-btn">
                        <button class="btn btn-default" type="button">
                            <i class="fa fa-search"></i>
                        </button>
                    </span>
                    </div>
                    <!-- /input-group -->
                </li>
                <li>
                    <a href="index.php"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                </li>
                <li>
                    <a href="tables.html"><i class="fa fa-building" aria-hidden="true"></i></i> Ferreterías</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-users" aria-hidden="true"></i></i> Empleado<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="nuevoempleado.php">Nuevo empleado</a>
                        </li>
                        <li>
                            <a href="empleados.php">Planilla de empleados</a>
                        </li>
                        <li>
                            <a href="tipoEmpleados.php">Tipos de empleado</a>
                        </li>
                        <li>
                            <a href="#">Vacaciones</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-archive" aria-hidden="true"></i></i> Producto<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="nuevoproducto.php">Nuevo producto</a>
                        </li>
                        <li>
                            <a href="productos.php">Catálogo de productos</a>
                        </li>
                        <li>
                            <a href="inventario.php">Inventario</a>
                        </li>
                        <li>
                            <a href="#">Marcas de productos</a>
                        </li>
                        <li>
                            <a href="#">Departamentos</a>
                        </li>
                        <li>
                            <a href="#">Pasillos</a>
                        </li>
                        <li>
                            <a href="#">Estantes</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-users" aria-hidden="true"></i></i> Cliente<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="nuevocliente.php">Nuevo cliente</a>
                        </li>
                        <li>
                            <a href="clientes.php">Ver clientes</a>
                        </li>
                    </ul>
                </li>
                
            </ul>
        </div>
        <!-- /.sidebar-collapse -->
    </div>
    <!-- /.navbar-static-side -->
</nav>