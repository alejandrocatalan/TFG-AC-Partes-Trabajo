class ParteMaquina {
  final int parteTrabajoId;
  final int maquinaId;
  final double horas;

  ParteMaquina({
    required this.parteTrabajoId,
    required this.maquinaId,
    required this.horas,
  });

  factory ParteMaquina.fromMap(Map<String, dynamic> map) {
    return ParteMaquina(
      parteTrabajoId: map['parteTrabajoId'],
      maquinaId: map['maquinaId'],
      horas: map['horas'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'parteTrabajoId': parteTrabajoId,
      'maquinaId': maquinaId,
      'horas': horas,
    };
  }
}
