import 'package:sqflite/sqflite.dart';
import 'package:student_registration/models/studen.dart';
import 'package:student_registration/models/db_local.dart';
import 'package:student_registration/repository/student/student_repository.dart';

class StudentDBRepository implements StudentRepository {
  @override
  late DbLocal dbLocal;

  StudentDBRepository() {
    dbLocal = DbLocal(
      table: "students",
    );
  }

  @override
  Future<Student> find(int id) async {
    Database database = await dbLocal.getConnection();
    var data = await database.query(
      dbLocal.table,
      where: "id=",
      whereArgs: [id],
    );
    database.close();
    return Student.fromMap(data.first);
  }

  @override
  Future<int> insert(Student entity) {
    throw UnimplementedError();
  }

  @override
  Future<int> remove(
      {required String conditions, required List conditionValues}) {
    throw UnimplementedError();
  }

  @override
  Future<List<Student>> search() {
    throw UnimplementedError();
  }

  @override
  Future<int> update(
      {required Student entity,
      required String conditions,
      required List conditionValues}) {
    throw UnimplementedError();
  }
}
