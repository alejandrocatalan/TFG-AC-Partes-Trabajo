import 'package:tfg_ac_partes_trabajo/model/database/my_database.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/base_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/models/maestro/material.dart';

class MaterialDao extends BaseDao<Materiall> {
  static final MaterialDao _instance = MaterialDao._internal();
  static MaterialDao get instance => _instance;

  MaterialDao._internal() : super(tableName: 'materiales');

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

  Future<List<Materiall>> getAllMaterialesDeOrdenOParteMaterial(
      List<int> materialIds) async {
    final db = await MyDatabase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      where:
          'id IN (${List.generate(materialIds.length, (_) => '?').join(', ')})',
      whereArgs: materialIds,
    );

    return List.generate(maps.length, (i) {
      return Materiall.fromMap(maps[i]);
    });
  }

  Future<Materiall?> getMaterialDeOrdenMaterial(
      {required int materialId}) async {
    final db = await MyDatabase.instance.database;
    final maps = await db.query(
      tableName,
      where: 'id = ?',
      whereArgs: [materialId],
    );

    if (maps.isNotEmpty) {
      return Materiall.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List<Materiall>> getAllMaterialesFiltered({
    required String searchTerm,
  }) async {
    final db = await MyDatabase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      where: 'descripcion LIKE ?',
      whereArgs: ['$searchTerm%'],
    );

    return List.generate(maps.length, (i) {
      return Materiall.fromMap(maps[i]);
    });
  }
}
