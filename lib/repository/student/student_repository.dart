import 'package:student_registration/models/db_local.dart';
import 'package:student_registration/models/irepository.dart';
import 'package:student_registration/models/studen.dart';

abstract class StudentRepository implements IRepository<Student> {
  late DbLocal dbLocal;
}
