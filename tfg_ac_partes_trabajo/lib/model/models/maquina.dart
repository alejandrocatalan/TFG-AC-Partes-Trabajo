import 'package:tfg_ac_partes_trabajo/model/daos/base_dao.dart';

class Maquina extends ObjectWithMap {
  final String descripcion;

  Maquina({
    required int id,
    required this.descripcion,
  }) : super(id: id);

  factory Maquina.fromMap(Map<String, dynamic> map) {
    return Maquina(
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
