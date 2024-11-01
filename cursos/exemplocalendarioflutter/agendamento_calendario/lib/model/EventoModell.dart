import 'dart:convert';

class EventoModeell {
  EventoModeell({
    required this.nome,
    required this.data,
    required this.tipoAfastamento,
  });

  final String nome;
  final String data;
  final String tipoAfastamento;

  Map<String, dynamic> toMap() {
    return {'nome': nome, 'data': data, 'tipoAfastamento': tipoAfastamento};
  }

  String toJson() => json.encode(toMap());

  factory EventoModeell.fromMap(Map<String, dynamic> map) {
    return EventoModeell(
      nome: map['nome'] ?? 'Não Carregou',
      data: map['data'] ?? 'Não Carregou',
      tipoAfastamento: map['tipoAfastamento'] ?? 'Não Carregou',
    );
  }

  factory EventoModeell.fromJson(String json) =>
      EventoModeell.fromMap(jsonDecode(json));
}
