import 'package:tfg_ac_partes_trabajo/model/daos/base_dao.dart';

class Persona extends ObjectWithMap {
  final String descripcion;

  Persona({
    required this.descripcion,
  }) : super(id: null);

  factory Persona.fromMap(Map<String, dynamic> map) {
    return Persona(
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
