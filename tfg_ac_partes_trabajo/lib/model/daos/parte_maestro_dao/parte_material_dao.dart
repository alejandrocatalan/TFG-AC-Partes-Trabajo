import 'package:tfg_ac_partes_trabajo/model/database/my_database.dart';
import 'package:tfg_ac_partes_trabajo/model/models/parte_maestro/parte_material.dart';

class ParteMaterialDao {
  static final ParteMaterialDao _instance = ParteMaterialDao._internal();

  ParteMaterialDao._internal();

  static ParteMaterialDao get instance => _instance;

  final String _tableName = 'partesMateriales';

  Future<ParteMaterial?> get(int parteTrabajoId, int materialId) async {
    final db = await MyDatabase.instance.database;
    final maps = await db.query(
      _tableName,
      where: 'parteTrabajoId = ? AND materialId = ?',
      whereArgs: [parteTrabajoId, materialId],
    );

    if (maps.isNotEmpty) {
      return ParteMaterial.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List<ParteMaterial>> getAll() async {
    final db = await MyDatabase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    return List.generate(maps.length, (i) {
      return ParteMaterial.fromMap(maps[i]);
    });
  }

  Future<List<ParteMaterial>> getAllMaterialesDeParte(
      {required int parteTrabajoId}) async {
    final db = await MyDatabase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'parteTrabajoId = ?',
      whereArgs: [parteTrabajoId],
    );

    return List.generate(maps.length, (i) {
      return ParteMaterial.fromMap(maps[i]);
    });
  }

  Future<ParteMaterial?> getMaterialDeParteFiltered({
    required int parteTrabajoId,
    required int materialId,
  }) async {
    final db = await MyDatabase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'parteTrabajoId = ? AND materialId = ?',
      whereArgs: [parteTrabajoId, materialId],
    );

    if (maps.isNotEmpty) {
      return ParteMaterial.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> create(ParteMaterial obj) async {
    final db = await MyDatabase.instance.database;
    final id = await db.insert(_tableName, obj.toMap());
    // obj.id = id;
    return id;
  }

  // Devuelve el número de filas afectadas
  Future<int> update(ParteMaterial obj) async {
    final db = await MyDatabase.instance.database;
    return await db.update(
      _tableName,
      obj.toMap(),
      where: 'parteTrabajoId = ? AND materialId = ?',
      whereArgs: [obj.parteTrabajoId, obj.materialId],
    );
  }

  Future<int> delete(int parteTrabajoId, int materialId) async {
    final db = await MyDatabase.instance.database;
    return await db.delete(
      _tableName,
      where: 'parteTrabajoId = ? AND materialId = ?',
      whereArgs: [parteTrabajoId, materialId],
    );
  }

  Future<int> deleteAll() async {
    final db = await MyDatabase.instance.database;
    return await db.delete(_tableName);
  }
}
