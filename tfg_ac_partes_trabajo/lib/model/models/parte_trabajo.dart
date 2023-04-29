import 'package:tfg_ac_partes_trabajo/model/daos/base_dao.dart';

class ParteTrabajo extends ObjectWithMap {
  final int ordenTrabajoId;
  final DateTime fechaInicio;
  final DateTime fechaFin;
  final String observaciones;
  final String trabajoRealizado;
  final String identificadorDispositivo;
  final String? coordenadas;

  ParteTrabajo({
    required this.ordenTrabajoId,
    required this.fechaInicio,
    required this.fechaFin,
    required this.observaciones,
    required this.trabajoRealizado,
    required this.identificadorDispositivo,
    this.coordenadas,
    int? id,
  }) : super(id: id);

  static ParteTrabajo initial() {
    return ParteTrabajo(
      ordenTrabajoId: -1,
      fechaInicio: DateTime.now(),
      fechaFin: DateTime.now(),
      observaciones: '',
      trabajoRealizado: '',
      identificadorDispositivo: '',
    );
  }

  ParteTrabajo copyWith({
    int? ordenTrabajoId,
    DateTime? fechaInicio,
    DateTime? fechaFin,
    String? observaciones,
    String? trabajoRealizado,
    String? identificadorDispositivo,
    String? coordenadas,
    int? id,
  }) {
    return ParteTrabajo(
      ordenTrabajoId: ordenTrabajoId ?? this.ordenTrabajoId,
      fechaInicio: fechaInicio ?? this.fechaInicio,
      fechaFin: fechaFin ?? this.fechaFin,
      observaciones: observaciones ?? this.observaciones,
      trabajoRealizado: trabajoRealizado ?? this.trabajoRealizado,
      identificadorDispositivo:
          identificadorDispositivo ?? this.identificadorDispositivo,
      coordenadas: coordenadas ?? this.coordenadas,
      id: id ?? this.id,
    );
  }

  factory ParteTrabajo.fromMap(Map<String, dynamic> map) {
    return ParteTrabajo(
      ordenTrabajoId: map['ordenTrabajoId'],
      fechaInicio: DateTime.parse(map['fechaInicio']),
      fechaFin: DateTime.parse(map['fechaFin']),
      observaciones: map['observaciones'],
      trabajoRealizado: map['trabajoRealizado'],
      identificadorDispositivo: map['identificadorDispositivo'],
      coordenadas: map['coordenadas'],
    )..id = map['id'];
  }

  @override
  Map<String, dynamic> toMap() {
    final map = {
      'ordenTrabajoId': ordenTrabajoId,
      'fechaInicio': fechaInicio.toIso8601String(),
      'fechaFin': fechaFin.toIso8601String(),
      'observaciones': observaciones,
      'trabajoRealizado': trabajoRealizado,
      'identificadorDispositivo': identificadorDispositivo,
      'coordenadas': coordenadas,
    };

    if (id != null) {
      map['id'] = id.toString();
    }

    return map;
  }
}
