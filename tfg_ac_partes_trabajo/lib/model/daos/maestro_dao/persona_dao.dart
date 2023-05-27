import 'package:tfg_ac_partes_trabajo/database/my_database.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/base_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/models/maestro/persona.dart';

class PersonaDao extends BaseDao<Persona> {
  static final PersonaDao _instance = PersonaDao._internal();
  static PersonaDao get instance => _instance;

  PersonaDao._internal() : super(tableName: 'personas');

  @override
  Future<Persona?> get(int id) async {
    final db = await MyDatabase.instance.database;
    final maps = await db.query(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Persona.fromMap(maps.first);
    } else {
      return null;
    }
  }

  @override
  Future<List<Persona>> getAll() async {
    final db = await MyDatabase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return Persona.fromMap(maps[i]);
    });
  }

  Future<List<Persona>> getAllPersonasById(List<int> personaIds) async {
    final db = await MyDatabase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      where:
          'id IN (${List.generate(personaIds.length, (_) => '?').join(', ')})',
      whereArgs: personaIds,
    );

    return List.generate(maps.length, (i) {
      return Persona.fromMap(maps[i]);
    });
  }

  Future<Persona?> getPersonaDeOrdenPersona({required int personaId}) async {
    final db = await MyDatabase.instance.database;
    final maps = await db.query(
      tableName,
      where: 'id = ?',
      whereArgs: [personaId],
    );

    if (maps.isNotEmpty) {
      return Persona.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List<Persona>> getAllPersonasFiltered({
    required String searchTerm,
  }) async {
    final db = await MyDatabase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      where: 'descripcion LIKE ?',
      whereArgs: ['$searchTerm%'],
    );

    return List.generate(maps.length, (i) {
      return Persona.fromMap(maps[i]);
    });
  }
}
