import 'package:solutis_project/database/sqflite.dart';
import 'package:solutis_project/models/disease_result_model.dart';

class DiseaseController {
  Future<List<DiseaseResultModel>> getAllResults() async {
    return await DBHelper.getDiseaseResults();
  }

  Future<void> addResult(DiseaseResultModel result) async {
    await DBHelper.insertDiseaseResult(result);
  }

  Future<void> updateResult(DiseaseResultModel result) async {
    await DBHelper.updateDiseaseResult(result);
  }

  Future<void> deleteResult(int id) async {
    await DBHelper.deleteDiseaseResult(id);
  }
}
