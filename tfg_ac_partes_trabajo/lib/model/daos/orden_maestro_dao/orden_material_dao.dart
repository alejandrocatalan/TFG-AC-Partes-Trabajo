import 'package:tfg_ac_partes_trabajo/database/my_database.dart';
import 'package:tfg_ac_partes_trabajo/model/models/orden_maestro/orden_material.dart';

class OrdenMaterialDao {
  static final OrdenMaterialDao _instance = OrdenMaterialDao._internal();

  OrdenMaterialDao._internal();

  static OrdenMaterialDao get instance => _instance;

  final String _tableName = 'ordenesMateriales';

  Future<OrdenMaterial?> get(int ordenTrabajoId, int materialId) async {
    final db = await MyDatabase.instance.database;
    final maps = await db.query(
      _tableName,
      where: 'ordenTrabajoId = ? AND materialId = ?',
      whereArgs: [ordenTrabajoId, materialId],
    );

    if (maps.isNotEmpty) {
      return OrdenMaterial.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List<OrdenMaterial>> getAll() async {
    final db = await MyDatabase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    return List.generate(maps.length, (i) {
      return OrdenMaterial.fromMap(maps[i]);
    });
  }

  Future<List<OrdenMaterial>> getAllMaterialesDeOrden(
      {required int ordenTrabajoId}) async {
    final db = await MyDatabase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'ordenTrabajoId = ?',
      whereArgs: [ordenTrabajoId],
    );

    return List.generate(maps.length, (i) {
      return OrdenMaterial.fromMap(maps[i]);
    });
  }

  Future<int> create(OrdenMaterial obj) async {
    final db = await MyDatabase.instance.database;
    final id = await db.insert(_tableName, obj.toMap());
    // obj.id = id;
    return id;
  }

  // Devuelve el número de filas afectadas
  Future<int> update(OrdenMaterial obj) async {
    final db = await MyDatabase.instance.database;
    return await db.update(
      _tableName,
      obj.toMap(),
      where: 'ordenTrabajoId = ? AND materialId = ?',
      whereArgs: [obj.ordenTrabajoId, obj.materialId],
    );
  }

  Future<int> delete(int ordenTrabajoId, int materialId) async {
    final db = await MyDatabase.instance.database;
    return await db.delete(
      _tableName,
      where: 'ordenTrabajoId = ? AND materialId = ?',
      whereArgs: [ordenTrabajoId, materialId],
    );
  }

  Future<int> deleteAll() async {
    final db = await MyDatabase.instance.database;
    return await db.delete(_tableName);
  }
}
