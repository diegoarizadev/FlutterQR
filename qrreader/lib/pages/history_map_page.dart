import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qrreader/providers/db_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HistoryMapPage extends StatefulWidget {
  @override
  _HistoryMapPageState createState() => _HistoryMapPageState();
}

class _HistoryMapPageState extends State<HistoryMapPage> {
  Completer<GoogleMapController> _controller =
      Completer(); //Parecido a un future

  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context)!.settings.arguments
        as ScanModel; //Recupera el valor enviado por el PushName. SE DEBE CASTERA PARA EVITA UN ERROR.

    final CameraPosition _kGooglePlex = CameraPosition(
        target: scan.getLatLng(), //Obtiene latitud y longitud
        zoom: 17.5,
        tilt: 50 //Inclinacion de la camara
        );

    //Marcadores

    Set<Marker> markers = new Set<Marker>();
    markers.add(
      new Marker(
        markerId: MarkerId('geo-location'),
        position: scan.getLatLng(),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
        actions: [
          IconButton(
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(
                      target: scan.getLatLng(),
                      zoom: 17.5,
                      tilt: 50 //Inclinacion de la camara
                      )));
            },
            icon: Icon(Icons.share_location_sharp),
          ),
        ],
      ),
      body: GoogleMap(
        mapType: mapType,
        markers: markers, //Marcador en el mapa
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.layers),
        onPressed: () {
          if (mapType == MapType.normal) {
            mapType = MapType.satellite;
          } else {
            mapType = MapType.normal;
          }
          setState(() {}); // Para redibujar el widget
        },
      ),
    );
  }
}
