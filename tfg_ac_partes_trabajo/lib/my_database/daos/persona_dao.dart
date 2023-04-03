import 'package:tfg_ac_partes_trabajo/my_database/models/models.dart';
import 'package:tfg_ac_partes_trabajo/my_database/my_database.dart';

class PersonaDao {
  static const String tableName = 'personas';

  Future<int> create(Persona persona) async {
    final db = await MyDatabase.instance.database;

    return await db.insert(tableName, persona.toMap());
  }

  Future<List<Persona>> getAll() async {
    final db = await MyDatabase.instance.database;

    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return Persona.fromMap(maps[i]);
    });
  }

  Future<int> update(Persona persona) async {
    final db = await MyDatabase.instance.database;

    return await db.update(
      tableName,
      persona.toMap(),
      where: 'id = ?',
      whereArgs: [persona.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await MyDatabase.instance.database;

    return await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
