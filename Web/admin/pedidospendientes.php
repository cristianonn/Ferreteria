<?php
    /* Ferreteria - Bases de Datos II
     * pedidospendientes.php - Ver la ruta para entregar los pedidos pendientes
     * Creado: 30/11/16 Gabriela Garro
     */
    include("session.php");  
    $arrayRutas = getRutas();
    $arrayPedidos = getPedidosPorRutaPendientes();
?>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Ruta de pedidos pendientes</title>

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

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>
        arrayRutas = <?php echo json_encode($arrayRutas); ?>;
        arrayPedidos = <?php echo json_encode($arrayPedidos); ?>;
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

        function rutaOnChange() {
            idRuta = document.getElementById("idRuta").value;
            arrayPedidosXRuta = arrayPedidos[idRuta];
            if (typeof tabla === 'undefined') {
                tabla = $('#pedidos').DataTable( {
                    data: arrayPedidosXRuta,
                    columns: [
                        {title: "Id."},
                        {title: "Nombre de Cliente"},
                        {title: "Latitud"},
                        {title: "Longitud"},
                        {title: "Estado"},
                        {title: "Fecha"},
                        {title: "Total (₡)"}
                    ]
                } );
            }
            else { 
                idRuta = document.getElementById("idRuta").value;
                arrayPedidosXRuta = arrayPedidos[idRuta];
                tabla.clear().draw();
                if (arrayPedidosXRuta.length != 0) {
                    tabla.rows.add(arrayPedidosXRuta).draw();
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
            var ubicacionInfoWindow = new google.maps.InfoWindow({map: map});

            directionsDisplay.setMap(map);

            document.getElementById('idRuta').addEventListener('click', function() {
                calculateAndDisplayRoute(directionsService, directionsDisplay);
                });

            // Try HTML5 geolocation.
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function(position) {
                    var pos = {
                        lat: position.coords.latitude,
                        lng: position.coords.longitude
                    };
                    //Poner una ventanita marcando la ubicación del usuario
                    ubicacionInfoWindow.setPosition(pos);
                    ubicacionInfoWindow.setContent('Su ubicación');
                    map.setCenter(pos);
                });
            }
        }

        function calculateAndDisplayRoute(directionsService, directionsDisplay) {
            var waypts = [];
            var idRuta = document.getElementById('idRuta').value;
            arrayPedidosXRuta = arrayPedidos[idRuta];
            for (var i = 0; i < arrayPedidosXRuta.length; i++) {
                waypts.push({
                    location: {lat: parseFloat(arrayPedidosXRuta[i][2]),
                        lng: parseFloat(arrayPedidosXRuta[i][3])},
                    stopover: true
                });
            }

            directionsService.route({
                origin: { lat: 9.86629, lng: -83.9223},
                destination: { lat: 9.86629, lng: -83.9223},
                waypoints: waypts,
                optimizeWaypoints: true,
                travelMode: google.maps.TravelMode.DRIVING
                }, function(response, status) {
                if (status === google.maps.DirectionsStatus.OK) {
                    directionsDisplay.setDirections(response);
                    var route = response.routes[0];
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
                    <h1 class="page-header">Pedidos pendientes</h1>
                    <div id="map" class="map-page"></div>
                    <br>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <select name="idRuta" id="idRuta" class="form-control" onchange="rutaOnChange();">
                    <option>Seleccione una ruta...</option>
                </select>
                <script>
                    popular("idRuta", arrayRutas, "idRuta", "zona");
                </script>
                <br/>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <table id="pedidos" 
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

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Google Maps API -->
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBJBUJXyF8XdzwaNzv2wH1TSQ6-SI5GfH0&callback=initMap">
    </script>

    <!-- DataTables JavaScript -->
    <script src="../vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="../vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="../vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>
