import 'package:tfg_ac_partes_trabajo/model/daos/base_dao.dart';

class ParteTrabajo extends ObjectWithMap {
  final int ordenTrabajoId;
  final DateTime fechaInicio;
  final DateTime fechaFin;
  final String observaciones;
  final String trabajoARealizar;
  final String identificadorDispositivo;
  final String? coordenadas;

  ParteTrabajo({
    required int id,
    required this.ordenTrabajoId,
    required this.fechaInicio,
    required this.fechaFin,
    required this.observaciones,
    required this.trabajoARealizar,
    required this.identificadorDispositivo,
    this.coordenadas,
  }) : super(id: id);

  factory ParteTrabajo.fromMap(Map<String, dynamic> map) {
    return ParteTrabajo(
      id: map['id'],
      ordenTrabajoId: map['ordenTrabajoId'],
      fechaInicio: DateTime.parse(map['fechaInicio']),
      fechaFin: DateTime.parse(map['fechaFin']),
      observaciones: map['observaciones'],
      trabajoARealizar: map['trabajoARealizar'],
      identificadorDispositivo: map['identificadorDispositivo'],
      coordenadas: map['coordenadas'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ordenTrabajoId': ordenTrabajoId,
      'fechaInicio': fechaInicio.toIso8601String(),
      'fechaFin': fechaFin.toIso8601String(),
      'observaciones': observaciones,
      'trabajoARealizar': trabajoARealizar,
      'identificadorDispositivo': identificadorDispositivo,
      'coordenadas': coordenadas,
    };
  }
}
