import 'package:solutis_project/service/education_service.dart';
import 'package:solutis_project/models/education_model.dart';

class EducationController {
  // ADD
  static Future<void> addEducation(
    String category,
    String imageUrl,
    String title,
    String description,
  ) async {
    await EducationService.addEducation(
      category: category,
      imageUrl: imageUrl,
      title: title,
      description: description,
    );
  }

  // GET
  static Future<List<EducationModel>> getEducations(String category) async {
    return await EducationService.getEducationByCategory(category);
  }

  // UPDATE
  static Future<void> updateEducation(
    String id,
    String title,
    String description,
    String imageUrl,
  ) async {
    await EducationService.updateEducation(
      id: id,
      title: title,
      description: description,
      imageUrl: imageUrl,
    );
  }

  // DELETE
  static Future<void> deleteEducation(String id) async {
    await EducationService.deleteEducation(id);
  }
}
