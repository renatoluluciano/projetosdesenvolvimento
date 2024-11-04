import 'dart:convert';

class Agendamento {
  Agendamento({
    required this.id,
    required this.nomePolicial,
    required this.dataAfastamento,
    required this.tipoAfastamento,
  });

  int id;
  String nomePolicial;
  String dataAfastamento;
  String tipoAfastamento;

  //transforma o Map em uma instancia em um objeto
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nomePolicial": nomePolicial,
      "dataAfastamento": dataAfastamento,
      "tipoAfastamento": tipoAfastamento
    };
  }

  String toJson() => jsonEncode(toMap());
  //to Json map de chave e valor e transforma em um json

  factory Agendamento.fromMap(Map<String, dynamic> map) {
    return Agendamento(
        id: map['id'] ?? 0,
        nomePolicial: map['nomePolicial'] ?? '',
        dataAfastamento: map['dataAfastamento'] ?? '',
        tipoAfastamento: map['tipoAfastamento'] ?? '');
  }

  factory Agendamento.fromJson(String json) =>
      Agendamento.fromMap(jsonDecode(json));

  @override
  String toString() {
    return '''
Agendamento: $nomePolicial,
Data: $dataAfastamento, $tipoAfastamento

''';
  }
}
