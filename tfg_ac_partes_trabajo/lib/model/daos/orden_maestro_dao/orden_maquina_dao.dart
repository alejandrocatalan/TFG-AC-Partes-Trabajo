import 'package:tfg_ac_partes_trabajo/model/database/my_database.dart';
import 'package:tfg_ac_partes_trabajo/model/models/orden_maestro/orden_maquina.dart';

class OrdenMaquinaDao {
  static final OrdenMaquinaDao _instance = OrdenMaquinaDao._internal();

  OrdenMaquinaDao._internal();

  static OrdenMaquinaDao get instance => _instance;

  final String _tableName = 'ordenesMaquinas';

  Future<OrdenMaquina?> get(int ordenTrabajoId, int maquinaId) async {
    final db = await MyDatabase.instance.database;
    final maps = await db.query(
      _tableName,
      where: 'ordenTrabajoId = ? AND maquinaId = ?',
      whereArgs: [ordenTrabajoId, maquinaId],
    );

    if (maps.isNotEmpty) {
      return OrdenMaquina.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List<OrdenMaquina>> getAll() async {
    final db = await MyDatabase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    return List.generate(maps.length, (i) {
      return OrdenMaquina.fromMap(maps[i]);
    });
  }

  Future<List<OrdenMaquina>> getAllMaquinasDeOrden(
      {required int ordenTrabajoId}) async {
    final db = await MyDatabase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'ordenTrabajoId = ?',
      whereArgs: [ordenTrabajoId],
    );

    return List.generate(maps.length, (i) {
      return OrdenMaquina.fromMap(maps[i]);
    });
  }

  Future<int> create(OrdenMaquina obj) async {
    final db = await MyDatabase.instance.database;
    final id = await db.insert(_tableName, obj.toMap());
    // obj.id = id;
    return id;
  }

  // Devuelve el número de filas afectadas
  Future<int> update(OrdenMaquina obj) async {
    final db = await MyDatabase.instance.database;
    return await db.update(
      _tableName,
      obj.toMap(),
      where: 'ordenTrabajoId = ? AND maquinaId = ?',
      whereArgs: [obj.ordenTrabajoId, obj.maquinaId],
    );
  }

  Future<int> delete(int ordenTrabajoId, int maquinaId) async {
    final db = await MyDatabase.instance.database;
    return await db.delete(
      _tableName,
      where: 'ordenTrabajoId = ? AND maquinaId = ?',
      whereArgs: [ordenTrabajoId, maquinaId],
    );
  }

  Future<int> deleteAll() async {
    final db = await MyDatabase.instance.database;
    return await db.delete(_tableName);
  }
}
