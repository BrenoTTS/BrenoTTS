import 'dart:io';
import 'package:args/command_runner.dart';
import '../../../models/address.dart';
import '../../../models/city.dart';
import '../../../models/phone.dart';
import '../../../models/students.dart';
import '../../../repositories/product_repository.dart';
import '../../../repositories/student_repositoy.dart';

class InsertCommand extends Command {
  final StudentRepositoy studentRepositoy;
  final ProductRepository productRepository;

  @override
  String get description => 'Insert student';

  InsertCommand(this.studentRepositoy)
      : productRepository = ProductRepository() {
    argParser.addOption('file', help: 'path of the csv file', abbr: 'f');
  }

  @override
  String get name => 'insert';

  @override
  Future<void> run() async {
    print('Aguarde ');
    final filePath = argResults?['file'];
    final students = File(filePath).readAsLinesSync();
    print('--' * 18);
    for (var student in students) {
      final studentData = student.split(';');
      final coursesCsv =
          studentData[2].split(',').map((e) => e.trim()).toList();

      final courseFutures = coursesCsv.map((c) async {
        final course = await productRepository.findByName(c);
        course.isStudent = true;
        return course;
      });

      final courses = await Future.wait(courseFutures);

      final studentModel = Students(
        name: studentData[0],
        age: int.tryParse(studentData[1]),
        nameCourses: coursesCsv,
        courses: courses,
        address: Address(
          street: studentData[3],
          number: int.parse(studentData[4]),
          zipCode: studentData[5],
          city: City(id: 1, name: studentData[6]),
          phone: Phone(ddd: int.parse(studentData[7]), phone: studentData[8]),
        ),
      );
      await studentRepositoy.insert(studentModel);
      print('Aluno Adicionado com sucesso!!');
      print('---' * 18);
    }
  }
}
