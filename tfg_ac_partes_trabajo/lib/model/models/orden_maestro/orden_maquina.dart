class OrdenMaquina {
  final int ordenTrabajoId;
  final int maquinaId;
  final double horas;

  OrdenMaquina({
    required this.ordenTrabajoId,
    required this.maquinaId,
    required this.horas,
  });

  factory OrdenMaquina.fromMap(Map<String, dynamic> map) {
    return OrdenMaquina(
      ordenTrabajoId: map['ordenTrabajoId'],
      maquinaId: map['maquinaId'],
      horas: map['horas'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ordenTrabajoId': ordenTrabajoId,
      'maquinaId': maquinaId,
      'horas': horas,
    };
  }
}
