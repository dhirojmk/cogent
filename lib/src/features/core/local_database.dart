import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'community_app.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE posts (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            content TEXT NOT NULL,
            filePath TEXT,
            fileType TEXT,
            fileName TEXT
          )
        ''');
      },
    );
  }

  // Insert a new post
  Future<int> insertPost(Map<String, dynamic> post) async {
    final db = await database;
    return await db.insert('posts', post);
  }

  // Fetch all posts
  Future<List<Map<String, dynamic>>> fetchPosts() async {
    final db = await database;
    return await db.query('posts', orderBy: 'id DESC');
  }

  // Update a specific post by ID
  Future<int> updatePost(int id, Map<String, dynamic> updatedData) async {
    final db = await database;
    return await db.update('posts', updatedData, where: 'id = ?', whereArgs: [id]);
  }

  // Delete a specific post by ID
  Future<int> deletePost(int id) async {
    final db = await database;
    return await db.delete('posts', where: 'id = ?', whereArgs: [id]);
  }
}
