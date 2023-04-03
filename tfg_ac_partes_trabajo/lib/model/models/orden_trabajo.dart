import 'package:tfg_ac_partes_trabajo/model/daos/base_dao.dart';

class OrdenTrabajo extends ObjectWithMap {
  final DateTime fechaInicio;
  final DateTime? fechaFin;
  final String? tipo;
  final String? observaciones;
  final String? trabajoARealizar;
  final String codigoOrdenCliente;
  final String? instalacion;

  OrdenTrabajo({
    required int id,
    required this.fechaInicio,
    this.fechaFin,
    this.tipo,
    this.observaciones,
    this.trabajoARealizar,
    required this.codigoOrdenCliente,
    this.instalacion,
  }) : super(id: id);

  factory OrdenTrabajo.fromMap(Map<String, dynamic> map) {
    return OrdenTrabajo(
      id: map['id'],
      fechaInicio: DateTime.parse(map['fechaInicio']),
      fechaFin:
          map['fechaFin'] != null ? DateTime.parse(map['fechaFin']) : null,
      tipo: map['tipo'],
      observaciones: map['observaciones'],
      trabajoARealizar: map['trabajoARealizar'],
      codigoOrdenCliente: map['codigoOrdenCliente'],
      instalacion: map['instalacion'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fechaInicio': fechaInicio.toIso8601String(),
      'fechaFin': fechaFin?.toIso8601String(),
      'tipo': tipo,
      'observaciones': observaciones,
      'trabajoARealizar': trabajoARealizar,
      'codigoOrdenCliente': codigoOrdenCliente,
      'instalacion': instalacion,
    };
  }
}
