import 'package:tfg_ac_partes_trabajo/model/database/my_database.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/base_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/models/parte_trabajo.dart';

class ParteTrabajoDao extends BaseDao<ParteTrabajo> {
  static final ParteTrabajoDao _instance = ParteTrabajoDao._internal();
  static ParteTrabajoDao get instance => _instance;

  ParteTrabajoDao._internal() : super(tableName: 'partesTrabajo');

  @override
  Future<ParteTrabajo?> get(int id) async {
    final db = await MyDatabase.instance.database;
    final maps = await db.query(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return ParteTrabajo.fromMap(maps.first);
    } else {
      return null;
    }
  }

  @override
  Future<List<ParteTrabajo>> getAll() async {
    final db = await MyDatabase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return ParteTrabajo.fromMap(maps[i]);
    });
  }

  Future<List<ParteTrabajo>> getAllPartesDeOrden(
      {required int ordenTrabajoId}) async {
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

  Future<List<ParteTrabajo>> getAllFiltered(String searchTerm) async {
    final db = await MyDatabase.instance.database;

    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      where: 'id LIKE ?',
      whereArgs: ['$searchTerm%'],
    );

    return List.generate(maps.length, (i) {
      return ParteTrabajo.fromMap(maps[i]);
    });
  }

  Future<List<ParteTrabajo>> getAllPartesDeOrdenFiltered({
    required int ordenTrabajoId,
    required String searchTerm,
  }) async {
    final db = await MyDatabase.instance.database;

    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      where: 'ordenTrabajoId = ? AND id LIKE ?',
      whereArgs: [ordenTrabajoId, '$searchTerm%'],
    );

    return List.generate(maps.length, (i) {
      return ParteTrabajo.fromMap(maps[i]);
    });
  }

  Future<int?> getLastId() async {
    final db = await MyDatabase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      orderBy: 'id DESC',
      limit: 1,
    );

    if (maps.isNotEmpty) {
      return maps.first['id'] as int?;
    } else {
      return null;
    }
  }
}
