import 'package:tfg_ac_partes_trabajo/model/daos/base_dao.dart';

class Subcontrata extends ObjectWithMap {
  final String descripcion;

  Subcontrata({
    required int id,
    required this.descripcion,
  }) : super(id: id);

  factory Subcontrata.fromMap(Map<String, dynamic> map) {
    return Subcontrata(
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
