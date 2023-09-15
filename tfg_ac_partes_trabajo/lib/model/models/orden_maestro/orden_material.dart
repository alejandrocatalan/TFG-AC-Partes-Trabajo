class OrdenMaterial {
  final int ordenTrabajoId;
  final int materialId;
  final double unidades;

  OrdenMaterial({
    required this.ordenTrabajoId,
    required this.materialId,
    required this.unidades,
  });

  factory OrdenMaterial.fromMap(Map<String, dynamic> map) {
    return OrdenMaterial(
      ordenTrabajoId: map['ordenTrabajoId'],
      materialId: map['materialId'],
      unidades: map['unidades'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ordenTrabajoId': ordenTrabajoId,
      'materialId': materialId,
      'unidades': unidades,
    };
  }
}
