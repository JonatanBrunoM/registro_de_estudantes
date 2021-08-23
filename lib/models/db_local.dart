import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbLocal {
  final String table, dbName;

  DbLocal({
    required this.table,
    this.dbName = "banco.db",
  });

  Future<Database> getConnection() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, dbName);
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE $table (id PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, email TEXT NOT NULL)");
    });
  }
}
