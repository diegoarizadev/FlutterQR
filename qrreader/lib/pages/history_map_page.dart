import 'package:flutter/material.dart';
import 'package:qrreader/providers/db_provider.dart';

class HistoryMapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context)!.settings.arguments
        as ScanModel; //Recupera el valor enviado por el PushName. SE DEBE CASTERA PARA EVITA UN ERROR.

    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
      ),
      body: Center(
        child: Text('Historial de mapas : ${scan.valor}'),
      ),
    );
  }
}
