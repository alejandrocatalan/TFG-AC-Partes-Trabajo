import 'package:tfg_ac_partes_trabajo/model/daos/base_dao.dart';

class Materiall extends ObjectWithMap {
  final String descripcion;

  Materiall({
    required this.descripcion,
  }) : super(id: null);

  factory Materiall.fromMap(Map<String, dynamic> map) {
    return Materiall(
      descripcion: map['descripcion'],
    )..id = map['id'];
  }

  @override
  Map<String, dynamic> toMap() {
    final map = {
      'descripcion': descripcion,
    };

    if (id != null) {
      map['id'] = id.toString();
    }

    return map;
  }
}
