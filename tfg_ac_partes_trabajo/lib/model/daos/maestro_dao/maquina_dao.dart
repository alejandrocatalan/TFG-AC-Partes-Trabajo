import 'package:tfg_ac_partes_trabajo/model/database/my_database.dart';
import 'package:tfg_ac_partes_trabajo/model/daos/base_dao.dart';
import 'package:tfg_ac_partes_trabajo/model/models/maestro/maquina.dart';

class MaquinaDao extends BaseDao<Maquina> {
  static final MaquinaDao _instance = MaquinaDao._internal();
  static MaquinaDao get instance => _instance;

  MaquinaDao._internal() : super(tableName: 'maquinas');

  @override
  Future<Maquina?> get(int id) async {
    final db = await MyDatabase.instance.database;
    final maps = await db.query(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Maquina.fromMap(maps.first);
    } else {
      return null;
    }
  }

  @override
  Future<List<Maquina>> getAll() async {
    final db = await MyDatabase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return Maquina.fromMap(maps[i]);
    });
  }

  Future<List<Maquina>> getAllMaquinasDeOrdenOParteMaquina(
      List<int> maquinaIds) async {
    final db = await MyDatabase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      where:
          'id IN (${List.generate(maquinaIds.length, (_) => '?').join(', ')})',
      whereArgs: maquinaIds,
    );

    return List.generate(maps.length, (i) {
      return Maquina.fromMap(maps[i]);
    });
  }

  Future<Maquina?> getMaquinaDeOrdenMaquina({required int maquinaId}) async {
    final db = await MyDatabase.instance.database;
    final maps = await db.query(
      tableName,
      where: 'id = ?',
      whereArgs: [maquinaId],
    );

    if (maps.isNotEmpty) {
      return Maquina.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List<Maquina>> getAllMaquinasFiltered({
    required String searchTerm,
  }) async {
    final db = await MyDatabase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      where: 'descripcion LIKE ?',
      whereArgs: ['$searchTerm%'],
    );

    return List.generate(maps.length, (i) {
      return Maquina.fromMap(maps[i]);
    });
  }
}
