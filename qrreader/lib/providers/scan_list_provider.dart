import 'package:flutter/material.dart';
import 'package:qrreader/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  //Esta clase tiene el objetivo de centralizar la informacion de los Scans.

  List<ScanModel> scans = [];
//identificar la opcion seleccionado.
  String typeSelection = 'http';

  newScan(String value) async {
    final newScan = new ScanModel(valor: value);
    final id = await DBProvider.db
        .newScans(newScan); //inserta el modelo en l;a base de datos.
    newScan.id = id; //Asigna el ID de la base de datos al modelo.
    if (this.typeSelection == newScan.tipo) {
      this.scans.add(newScan);
      notifyListeners(); //Notifica el cambio.
    }
  }

  loadScans() async {
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...scans!]; //Reemplaza todos los valores del arreglo
    notifyListeners();
  }

  loadScansForType(String type) async {
    final scans = await DBProvider.db.getScansForType(type);
    this.scans = [...scans!]; //Reemplaza todos los valores del arreglo
    this.typeSelection = type;
    notifyListeners();
  }

  deleteAll() async {
    await DBProvider.db.deleteAllScan();
    this.scans = [];
    notifyListeners();
  }

  deleteForId(int id) async {
    await DBProvider.db.deleteScan(id);
    loadScansForType(this.typeSelection);
  }
}
