import 'dart:async';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class MyDatabase {
  static final MyDatabase instance = MyDatabase._init();

  Database? _database;

  MyDatabase._init() {
    _initDB('my_database.db').then((db) {
      _database = db;
      _createDB(_database!, 1);
    });
  }

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('my_database.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS ordenesTrabajo (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        fechaInicio TEXT NOT NULL,
        fechaFin TEXT,
        tipo TEXT,
        observaciones TEXT,
        trabajoARealizar TEXT,
        codigoOrdenCliente TEXT NOT NULL,
        instalacion TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS partesTrabajo (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        ordenTrabajoId INTEGER NOT NULL,
        fechaInicio TEXT NOT NULL,
        fechaFin TEXT NOT NULL,
        observaciones TEXT NOT NULL,
        trabajoRealizado TEXT NOT NULL,
        identificadorDispositivo TEXT NOT NULL,
        coordenadas TEXT,
        FOREIGN KEY (ordenTrabajoId) REFERENCES ordenesTrabajo(id)
      )
      ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS personas (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        descripcion TEXT NOT NULL
      )
      ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS maquinas (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        descripcion TEXT NOT NULL
      )
      ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS materiales (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        descripcion TEXT NOT NULL
      )
      ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS subcontratas (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        descripcion TEXT NOT NULL
      )
      ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS ordenesPersonas (
        ordenTrabajoId INTEGER NOT NULL,
        personaId INTEGER NOT NULL,
        horas DOUBLE NOT NULL,
        FOREIGN KEY (ordenTrabajoId) REFERENCES ordenesTrabajo(id),
        FOREIGN KEY (personaId) REFERENCES personas(id)
      )
      ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS partesPersonas (
        parteTrabajoId INTEGER NOT NULL,
        personaId INTEGER NOT NULL,
        horas DOUBLE NOT NULL,
        FOREIGN KEY (parteTrabajoId) REFERENCES partesTrabajo(id),
        FOREIGN KEY (personaId) REFERENCES personas(id)
      )
      ''');
  }

  Future<void> clearDatabase() async {
    final db = await instance.database;

    // Borrar los datos de todas las tablas
    await db.delete('ordenesTrabajo');
    await db.delete('partesTrabajo');
    await db.delete('personas');
    await db.delete('maquinas');
    await db.delete('materiales');
    await db.delete('subcontratas');

    // Reiniciar el valor del autoincrement de todas las tablas
    await db
        .execute('DELETE FROM sqlite_sequence WHERE name="ordenesTrabajo";');
    await db.execute('DELETE FROM sqlite_sequence WHERE name="partesTrabajo";');
    await db.execute('DELETE FROM sqlite_sequence WHERE name="personas";');
    await db.execute('DELETE FROM sqlite_sequence WHERE name="maquinas";');
    await db.execute('DELETE FROM sqlite_sequence WHERE name="materiales";');
    await db.execute('DELETE FROM sqlite_sequence WHERE name="subcontratas";');
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
