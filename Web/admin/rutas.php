<?php
    /* Ferreteria - Bases de Datos II
     * rutas.php - Ver rutas
     * Creado: 29/11/16 Gabriela Garro
     */
    include("session.php");
    $arrayRutas = getTablaRutas();
    $arrayRutasClientes = getRutasClientes();
    
?>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Rutas</title>

    <link rel="shortcut icon" href="../img/favicon.ico" type="image/x-icon">
    <link rel="icon" href="../img/favicon.ico" type="image/x-icon">

    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="../vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="../vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Font Awesome -->
    <script src="https://use.fontawesome.com/554db7ace5.js"></script>

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
        arrayRutas = <?php echo json_encode($arrayRutas); ?>;
        arrayRutasClientes = <?php echo json_encode($arrayRutasClientes); ?>;
        $(document).ready(function() {
            $('#rutas').DataTable( {
                data: arrayRutas,
                columns: [
                    {title: "Id."},
                    {title: "Zona de la ruta"},
                    {title: "Mapa"}
                ]
            } );
        } );

        function cambiarRuta(idRuta) {
            arrayClientes = arrayRutasClientes[idRuta];
            //Cambiar mapa
            //Cambiar datos en el mapa
            calculateAndDisplayRoute(idRuta);
            //Cambiar datos de la tabla
            if (typeof tabla === 'undefined') {
                tabla = $('#clientes').DataTable( {
                    data: arrayClientes,
                    columns: [
                        {title: "Id."},
                        {title: "Nombre"},
                        {title: "Latitud"},
                        {title: "Longitud"}
                    ]
                } );
            }
            else { 
                arrayClientes = arrayRutasClientes[idRuta];
                tabla.clear().draw();
                if (arrayClientes.length != 0) {
                    tabla.rows.add(arrayClientes).draw();
                }
            }
        }

        function initMap() {
            var directionsService = new google.maps.DirectionsService;
            var directionsDisplay = new google.maps.DirectionsRenderer;
            var map = new google.maps.Map(document.getElementById('map'), {
                //Ubicación por defecto, es B3
                center: {lat: 9.856351, lng: -83.9130812},
                zoom: 12
            });
            //Mostrar dentro del modal
            $("#ruta").on("shown.bs.modal", function () {
                google.maps.event.trigger(map, "resize");
            });
            directionsDisplay.setMap(map);
        }

        function calculateAndDisplayRoute(idRuta) {
            //Obtener los servicios de direcciones
            var directionsService = new google.maps.DirectionsService;
            var directionsDisplay = new google.maps.DirectionsRenderer;
            //Paradas
            var waypts = [];
            var arrayClientes = arrayRutasClientes[idRuta];
            for (var i = 0; i < arrayClientes.length; i++) {
                waypts.push({
                    location: { lat: parseFloat(arrayClientes[i][2]),
                                lng: parseFloat(arrayClientes[i][3]) },
                    stopover: true
                });
            }

            directionsService.route({
                origin: { lat: 9.86629,
                          lng: -83.9223},
                destination: { lat: 9.86629,
                               lng: -83.922},
                waypoints: waypts,
                optimizeWaypoints: true,
                travelMode: google.maps.TravelMode.DRIVING
            }, function(response, status) {
                if (status === google.maps.DirectionsStatus.OK) {
                  directionsDisplay.setDirections(response);
                  var route = response.routes[0];
                  /*var summaryPanel = document.getElementById('directions-panel');
                  summaryPanel.innerHTML = '';
                  // For each route, display summary information.
                  for (var i = 0; i < route.legs.length; i++) {
                    var routeSegment = i + 1;
                    summaryPanel.innerHTML += '<b>Route Segment: ' + routeSegment +
                        '</b><br>';
                    summaryPanel.innerHTML += route.legs[i].start_address + ' to ';
                    summaryPanel.innerHTML += route.legs[i].end_address + '<br>';
                    summaryPanel.innerHTML += route.legs[i].distance.text + '<br><br>';
                  }*/
                } else {
                  window.alert('Directions request failed due to ' + status);
                }
              });
        }
    </script>

</head>

<body>

    <div id="wrapper">

    <?php include("toolbar.php"); ?>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Rutas</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <table id="rutas" 
                        class="table table-striped table-bordered table-hover" 
                        width="100%"></table>
                    </div>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <div id="ruta" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Mapa de la ruta</h4>
                </div>
                <div class="modal-body">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div id="map" class="map"></div>
                            </div>
                            <!-- /.col-lg-12 -->
                        </div>
                        <br/>
                        <table id="clientes" 
                        class="table table-striped table-bordered table-hover"
                        max-width="550px"></table> 
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>
            </div>

        </div>
    </div>

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Google Maps API -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBJBUJXyF8XdzwaNzv2wH1TSQ6-SI5GfH0&signed_in=true&callback=initMap"
        async defer></script>

    <!-- DataTables JavaScript -->
    <script src="../vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="../vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="../vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>
