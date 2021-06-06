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
    final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    );

    final ScanModel scan = ModalRoute.of(context)!.settings.arguments
        as ScanModel; //Recupera el valor enviado por el PushName. SE DEBE CASTERA PARA EVITA UN ERROR.

    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
