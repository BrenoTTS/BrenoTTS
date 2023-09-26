import 'package:args/command_runner.dart';

import '../../repositories/student_repositoy.dart';
import 'subcommands/find_all_command.dart';
import 'subcommands/find_by_id_command.dart';
import 'subcommands/insert_command.dart';
import 'subcommands/updata_command.dart';

class StudentsCommands extends Command {
  @override
  String get description => 'students operations';

  @override
  String get name => 'students';

  StudentsCommands() {
    final studentsRepository = StudentRepositoy();
    addSubcommand(FindAllCommand(studentsRepository));
    addSubcommand(FindByIdCommand(studentsRepository));
    addSubcommand(InsertCommand(studentsRepository));
    addSubcommand(UpdataCommand(studentsRepository));
  }
}
