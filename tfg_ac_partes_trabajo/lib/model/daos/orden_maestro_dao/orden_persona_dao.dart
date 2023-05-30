import 'package:tfg_ac_partes_trabajo/model/database/my_database.dart';
import 'package:tfg_ac_partes_trabajo/model/models/orden_maestro/orden_persona.dart';

class OrdenPersonaDao {
  static final OrdenPersonaDao _instance = OrdenPersonaDao._internal();

  OrdenPersonaDao._internal();

  static OrdenPersonaDao get instance => _instance;

  final String _tableName = 'ordenesPersonas';

  Future<OrdenPersona?> get(int ordenTrabajoId, int personaId) async {
    final db = await MyDatabase.instance.database;
    final maps = await db.query(
      _tableName,
      where: 'ordenTrabajoId = ? AND personaId = ?',
      whereArgs: [ordenTrabajoId, personaId],
    );

    if (maps.isNotEmpty) {
      return OrdenPersona.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List<OrdenPersona>> getAll() async {
    final db = await MyDatabase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    return List.generate(maps.length, (i) {
      return OrdenPersona.fromMap(maps[i]);
    });
  }

  Future<List<OrdenPersona>> getAllPersonasDeOrden(
      {required int ordenTrabajoId}) async {
    final db = await MyDatabase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'ordenTrabajoId = ?',
      whereArgs: [ordenTrabajoId],
    );

    return List.generate(maps.length, (i) {
      return OrdenPersona.fromMap(maps[i]);
    });
  }

  Future<int> create(OrdenPersona obj) async {
    final db = await MyDatabase.instance.database;
    final id = await db.insert(_tableName, obj.toMap());
    // obj.id = id;
    return id;
  }

  // Devuelve el número de filas afectadas
  Future<int> update(OrdenPersona obj) async {
    final db = await MyDatabase.instance.database;
    return await db.update(
      _tableName,
      obj.toMap(),
      where: 'ordenTrabajoId = ? AND personaId = ?',
      whereArgs: [obj.ordenTrabajoId, obj.personaId],
    );
  }

  Future<int> delete(int ordenTrabajoId, int personaId) async {
    final db = await MyDatabase.instance.database;
    return await db.delete(
      _tableName,
      where: 'ordenTrabajoId = ? AND personaId = ?',
      whereArgs: [ordenTrabajoId, personaId],
    );
  }

  Future<int> deleteAll() async {
    final db = await MyDatabase.instance.database;
    return await db.delete(_tableName);
  }
}
