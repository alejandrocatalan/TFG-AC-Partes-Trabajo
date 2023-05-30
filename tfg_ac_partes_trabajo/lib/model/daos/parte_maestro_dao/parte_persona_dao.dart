import 'package:tfg_ac_partes_trabajo/model/database/my_database.dart';
import 'package:tfg_ac_partes_trabajo/model/models/parte_maestro/parte_persona.dart';

class PartePersonaDao {
  static final PartePersonaDao _instance = PartePersonaDao._internal();

  PartePersonaDao._internal();

  static PartePersonaDao get instance => _instance;

  final String _tableName = 'partesPersonas';

  Future<PartePersona?> get(int parteTrabajoId, int personaId) async {
    final db = await MyDatabase.instance.database;
    final maps = await db.query(
      _tableName,
      where: 'parteTrabajoId = ? AND personaId = ?',
      whereArgs: [parteTrabajoId, personaId],
    );

    if (maps.isNotEmpty) {
      return PartePersona.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List<PartePersona>> getAll() async {
    final db = await MyDatabase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    return List.generate(maps.length, (i) {
      return PartePersona.fromMap(maps[i]);
    });
  }

  Future<List<PartePersona>> getAllPersonasDeParte(
      {required int parteTrabajoId}) async {
    final db = await MyDatabase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'parteTrabajoId = ?',
      whereArgs: [parteTrabajoId],
    );

    return List.generate(maps.length, (i) {
      return PartePersona.fromMap(maps[i]);
    });
  }

  Future<PartePersona?> getPersonaDeParteFiltered({
    required int parteTrabajoId,
    required int personaId,
  }) async {
    final db = await MyDatabase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'parteTrabajoId = ? AND personaId = ?',
      whereArgs: [parteTrabajoId, personaId],
    );

    if (maps.isNotEmpty) {
      return PartePersona.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> create(PartePersona obj) async {
    final db = await MyDatabase.instance.database;
    final id = await db.insert(_tableName, obj.toMap());
    // obj.id = id;
    return id;
  }

  // Devuelve el número de filas afectadas
  Future<int> update(PartePersona obj) async {
    final db = await MyDatabase.instance.database;
    return await db.update(
      _tableName,
      obj.toMap(),
      where: 'parteTrabajoId = ? AND personaId = ?',
      whereArgs: [obj.parteTrabajoId, obj.personaId],
    );
  }

  Future<int> delete(int parteTrabajoId, int personaId) async {
    final db = await MyDatabase.instance.database;
    return await db.delete(
      _tableName,
      where: 'parteTrabajoId = ? AND personaId = ?',
      whereArgs: [parteTrabajoId, personaId],
    );
  }

  Future<int> deleteAll() async {
    final db = await MyDatabase.instance.database;
    return await db.delete(_tableName);
  }
}
