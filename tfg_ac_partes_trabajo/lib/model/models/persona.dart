import 'package:tfg_ac_partes_trabajo/model/daos/base_dao.dart';

class Persona extends ObjectWithMap {
  final String descripcion;

  Persona({
    required int id,
    required this.descripcion,
  }) : super(id: id);

  factory Persona.fromMap(Map<String, dynamic> map) {
    return Persona(
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
