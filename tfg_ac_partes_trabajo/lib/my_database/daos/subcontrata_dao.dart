import 'package:tfg_ac_partes_trabajo/my_database/models/models.dart';
import 'package:tfg_ac_partes_trabajo/my_database/my_database.dart';

class SubcontrataDao {
  static const String tableName = 'subcontratas';

  Future<int> create(Subcontrata subcontrata) async {
    final db = await MyDatabase.instance.database;

    return await db.insert(tableName, subcontrata.toMap());
  }

  Future<List<Subcontrata>> getAll() async {
    final db = await MyDatabase.instance.database;

    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return Subcontrata.fromMap(maps[i]);
    });
  }

  Future<int> update(Subcontrata subcontrata) async {
    final db = await MyDatabase.instance.database;

    return await db.update(
      tableName,
      subcontrata.toMap(),
      where: 'id = ?',
      whereArgs: [subcontrata.id],
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
