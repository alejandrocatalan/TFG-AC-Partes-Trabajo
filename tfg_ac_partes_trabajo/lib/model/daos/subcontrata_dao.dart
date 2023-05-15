// import 'package:tfg_ac_partes_trabajo/database/my_database.dart';
// import 'package:tfg_ac_partes_trabajo/model/daos/base_dao.dart';
// import 'package:tfg_ac_partes_trabajo/model/models/subcontrata.dart';

// class SubcontrataDao extends BaseDao<Subcontrata> {
//   static final SubcontrataDao _instance = SubcontrataDao._internal();
//   static SubcontrataDao get instance => _instance;

//   SubcontrataDao._internal() : super(tableName: 'ordenesTrabajo');

//   @override
//   Future<Subcontrata?> get(int id) async {
//     final db = await MyDatabase.instance.database;
//     final maps = await db.query(
//       tableName,
//       where: 'id = ?',
//       whereArgs: [id],
//     );

//     if (maps.isNotEmpty) {
//       return Subcontrata.fromMap(maps.first);
//     } else {
//       return null;
//     }
//   }

//   @override
//   Future<List<Subcontrata>> getAll() async {
//     final db = await MyDatabase.instance.database;
//     final List<Map<String, dynamic>> maps = await db.query(tableName);

//     return List.generate(maps.length, (i) {
//       return Subcontrata.fromMap(maps[i]);
//     });
//   }
// }
