<?php
    /* Ferreteria online - Bases de Datos II
     * ferreterias.php - Ver las ferreterías más cercanas
     * Creado: 27/11/16 Gabriela Garro
     */
    include("session.php");
    $arrayFerreterias = getFerreterias();
    
?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Nuestra ferreterías</title>

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
        arrayFerreteriasTabla = [];
        function radians(degrees) {
            var TAU = 2 * Math.PI;
            return degrees * TAU / 360;
        }
        var latitudUsuario = 0;
        var longitudUsuario = 0;
        // Note: This example requires that you consent to location sharing when
        // prompted by your browser. If you see the error "The Geolocation service
        // failed.", it means you probably did not give permission for the browser to
        // locate you.
        function initMap() {
            var map = new google.maps.Map(document.getElementById('map'), {
                //Ubicación por defecto, es B3
                center: {lat: 9.856351, lng: -83.9130812},
                zoom: 12
            });
            var ubicacionInfoWindow = new google.maps.InfoWindow({map: map});

            // Try HTML5 geolocation.
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function(position) {
                    var pos = {
                        lat: position.coords.latitude,
                        lng: position.coords.longitude
                    };
                    //Guardar valores de la ubicación actual del usuario
                    latitudUsuario = position.coords.latitude;
                    longitudUsuario = position.coords.longitude;
                    //Poner una ventanita marcando la ubicación del usuario
                    ubicacionInfoWindow.setPosition(pos);
                    ubicacionInfoWindow.setContent('Su ubicación.');
                    map.setCenter(pos);
                    var infowindow = new google.maps.InfoWindow();
                    var marker;
                    //Iterar sobre el array de Ferreterías para crear los valores de la DataTable
                    // y para crear markers para todas las ferreterías
                    for (var i = 0; i < arrayFerreterias.length; i++) {
                        //Calcular distancia
                        distancia = 6371 * Math.acos( Math.cos( radians(latitudUsuario) ) 
                                * Math.cos( radians( arrayFerreterias[i]["latitud"] ) ) 
                                * Math.cos( radians( arrayFerreterias[i]["longitud"] ) 
                                - radians(longitudUsuario) )
                                + Math.sin( radians(latitudUsuario) ) 
                                * Math.sin( radians( arrayFerreterias[i]["latitud"] ) ) );
                        //Crear row en DataTable
                        arrayFerreteriasTabla[i] = [
                            arrayFerreterias[i]["nombreFerreteria"],
                            arrayFerreterias[i]["telefonoFerreteria"],
                            arrayFerreterias[i]["direccion"],
                            Math.round(distancia * 100) / 100
                        ];
                        //Crear marker
                        marker = new google.maps.Marker({
                            position: new google.maps.LatLng(arrayFerreterias[i]["latitud"], 
                                arrayFerreterias[i]["longitud"]),
                            map: map
                        });
                        //Hacer un listener para decir el nombre de la ferretería
                        google.maps.event.addListener(marker, 'click', (function(marker, i) {
                            return function() {
                              infowindow.setContent("<b>" + arrayFerreterias[i]["nombreFerreteria"] +
                                "</b><br>Teléfono: " + arrayFerreterias[i]["telefonoFerreteria"] );
                              infowindow.open(map, marker);
                            }
                          })(marker, i));
                    }
                    //Setear la Data Table
                    $(document).ready(function() {
                        $('#ferreterias').DataTable( {
                            data: arrayFerreteriasTabla,
                            columns: [
                                {title: "Nombre"},
                                {title: "Número de teléfono"},
                                {title: "Dirección"},
                                {title: "Distancia desde usuario (km)"}
                            ],
                            "order": [[ 3, "asc" ]]
                        } );
                    } );
                }, 
                function() {
                    handleLocationError(true, infoWindow, map.getCenter());
                });
            } 
            else {
              // Browser doesn't support Geolocation
              handleLocationError(false, infoWindow, map.getCenter());
            }
        }

        function handleLocationError(browserHasGeolocation, infoWindow, pos) {
            infoWindow.setPosition(pos);
            infoWindow.setContent(browserHasGeolocation ?
                                  'Error: The Geolocation service failed.' :
                                  'Error: Your browser doesn\'t support geolocation.');
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
                <h1 class="page-header">Ferreterías más cercanas</h1>
                <div id="map" class="map"></div>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <br/>
        <div class="panel panel-default">
            <div class="panel-body">
                <table id="ferreterias" 
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

    <!-- Google Maps API -->
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBJBUJXyF8XdzwaNzv2wH1TSQ6-SI5GfH0&callback=initMap">
    </script>

    <!-- DataTables JavaScript -->
    <script src="js/datatables/js/jquery.dataTables.min.js"></script>
    <script src="js/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="js/datatables-responsive/dataTables.responsive.js"></script>

</body>

</html>
