import 'package:tfg_ac_partes_trabajo/database/my_database.dart';

abstract class BaseDao<T extends ObjectWithMap> {
  static late final String tableName;

  Future<int> create(T obj) async {
    final db = await MyDatabase.instance.database;
    return await db.insert(tableName, obj.toMap());
  }

  Future<T?> get(int id);

  Future<List<T>> getAll();

  Future<int> update(T obj) async {
    final db = await MyDatabase.instance.database;
    return await db.update(
      tableName,
      obj.toMap(),
      where: 'id = ?',
      whereArgs: [obj.id],
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

class ObjectWithMap {
  /// Variables del objeto abstracto
  final int id;

  ObjectWithMap({required this.id});

  /// Funciones del objeto abstracto
  Map<String, dynamic> toMap() {
    throw UnimplementedError('toMap() must be implemented');
  }
}
