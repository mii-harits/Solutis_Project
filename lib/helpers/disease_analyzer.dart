import 'disease_data.dart';
import 'package:solutis_project/models/disease_result_model.dart';

DiseaseResultModel analyzeDisease(DiseaseResultModel input) {
  final complaintLower = input.complaint.toLowerCase();

  for (var disease in diseasesData) {
    for (var keyword in disease['keywords']) {
      if (complaintLower.contains(keyword)) {
        input.mainSymptoms = List<String>.from(disease['mainSymptoms']);
        input.suggestions = List<String>.from(disease['suggestions']);
        input.severity = disease['severity'];
        return input;
      }
    }
  }

  // Jika tidak cocok dengan data penyakit
  input.mainSymptoms = ["Gejala tidak spesifik"];
  input.suggestions = ["Konsultasi ke dokter untuk pemeriksaan lebih lanjut"];
  input.severity = "Tidak diketahui";

  return input;
}
