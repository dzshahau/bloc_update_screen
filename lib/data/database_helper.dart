import 'dart:io';

import 'package:bloc_listener/data/topic.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

const dbVersion = 1;

class DatabaseHelper {
  DatabaseHelper._();

  static DatabaseHelper _instance = DatabaseHelper._();

  static DatabaseHelper get instance => _instance;

  static Database? _databaseInstance;

  Future<Database> get _database async =>
      _databaseInstance ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String path = join(directory.path, 'example_database.db');
    return openDatabase(
      path,
      version: dbVersion,
      onCreate: _onCreateDatabase,
    );
  }

  Future<void> _onCreateDatabase(Database db, int version) async {
    db.execute(
      "CREATE TABLE IF NOT EXISTS topics(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT UNIQUE, subtitle TEXT UNIQUE)",
    );
  }

  Future<List<Map<String, Object?>>> getTopics() async {
    final db = await instance._database;

    //final result = await db.rawQuery('SELECT * FROM topics WHERE title=?', ['title 1']);
    //final result = await db.query('topics', where: 'title=?', whereArgs: ['title 1 ']);
    // final result = await db.query('topics');
    return db.rawQuery('SELECT * FROM topics');
    //return result.
  }

  Future<int> addTopic(Topic topic) async {
    final db = await instance._database;
    return db.insert(
      'topics',
      {
        'title': topic.title,
        'subtitle': topic.subTitle,
      },
    );
  }

  Future<int> deleteTopic(int id) async {
    final db = await instance._database;
    return db.delete('topics', where: 'id=?', whereArgs: [id]);
    return db.rawDelete('DELETE FROM topics WHERE id=?', [id]);
  }
}
