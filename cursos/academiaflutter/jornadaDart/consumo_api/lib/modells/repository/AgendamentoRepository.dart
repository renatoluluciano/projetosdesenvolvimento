import 'dart:convert';

import 'package:consumo_api/modells/Agendamento.dart';
import 'package:http/http.dart' as http;

class Agendamentorepository {
  String uriAgendamentoSpring = 'http://localhost:8080/listar';
  String uriAgendamentoJsonRest = 'http://localhost:3080/agendamentos';

  Future<List<Agendamento>> buscarTodos() async {
    final agendamentosResponse =
        await http.get(Uri.parse(uriAgendamentoSpring));

    //Converter os dados para um Modelo

    final agendamentosList = jsonDecode(agendamentosResponse.body);

    final todosAgendamentos =
        agendamentosList.map<Agendamento>((agendamentoMap) {
      return Agendamento.fromMap(agendamentoMap);
    }).toList();

    // return agendamentosList.
    //map<Agendamento>((agendamentoMap) => Agendamento.
    //fromMap(agendamentoMap)).toString();

    return todosAgendamentos;
  }

  Future<Agendamento> buscarId(int id) async {
    final agendamentosId =
        await http.get(Uri.parse('http://localhost:3080/agendamentos/$id'));

    return Agendamento.fromJson(agendamentosId.body);
  }
}
