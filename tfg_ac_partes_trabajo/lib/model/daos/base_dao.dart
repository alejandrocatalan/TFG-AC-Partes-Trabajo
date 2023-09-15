import 'package:tfg_ac_partes_trabajo/model/database/my_database.dart';

abstract class BaseDao<T extends ObjectWithMap> {
  final String tableName;

  BaseDao({required this.tableName});

  Future<int> create(T obj) async {
    final db = await MyDatabase.instance.database;
    final id = await db.insert(tableName, obj.toMap());
    return id;
  }

  Future<T?> get(int id);

  Future<List<T>> getAll();

  // Devuelve el número de filas afectadas
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

  Future<int> deleteAll() async {
    final db = await MyDatabase.instance.database;
    return await db.delete(tableName);
  }
}

class ObjectWithMap {
  int? id;

  ObjectWithMap({required this.id});

  fromMap<T extends ObjectWithMap>(Map<String, dynamic> map) {
    throw UnimplementedError('objectFromMap() must be implemented');
  }

  Map<String, dynamic> toMap() {
    throw UnimplementedError('toMap() must be implemented');
  }
}
