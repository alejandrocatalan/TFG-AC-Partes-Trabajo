import 'package:tfg_ac_partes_trabajo/my_database/models/models.dart';
import 'package:tfg_ac_partes_trabajo/my_database/my_database.dart';

class OrdenTrabajoDao {
  static const String tableName = 'ordenesTrabajo';

  Future<int> create(OrdenTrabajo ordenTrabajo) async {
    final db = await MyDatabase.instance.database;

    return await db.insert(tableName, ordenTrabajo.toMap());
  }

  Future<OrdenTrabajo?> get(int id) async {
    final db = await MyDatabase.instance.database;

    final maps = await db.query(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return OrdenTrabajo.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List<OrdenTrabajo>> getAll() async {
    final db = await MyDatabase.instance.database;

    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return OrdenTrabajo.fromMap(maps[i]);
    });
  }

  Future<int> update(OrdenTrabajo ordenTrabajo) async {
    final db = await MyDatabase.instance.database;

    return await db.update(
      tableName,
      ordenTrabajo.toMap(),
      where: 'id = ?',
      whereArgs: [ordenTrabajo.id],
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
