// ignore_for_file: public_member_api_docs, sort_constructors_first
class DiseaseResultModel {
  String? id;
  String complaint;
  String duration;
  String history;
  String additionalInfo;
  String diseaseName;
  double confidence;
  List<String> mainSymptoms;
  List<String> otherSymptoms;
  List<String> suggestions;
  String severity;
  DateTime createdAt;
  DiseaseResultModel({
    this.id,
    required this.complaint,
    required this.duration,
    required this.history,
    required this.additionalInfo,
    required this.diseaseName,
    required this.confidence,
    required this.mainSymptoms,
    required this.otherSymptoms,
    required this.suggestions,
    required this.severity,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'complaint': complaint,
      'duration': duration,
      'history': history,
      'additionalInfo': additionalInfo,
      'diseaseName': diseaseName,
      'confidence': confidence,
      'mainSymptoms': mainSymptoms,
      'otherSymptoms': otherSymptoms,
      'suggestions': suggestions,
      'severity': severity,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory DiseaseResultModel.fromMap(
    Map<String, dynamic> map,
    String documentId,
  ) {
    return DiseaseResultModel(
      id: documentId,
      complaint: map['complaint'] ?? '',
      duration: map['duration'] ?? '',
      history: map['history'] ?? '',
      additionalInfo: map['additionalInfo'] ?? '',
      diseaseName: map['diseaseName'] ?? '',
      confidence: (map['confidence'] ?? 0).toDouble(),
      mainSymptoms: List<String>.from(map['mainSymptoms'] ?? []),
      otherSymptoms: List<String>.from(map['otherSymptoms'] ?? []),
      suggestions: List<String>.from(map['suggestions'] ?? []),
      severity: map['severity'] ?? '',
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  DiseaseResultModel copyWith({
    String? id,
    String? complaint,
    String? duration,
    String? history,
    String? additionalInfo,
    String? diseaseName,
    double? confidence,
    List<String>? otherSymptoms,
    List<String>? mainSymptoms,
    List<String>? suggestions,
    String? severity,
    DateTime? createdAt,
  }) {
    return DiseaseResultModel(
      id: id ?? this.id,
      complaint: complaint ?? this.complaint,
      duration: duration ?? this.duration,
      history: history ?? this.history,
      additionalInfo: additionalInfo ?? this.additionalInfo,
      diseaseName: diseaseName ?? this.diseaseName,
      confidence: confidence ?? this.confidence,
      otherSymptoms: otherSymptoms ?? this.otherSymptoms,
      mainSymptoms: mainSymptoms ?? this.mainSymptoms,
      suggestions: suggestions ?? this.suggestions,
      severity: severity ?? this.severity,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
