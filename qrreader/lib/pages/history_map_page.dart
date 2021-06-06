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

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context)!.settings.arguments
        as ScanModel; //Recupera el valor enviado por el PushName. SE DEBE CASTERA PARA EVITA UN ERROR.

    final CameraPosition _kGooglePlex = CameraPosition(
        target: scan.getLatLng(), //Obtiene latitud y longitud
        zoom: 17.5,
        tilt: 50 //Inclinacion de la camara
        );

    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
