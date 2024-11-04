import 'package:consumo_api/modells/repository/AgendamentoRepository.dart';

Future<void> main() async {
  final agendamentoRepository = Agendamentorepository();

  final agendamentos = await agendamentoRepository.buscarTodos();

  print(agendamentos);
}
