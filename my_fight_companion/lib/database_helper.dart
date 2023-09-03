import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initializeDatabase();
    return _database;
  }

  DatabaseHelper.internal();

  Future<Database> initializeDatabase() async {
    // Initialize the database and return a reference to it
    // You can use the `path` parameter to specify the database file path
    // and other options as per your requirement

    String dbPath = await getDatabasesPath();
    String pathToDatabase = path.join(dbPath, 'newtestbase.db');

    return await openDatabase(pathToDatabase, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE newtestbase (id INTEGER PRIMARY KEY, notetitle TEXT, notecontent TEXT, date DATE)');
      await db.execute(
          'INSERT INTO newtestbase (notetitle, notecontent, date) VALUES("Title Here", "Your content here..", "2023-06-06")');
      await db.execute(
          'INSERT INTO newtestbase (notetitle, notecontent, date) VALUES("2nd Title Here", "2nd Your content here..", "2023-06-06")');
    });
  }

  Future<void> saveNote(String note) async {
    final db = await database;

    Map<String, Object?> mapExample = {
      "notetitle": "placeholder title",
      "notecontent": note,
      "date": DateTime.now().toString(),
    };

    await db?.insert('newtestbase', mapExample);
  }

  Future<List<Map<String, dynamic>>?> getNotes() async {
    final db = await database;
    List<Map<String, dynamic>>? noteList = await db?.query('newtestbase');
    return noteList;
    //List<String> fetchedNotes =
    //    noteList!.map((note) => note['notecontent'] as String).toList();

    //return fetchedNotes;
  }

  // Implement other database operations as needed
}
