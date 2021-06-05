//Se creara un singleton para que siempre se tome la misma instnacia.abstract
import 'dart:io';

import 'package:path_provider/path_provider.dart';
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
}
