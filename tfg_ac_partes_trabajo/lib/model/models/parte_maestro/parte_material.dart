class ParteMaterial {
  final int parteTrabajoId;
  final int materialId;
  final double unidades;

  ParteMaterial({
    required this.parteTrabajoId,
    required this.materialId,
    required this.unidades,
  });

  factory ParteMaterial.fromMap(Map<String, dynamic> map) {
    return ParteMaterial(
      parteTrabajoId: map['parteTrabajoId'],
      materialId: map['materialId'],
      unidades: map['unidades'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'parteTrabajoId': parteTrabajoId,
      'materialId': materialId,
      'unidades': unidades,
    };
  }
}
