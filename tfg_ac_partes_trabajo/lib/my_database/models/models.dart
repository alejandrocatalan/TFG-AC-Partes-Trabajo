class OrdenTrabajo {
  final int id;
  final DateTime fechaInicio;
  final DateTime? fechaFin;
  final String? tipo;
  final String? observaciones;
  final String? trabajoARealizar;
  final String codigoOrdenCliente;
  final String? instalacion;

  OrdenTrabajo({
    required this.id,
    required this.fechaInicio,
    this.fechaFin,
    this.tipo,
    this.observaciones,
    this.trabajoARealizar,
    required this.codigoOrdenCliente,
    this.instalacion,
  });

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

class ParteTrabajo {
  final int id;
  final int ordenTrabajoId;
  final DateTime fechaInicio;
  final DateTime fechaFin;
  final String observaciones;
  final String trabajoARealizar;
  final String identificadorDispositivo;
  final String? coordenadas;

  ParteTrabajo({
    required this.id,
    required this.ordenTrabajoId,
    required this.fechaInicio,
    required this.fechaFin,
    required this.observaciones,
    required this.trabajoARealizar,
    required this.identificadorDispositivo,
    this.coordenadas,
  });

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

class Persona {
  final int id;
  final String descripcion;

  Persona({
    required this.id,
    required this.descripcion,
  });

  factory Persona.fromMap(Map<String, dynamic> map) {
    return Persona(
      id: map['id'],
      descripcion: map['descripcion'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descripcion': descripcion,
    };
  }
}

class Maquina {
  final int id;
  final String descripcion;

  Maquina({
    required this.id,
    required this.descripcion,
  });

  factory Maquina.fromMap(Map<String, dynamic> map) {
    return Maquina(
      id: map['id'],
      descripcion: map['descripcion'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descripcion': descripcion,
    };
  }
}

class Material {
  final int id;
  final String descripcion;

  Material({
    required this.id,
    required this.descripcion,
  });

  factory Material.fromMap(Map<String, dynamic> map) {
    return Material(
      id: map['id'],
      descripcion: map['descripcion'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descripcion': descripcion,
    };
  }
}

class Subcontrata {
  final int id;
  final String descripcion;

  Subcontrata({
    required this.id,
    required this.descripcion,
  });

  factory Subcontrata.fromMap(Map<String, dynamic> map) {
    return Subcontrata(
      id: map['id'],
      descripcion: map['descripcion'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descripcion': descripcion,
    };
  }
}
