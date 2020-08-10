//import 'dart:async';
//
//import 'package:base/models/profile/user_profile_result.dart';
//import 'package:sqflite/sqflite.dart';
//import 'package:path/path.dart';
//
//class DatabaseHelper {
//  static final DatabaseHelper _instance = new DatabaseHelper.internal();
//
//  factory DatabaseHelper() => _instance;
//
//  final String tableNote = 'userTable';
//  final String columnId = 'userId';
//  final String email = 'email';
//  final String userName = 'userName';
//
//  static Database _db;
//
//  DatabaseHelper.internal();
//
//  Future<Database> get db async {
//    if (_db != null) {
//      return _db;
//    }
//    _db = await initDb();
//
//    return _db;
//  }
//
//  initDb() async {
//    String databasesPath = await getDatabasesPath();
//    String path = join(databasesPath, 'users.db');
//
//    await deleteDatabase(path); // just for testing
//
//    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
//    return db;
//  }
//
//  void _onCreate(Database db, int newVersion) async {
//    await db.execute(
//        'CREATE TABLE $tableNote($columnId INTEGER PRIMARY KEY, $email TEXT, $userName TEXT)');
//  }
//
//  Future<int> saveNote(User user) async {
//    var dbClient = await db;
//    var result = await dbClient.insert(tableNote, user.toJson());
////    var result = await dbClient.rawInsert(
////        'INSERT INTO $tableNote ($columnTitle, $columnDescription) VALUES (\'${user.title}\', \'${user.description}\')');
//
//    return result;
//  }
//
//  Future<List> getAllNotes() async {
//    var dbClient = await db;
//    var result = await dbClient.query(tableNote, columns: [columnId, email, userName]);
////    var result = await dbClient.rawQuery('SELECT * FROM $tableNote');
//
//    return result.toList();
//  }
//
//  Future<int> getCount() async {
//    var dbClient = await db;
//    return Sqflite.firstIntValue(await dbClient.rawQuery('SELECT COUNT(*) FROM $tableNote'));
//  }
//
//  Future<Note> getNote(int id) async {
//    var dbClient = await db;
//    List<Map> result = await dbClient.query(tableNote,
//        columns: [columnId, email, userName],
//        where: '$columnId = ?',
//        whereArgs: [id]);
////    var result = await dbClient.rawQuery('SELECT * FROM $tableNote WHERE $columnId = $id');
//
//    if (result.length > 0) {
//      return new Note.fromMap(result.first);
//    }
//
//    return null;
//  }
//
//  Future<int> deleteNote(int id) async {
//    var dbClient = await db;
//    return await dbClient.delete(tableNote, where: '$columnId = ?', whereArgs: [id]);
////    return await dbClient.rawDelete('DELETE FROM $tableNote WHERE $columnId = $id');
//  }
//
//  Future<int> updateNote(Note user) async {
//    var dbClient = await db;
//    return await dbClient.update(tableNote, user.toMap(), where: "$columnId = ?", whereArgs: [user.id]);
////    return await dbClient.rawUpdate(
////        'UPDATE $tableNote SET $columnTitle = \'${user.title}\', $columnDescription = \'${user.description}\' WHERE $columnId = ${user.id}');
//  }
//
//  Future close() async {
//    var dbClient = await db;
//    return dbClient.close();
//  }
//}