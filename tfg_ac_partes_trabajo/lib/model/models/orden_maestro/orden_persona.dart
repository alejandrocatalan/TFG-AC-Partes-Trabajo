class OrdenPersona {
  final int ordenTrabajoId;
  final int personaId;
  final double horas;

  OrdenPersona({
    required this.ordenTrabajoId,
    required this.personaId,
    required this.horas,
  });

  factory OrdenPersona.fromMap(Map<String, dynamic> map) {
    return OrdenPersona(
      ordenTrabajoId: map['ordenTrabajoId'],
      personaId: map['personaId'],
      horas: map['horas'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ordenTrabajoId': ordenTrabajoId,
      'personaId': personaId,
      'horas': horas,
    };
  }
}
