import 'package:tfg_ac_partes_trabajo/database/my_database.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/base_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/models/material.dart';

class MateriallDao extends BaseDao<Materiall> {
  static const String tableName = 'ordenesTrabajo';

  @override
  Future<Materiall?> get(int id) async {
    final db = await MyDatabase.instance.database;
    final maps = await db.query(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Materiall.fromMap(maps.first);
    } else {
      return null;
    }
  }

  @override
  Future<List<Materiall>> getAll() async {
    final db = await MyDatabase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return Materiall.fromMap(maps[i]);
    });
  }
}
