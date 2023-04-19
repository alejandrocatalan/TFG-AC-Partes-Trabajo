import 'package:tfg_ac_partes_trabajo/database/my_database.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/base_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/models/orden_trabajo.dart';

class OrdenTrabajoDao extends BaseDao<OrdenTrabajo> {
  static final OrdenTrabajoDao _instance = OrdenTrabajoDao._internal();
  static OrdenTrabajoDao get instance => _instance;

  OrdenTrabajoDao._internal() : super(tableName: 'ordenesTrabajo');

  @override
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

  Future<List<OrdenTrabajo>> getAllFiltered(String searchTerm) async {
    final db = await MyDatabase.instance.database;

    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      where: 'id LIKE ?',
      whereArgs: ['$searchTerm%'],
    );

    return List.generate(maps.length, (i) {
      return OrdenTrabajo.fromMap(maps[i]);
    });
  }

  @override
  Future<List<OrdenTrabajo>> getAll() async {
    final db = await MyDatabase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return OrdenTrabajo.fromMap(maps[i]);
    });
  }
}
