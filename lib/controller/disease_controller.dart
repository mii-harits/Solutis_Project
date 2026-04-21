import 'package:firebase_auth/firebase_auth.dart';
import 'package:solutis_project/models/disease_result_model.dart';
import 'package:solutis_project/service/disease_service.dart';

class DiseaseController {
  final String userId = FirebaseAuth.instance.currentUser!.uid;

  // GET HISTORY
  Future<List<DiseaseResultModel>> getAllResults() async {
    return await DiseaseService.getHistory(userId);
  }

  // ADD (CREATE)
  Future<DiseaseResultModel> addResult(DiseaseResultModel result) async {
    final id = await DiseaseService.saveResult(userId: userId, result: result);

    return result.copyWith(id: id); // 🔥 inject ID ke object
  }

  // UPDATE 🔥
  Future<void> updateResult(DiseaseResultModel result) async {
    if (result.id == null) return;

    await DiseaseService.updateResult(id: result.id!, result: result);
  }

  // DELETE
  Future<void> deleteResult(String id) async {
    await DiseaseService.deleteResult(id);
  }
}
