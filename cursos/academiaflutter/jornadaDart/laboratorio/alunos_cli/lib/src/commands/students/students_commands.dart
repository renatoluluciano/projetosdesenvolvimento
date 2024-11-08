import 'package:args/command_runner.dart';

import '../../../repository/studenty_repository.dart';
import 'subcommands/find_all_command.dart';

class StudentsCommand extends Command {
  @override
  String get description => 'Students Operations';

  @override
  String get name => 'students';

  StudentsCommand() {
    final studentyRepository = StudentyRepository();
    addSubcommand(FindAllCommand(studentyRepository));
  }
}
