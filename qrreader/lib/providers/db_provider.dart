//Se creara un singleton para que siempre se tome la misma instnacia.abstract
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:qrreader/models/scan_model.dart';
export 'package:qrreader/models/scan_model.dart'; //En todo lugar se va a tener un newScan listo.
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  static Database? _database; //Base de datos
  static final DBProvider db =
      DBProvider._(); //._() constructor privado; Instancia de la base de datos.

  DBProvider._(); //constructor.

  Future<Database?> get database async {
    //La base de datos no es asincrona.

    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  Future<Database> initDB() async {
//Path de donde se encuentra la base de datos.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    //creacion de la base de datos.
    final path = join(documentsDirectory.path,
        'ScansDB.db'); //Construye la url del path de la bd
    print(path);

    //Crear la BD
    return await openDatabase(
      path,
      version:
          1, //Versión de la base de datos, se debe aumentar la version en cada cambio.
      onOpen: (db) {}, //ejecutar algo.!
      onCreate: (Database db, int version) async {
        //Query para la creacion de la tabla.
        await db.execute('''
        CREATE TABLE Scans(
          id INTEGER PRIMARY KEY,
          tipo TEXT,
          valor TEXT
        )
        ''');
      },
    );
  }

  newScanRawSQL(ScanModel newScan) async {
    final id = newScan.id;
    final tipo = newScan.id;
    final valor = newScan.id;

    //Referencia a la BD
    final db = await database; //Verifica la base de datos

    final res = await db!.rawInsert('''
    IINSERT INTO Scans (id, tipo, valor) VALUES ($id, '$tipo', '$valor')
    ''');

    return res;
  }

  Future<int> newScan(ScanModel newScan) async {
    //Referencia a la BD
    final db = await database; //Verifica la base de datos
    final res = await db!.insert(
        'Scans',
        newScan
            .toJson()); //toma la instancia de la clase ScanModel, la cual tiene el MAP que esta construiod en la clase.
    return res;
  }
}
