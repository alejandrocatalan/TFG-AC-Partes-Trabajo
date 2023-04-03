import 'package:tfg_ac_partes_trabajo/my_database/models/models.dart';
import 'package:tfg_ac_partes_trabajo/my_database/my_database.dart';

class MateriaDao {
  static const String tableName = 'materiales';

  Future<int> create(Material material) async {
    final db = await MyDatabase.instance.database;

    return await db.insert(tableName, material.toMap());
  }

  Future<List<Material>> getAll() async {
    final db = await MyDatabase.instance.database;

    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return Material.fromMap(maps[i]);
    });
  }

  Future<int> update(Material material) async {
    final db = await MyDatabase.instance.database;

    return await db.update(
      tableName,
      material.toMap(),
      where: 'id = ?',
      whereArgs: [material.id],
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
