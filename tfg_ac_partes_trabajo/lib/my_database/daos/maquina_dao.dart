import 'package:tfg_ac_partes_trabajo/my_database/models/models.dart';
import 'package:tfg_ac_partes_trabajo/my_database/my_database.dart';

class MaquinaDao {
  static const String tableName = 'maquinas';

  Future<int> create(Maquina maquina) async {
    final db = await MyDatabase.instance.database;

    return await db.insert(tableName, maquina.toMap());
  }

  Future<List<Maquina>> getAll() async {
    final db = await MyDatabase.instance.database;

    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return Maquina.fromMap(maps[i]);
    });
  }

  Future<int> update(Maquina maquina) async {
    final db = await MyDatabase.instance.database;

    return await db.update(
      tableName,
      maquina.toMap(),
      where: 'id = ?',
      whereArgs: [maquina.id],
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
