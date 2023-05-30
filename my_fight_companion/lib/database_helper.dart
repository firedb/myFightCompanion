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
    String pathToDatabase = path.join(dbPath, 'testbase.db');

    return await openDatabase(pathToDatabase, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE testbase (id INTEGER PRIMARY KEY, notetitle TEXT, notecontent TEXT, date INTEGER)');
      await db.execute(
          'INSERT INTO testbase (notetitle, notecontent, date) VALUES("Title Here", "Your content here..", 01011980)');
          await db.execute(
          'INSERT INTO testbase (notetitle, notecontent, date) VALUES("2nd Title Here", "2nd Your content here..", 02021980)');
    });
  }

  Future<void> saveNote(String note) async {

    final db = await database;

var map = new Map()/{
      title:"placeholder title",
    };

    await db?.insert('testbase', <'notetitle': 'placeholder text'>);
  }

  Future<List<Map<String, dynamic>>?> getNotes() async {
    final db = await database;
    List<Map<String, dynamic>>? noteList = await db?.query('testbase');
    return noteList;
    //List<String> fetchedNotes =
    //    noteList!.map((note) => note['notecontent'] as String).toList();

    //return fetchedNotes;
  }

  // Implement other database operations as needed
}
