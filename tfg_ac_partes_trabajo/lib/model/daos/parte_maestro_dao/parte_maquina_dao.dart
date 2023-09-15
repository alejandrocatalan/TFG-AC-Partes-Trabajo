import 'package:tfg_ac_partes_trabajo/model/database/my_database.dart';
import 'package:tfg_ac_partes_trabajo/model/models/parte_maestro/parte_maquina.dart';

class ParteMaquinaDao {
  static final ParteMaquinaDao _instance = ParteMaquinaDao._internal();

  ParteMaquinaDao._internal();

  static ParteMaquinaDao get instance => _instance;

  final String _tableName = 'partesMaquinas';

  Future<ParteMaquina?> get(int parteTrabajoId, int maquinaId) async {
    final db = await MyDatabase.instance.database;
    final maps = await db.query(
      _tableName,
      where: 'parteTrabajoId = ? AND maquinaId = ?',
      whereArgs: [parteTrabajoId, maquinaId],
    );

    if (maps.isNotEmpty) {
      return ParteMaquina.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List<ParteMaquina>> getAll() async {
    final db = await MyDatabase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    return List.generate(maps.length, (i) {
      return ParteMaquina.fromMap(maps[i]);
    });
  }

  Future<List<ParteMaquina>> getAllMaquinasDeParte(
      {required int parteTrabajoId}) async {
    final db = await MyDatabase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'parteTrabajoId = ?',
      whereArgs: [parteTrabajoId],
    );

    return List.generate(maps.length, (i) {
      return ParteMaquina.fromMap(maps[i]);
    });
  }

  Future<ParteMaquina?> getMaquinaDeParteFiltered({
    required int parteTrabajoId,
    required int maquinaId,
  }) async {
    final db = await MyDatabase.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      where: 'parteTrabajoId = ? AND maquinaId = ?',
      whereArgs: [parteTrabajoId, maquinaId],
    );

    if (maps.isNotEmpty) {
      return ParteMaquina.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> create(ParteMaquina obj) async {
    final db = await MyDatabase.instance.database;
    final id = await db.insert(_tableName, obj.toMap());
    // obj.id = id;
    return id;
  }

  // Devuelve el número de filas afectadas
  Future<int> update(ParteMaquina obj) async {
    final db = await MyDatabase.instance.database;
    return await db.update(
      _tableName,
      obj.toMap(),
      where: 'parteTrabajoId = ? AND maquinaId = ?',
      whereArgs: [obj.parteTrabajoId, obj.maquinaId],
    );
  }

  Future<int> delete(int parteTrabajoId, int maquinaId) async {
    final db = await MyDatabase.instance.database;
    return await db.delete(
      _tableName,
      where: 'parteTrabajoId = ? AND maquinaId = ?',
      whereArgs: [parteTrabajoId, maquinaId],
    );
  }

  Future<int> deleteAll() async {
    final db = await MyDatabase.instance.database;
    return await db.delete(_tableName);
  }
}
