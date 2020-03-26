import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final movieTABLE = 'Movie';

class DatabaseProviderMovie {
  DatabaseProviderMovie._();

  static final DatabaseProviderMovie dbProvider =   DatabaseProviderMovie._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await createDatabase();
    return _database;
  }

  createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    //"ReactiveTodo.db is our database instance name
    String path = join(documentsDirectory.path, '$movieTABLE.db');
    var database = await openDatabase(path,
        version: 1, onOpen: (dbProvider) async{ },onCreate: initDB, onUpgrade: onUpgrade);
    return database;
  } //This is optional, and only used for changing DB schema migrations

  void onUpgrade(Database database, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {}
  }

  void initDB(Database database, int version) async {
//    await database.execute("CREATE TABLE $movieTABLE ("
//        "id INTEGER PRIMARY KEY, "
//        "poster_path TEXT, "
//        "adult TEXT, "
//        "overview TEXT, "
//        "release_date TEXT, "
//        "genre_ids TEXT, "
//        "idMovie INTEGER, "
//        "original_title TEXT, "
//        "original_language TEXT, "
//        "title TEXT, "
//        "backdrop_path TEXT, "
//        "popularity INTEGER, "
//        "vote_count INTEGER, "
//        "video TEXT, "
//        "vote_average INTEGER "
//        ")");
  }
}