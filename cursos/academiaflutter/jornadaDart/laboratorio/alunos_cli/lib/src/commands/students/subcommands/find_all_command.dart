import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';

import '../../../../repository/studenty_repository.dart';

class FindAllCommand extends Command {
  final StudentyRepository studentyRepository;

  @override
  // TODO: implement description
  String get description => 'Find All Students';

  @override
  // TODO: implement name
  String get name => 'findAll';

  FindAllCommand(this.studentyRepository);

  @override
  Future<void> run() async {
    print("Aguarde Buscando Alunos...");

    final students = await studentyRepository.findByAll();

    print('Apresentar também os cursos? (S/N)');

    final showCourse = stdin.readLineSync();

    print('---------------------------------------------------------');
    print('Alunos: ');
    print('---------------------------------------------------------');

    for (var student in students) {
      if (showCourse?.toLowerCase() == 's') {
        print(
            '${student.id} - ${student.name} - ${student.courses.where((course) => course.isStudent).map((e) => e.name).toList()}');
      } else {
        print('${student.id} - ${student.name}');
      }
    }
  }
}
