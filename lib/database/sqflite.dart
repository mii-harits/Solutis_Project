import 'package:path/path.dart';
import 'package:solutis_project/models/disease_result_model.dart';
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
        await db.execute('''
          CREATE TABLE disease_results(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            complaint TEXT,
            duration TEXT,
            history TEXT,
            additionalInfo TEXT,
            mainSymptoms TEXT,
            suggestions TEXT,
            severity TEXT,
            createdAt INTEGER
          )
        ''');
      },
      version: 3,
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 3) {
          // upgrade database dari versi lama ke versi 3
          await db.execute('''
        CREATE TABLE disease_results(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          complaint TEXT,
          duration TEXT,
          history TEXT,
          additionalInfo TEXT,
          mainSymptoms TEXT,
          suggestions TEXT,
          severity TEXT,
          createdAt INTEGER
        )
      ''');
        }
      },
    );
  }

  static Future<void> registerUser(UserModel user) async {
    final dbs = await db();
    await dbs.insert('users', user.toMap());
  }

  // static Future<UserModel?> loginUser({
  //   required String email,
  //   required String password,
  // }) async {
  //   final dbs = await db();
  //   final List<Map<String, dynamic>> results = await dbs.query(
  //     "users",
  //     where: 'email = ? AND password = ?',
  //     whereArgs: [email, password],
  //   );
  //   if (results.isNotEmpty) {
  //     return UserModel.fromMap(results.first);
  //   }
  //   return null;
  // }

  // Education Session
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
      where: 'LOWER (category) = ?',
      whereArgs: [category],
    );

    print("DATA EDUCATION: $category");
    for (var d in data) {
      print("DATA CATEGORY: ${d['category']}");
    }
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

  // Analyse Disease Session
  // INSERT
  static Future<int> insertDiseaseResult(DiseaseResultModel result) async {
    final dbs = await db();
    return await dbs.insert('disease_results', result.toMap());
  }

  // GET ALL
  static Future<List<DiseaseResultModel>> getDiseaseResults() async {
    final dbs = await db();
    final List<Map<String, dynamic>> maps = await dbs.query(
      'disease_results',
      orderBy: 'createdAt DESC',
    );

    return maps.map((e) => DiseaseResultModel.fromMap(e)).toList();
  }

  // UPDATE
  static Future<int> updateDiseaseResult(DiseaseResultModel result) async {
    final dbs = await db();
    return await dbs.update(
      'disease_results',
      result.toMap(),
      where: 'id = ?',
      whereArgs: [result.id],
    );
  }

  // DELETE
  static Future<int> deleteDiseaseResult(int id) async {
    final dbs = await db();
    return await dbs.delete(
      'disease_results',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
