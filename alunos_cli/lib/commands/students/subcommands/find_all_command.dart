import 'dart:io';

import 'package:args/command_runner.dart';
import '../../../repositories/student_repositoy.dart';

class FindAllCommand extends Command {
  final StudentRepositoy repositoy;

  @override
  String get description => 'Find all students';

  @override
  String get name => 'findAll';

  FindAllCommand(this.repositoy);

  @override
  Future<void> run() async {
    print('Aguarde Buscando Alunos...');
    final students = await repositoy.findAll();
    print('Apresentar tambem os curso (S ou N )');

    final showCourses = stdin.readLineSync();
    print('==' * 18);
    print('Alunos: ');
    print('==' * 18);
    for (var student in students) {
      if (showCourses?.toLowerCase() == 's') {
        print(
            '${student.id} - ${student.name} - ${student.courses.where((course) => course.isStudent).map((e) => e.name).toList()}');
      } else {
        print('${student.id} - ${student.name}');
      }
    }
  }
}
