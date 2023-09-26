import 'package:args/command_runner.dart';

import '../../../repositories/student_repositoy.dart';

class FindByIdCommand extends Command {
  final StudentRepositoy repositoy;

  @override
  String get description => 'Find Students By id';

  FindByIdCommand(this.repositoy) {
    argParser.addOption('id', help: 'student id', abbr: 'i');
  }

  @override
  String get name => 'byId';

  @override
  Future<void> run() async {
    final id = int.tryParse(argResults?['id'] ?? '');

    if (id == null) {
      print(
          'por favor seu preto macaco envie o id do aluno com o comando --id=0 ou -i 0');
      return;
    }
    print('Aguarde Buscando Dados...');
    final student = await StudentRepositoy().findbyById(id);
    print('--' * 18);
    print('Aluno: ${student.name} ');
    print('--' * 18);
    print('Nome: ${student.name}');
    print('Idade: ${student.age ?? 'Não informado pela preta Macaca! '} ');
    print('Cursos:');
    student.nameCourses.forEach(print);
    print('Endereço');
    print('  ${student.address.street} - (${student.address.zipCode}) ');
  }
}
