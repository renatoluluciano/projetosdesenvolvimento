// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:gerenciador_afastamentos/model/Usuario.dart';

class Agendamento {
  final int? idAgendamento;
  final String dataAgendamento;
  final String tipoAfastamento;
  final Usuario idUser;

  Agendamento({
    this.idAgendamento,
    required this.dataAgendamento,
    required this.tipoAfastamento,
    required this.idUser,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idAgendamento': idAgendamento,
      'dataAgendamento': dataAgendamento,
      'tipoAfastamento': tipoAfastamento,
      'idUser': idUser.toMap(),
    };
  }

  factory Agendamento.fromMap(Map<String, dynamic> map) {
    return Agendamento(
      idAgendamento:
          map['idAgendamento'] != null ? map['idAgendamento'] as int : null,
      dataAgendamento: map['dataAgendamento'] as String,
      tipoAfastamento: map['tipoAfastamento'] as String,
      idUser: Usuario.fromMap(map['idUser'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Agendamento.fromJson(String source) =>
      Agendamento.fromMap(json.decode(source) as Map<String, dynamic>);
}
