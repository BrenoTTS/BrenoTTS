import 'package:alunos_cli/commands/students/students_commands.dart';
import 'package:args/command_runner.dart';

void main(List<String> arguments) {
  CommandRunner('Alunos cli', 'Alunos cli pelo terminal')
    ..addCommand(StudentsCommands())
    ..run(arguments);
}
