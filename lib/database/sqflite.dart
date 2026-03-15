import 'package:path/path.dart';
import 'package:solutis_project/models/user_model.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Future<Database> db() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'salutis.db'),
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT, password TEXT)',
        );
        await db.execute(
          'CREATE TABLE educations(id INTEGER PRIMARY KEY AUTOINCREMENT, category TEXT, title TEXT, description TEXT)',
        );
      },
      version: 2,
    );
  }

  static Future<void> registerUser(UserModel user) async {
    final dbs = await db();
    await dbs.insert('users', user.toMap());
  }

  static Future<UserModel?> loginUser({
    required String email,
    required String password,
  }) async {
    final dbs = await db();
    final List<Map<String, dynamic>> results = await dbs.query(
      "users",
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (results.isNotEmpty) {
      return UserModel.fromMap(results.first);
    }
    return null;
  }

  static Future<void> createEducation(Map<String, dynamic> data) async {
    final dbs = await db();

    await dbs.insert('educations', data);
  }

  static Future<List<Map<String, dynamic>>> getEducation(
    String category,
  ) async {
    final dbs = await db();

    final data = await dbs.query(
      'educations',
      where: 'category = ?',
      whereArgs: [category],
    );

    print("DATA EDUCATION:");
    print(data);

    return data;
  }

  static Future<int> updateEducation(int id, Map<String, dynamic> data) async {
    final dbs = await db();

    return await dbs.update(
      'educations',
      data,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<int> deleteEducation(int id) async {
    final dbs = await db();

    return await dbs.delete('educations', where: 'id = ?', whereArgs: [id]);
  }
}
