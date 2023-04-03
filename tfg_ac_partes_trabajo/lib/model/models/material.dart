import 'package:tfg_ac_partes_trabajo/model/daos/base_dao.dart';

class Materiall extends ObjectWithMap {
  final String descripcion;

  Materiall({
    required int id,
    required this.descripcion,
  }) : super(id: id);

  factory Materiall.fromMap(Map<String, dynamic> map) {
    return Materiall(
      id: map['id'],
      descripcion: map['descripcion'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descripcion': descripcion,
    };
  }
}
