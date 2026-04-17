import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:solutis_project/models/disease_model.dart';
import 'package:solutis_project/models/disease_result_model.dart';

class DiseaseService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // GET DISEASES
  static Future<List<DiseaseModel>> getDiseases() async {
    final snapshot = await _firestore.collection('diseases').get();

    return snapshot.docs.map((doc) {
      return DiseaseModel.fromMap(doc.data(), doc.id);
    }).toList();
  }

  // SAVE RESULT
  static Future<void> saveResult({
    required String userId,
    required DiseaseResultModel result,
  }) async {
    await _firestore.collection('history').add({
      'userId': userId,
      ...result.toMap(),
    });
  }

  // GET HISTORY
  static Future<List<DiseaseResultModel>> getHistory(String userId) async {
    final snapshot = await _firestore
        .collection('history')
        .where('userId', isEqualTo: userId)
        .get();

    return snapshot.docs.map((doc) {
      return DiseaseResultModel.fromMap(doc.data(), doc.id);
    }).toList();
  }

  // DELETE
  static Future<void> deleteResult(String id) async {
    await _firestore.collection('history').doc(id).delete();
  }
}
