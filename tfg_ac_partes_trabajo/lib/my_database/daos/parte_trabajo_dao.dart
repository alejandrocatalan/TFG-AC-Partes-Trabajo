import 'package:tfg_ac_partes_trabajo/my_database/models/models.dart';
import 'package:tfg_ac_partes_trabajo/my_database/my_database.dart';

class ParteTrabajoDao {
  static const String tableName = 'partesTrabajo';

  Future<int> create(ParteTrabajo parteTrabajo) async {
    final db = await MyDatabase.instance.database;

    return await db.insert(tableName, parteTrabajo.toMap());
  }

  Future<List<ParteTrabajo>> getAll() async {
    final db = await MyDatabase.instance.database;

    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return ParteTrabajo.fromMap(maps[i]);
    });
  }

  Future<List<ParteTrabajo>> getAllByOrdenTrabajo(int ordenTrabajoId) async {
    final db = await MyDatabase.instance.database;

    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      where: 'ordenTrabajoId = ?',
      whereArgs: [ordenTrabajoId],
    );

    return List.generate(maps.length, (i) {
      return ParteTrabajo.fromMap(maps[i]);
    });
  }

  Future<int> update(ParteTrabajo parteTrabajo) async {
    final db = await MyDatabase.instance.database;

    return await db.update(
      tableName,
      parteTrabajo.toMap(),
      where: 'id = ?',
      whereArgs: [parteTrabajo.id],
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
