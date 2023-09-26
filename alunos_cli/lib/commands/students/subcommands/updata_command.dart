import 'package:args/command_runner.dart';
import '../../../repositories/product_repository.dart';
import '../../../repositories/student_repositoy.dart';

class UpdataCommand extends Command {
  StudentRepositoy studentRepositoy;
  final productRepository = ProductRepository();

  @override
  String get description => 'Update Student';

  @override
  String get name => 'update';

  UpdataCommand(this.studentRepositoy) {
    argParser.addOption('file', help: 'Path of the csv file', abbr: 'f');
    argParser.addOption('id', help: 'Student ID', abbr: 'i');
  }

  @override
  void run() {}
}
