import 'package:solutis_project/database/sqflite.dart';

class EducationController {
  static Future<void> addEducation(
    String category,
    String title,
    String description,
  ) async {
    await DBHelper.createEducation({
      'category': category,
      'title': title,
      'description': description,
    });
  }

  static Future<List<Map<String, dynamic>>> getEducations(
    String category,
  ) async {
    return await DBHelper.getEducation(category);
  }

  static Future<void> updateEducation(
    int id,
    String title,
    String description,
  ) async {
    await DBHelper.updateEducation(id, {
      'title': title,
      'description': description,
    });
  }

  static Future<void> deleteEducation(int id) async {
    await DBHelper.deleteEducation(id);
  }
}
