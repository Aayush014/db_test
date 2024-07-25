import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {

  static DataBaseHelper dataBaseHelper = DataBaseHelper._();
  DataBaseHelper._();

  Database? _database;

  Future <Database> get database async{
    return _database ?? await generateDataBase();
  }


  Future<Database> generateDataBase() async {
    String path = join(await getDatabasesPath(), "aayush.db");

    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) => db.execute(
        'CREATE TABLE Staff (Id INTEGER PRIMARY KEY AUTOINCREMENT, Name TEXT, age INTEGER, Subject TEXT)',
      ),
    );
    return database;
  }

  Future<void> addItem() async {
    Database db = await database;
    int id = await db.rawInsert(
      "INSERT INTO Staff (Name, age, Subject) VALUES ('Akhil Sodvadya', 24, 'Flutter')",
    );
  }
}
