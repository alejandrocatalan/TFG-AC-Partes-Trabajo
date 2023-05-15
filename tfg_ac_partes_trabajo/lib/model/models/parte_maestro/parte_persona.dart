class PartePersona {
  final int parteTrabajoId;
  final int personaId;
  final double horas;

  PartePersona({
    required this.parteTrabajoId,
    required this.personaId,
    required this.horas,
  });

  factory PartePersona.fromMap(Map<String, dynamic> map) {
    return PartePersona(
      parteTrabajoId: map['parteTrabajoId'],
      personaId: map['personaId'],
      horas: map['horas'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'parteTrabajoId': parteTrabajoId,
      'personaId': personaId,
      'horas': horas,
    };
  }
}
