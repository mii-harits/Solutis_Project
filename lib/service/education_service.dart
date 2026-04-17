import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:solutis_project/models/education_model.dart';

class EducationService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ADD
  static Future<void> addEducation({
    required String category,
    required String title,
    required String description,
  }) async {
    await _firestore.collection('education').add({
      'category': category,
      'title': title,
      'description': description,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  // GET BY CATEGORY
  static Future<List<EducationModel>> getEducationByCategory(
    String category,
  ) async {
    final snapshot = await _firestore
        .collection('education')
        .where('category', isEqualTo: category)
        .get();

    return snapshot.docs.map((doc) {
      return EducationModel.fromMap(doc.data(), doc.id);
    }).toList();
  }

  // UPDATE
  static Future<void> updateEducation({
    required String id,
    required String title,
    required String description,
  }) async {
    await _firestore.collection('education').doc(id).update({
      'title': title,
      'description': description,
    });
  }

  // DELETE
  static Future<void> deleteEducation(String id) async {
    await _firestore.collection('education').doc(id).delete();
  }
}
