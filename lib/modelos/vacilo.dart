class Vacilo {
  String tipo;
  String descricao;
  String alerta;
  String texto;

  Vacilo({
    required this.tipo,
    required this.descricao,
    required this.alerta,
    required this.texto,
  });

  factory Vacilo.fromJson(Map<String, dynamic> json) {
    return Vacilo(
      tipo: json['tipo'] ?? '',
      descricao: json['descricao'] ?? '',
      alerta: json['alerta'] ?? '',
      texto: json['texto'] ?? '',
    );
  }
}
