import 'package:tfg_ac_partes_trabajo/model/daos/base_dao.dart';

class Maquina extends ObjectWithMap {
  final String descripcion;

  Maquina({
    required this.descripcion,
  }) : super(id: null);

  factory Maquina.fromMap(Map<String, dynamic> map) {
    return Maquina(
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
