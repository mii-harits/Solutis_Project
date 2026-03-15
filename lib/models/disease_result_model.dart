import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DiseaseResultModel {
  int? id;
  String complaint;
  String duration;
  String history;
  String additionalInfo;
  List<String> mainSymptoms;
  List<String> suggestions;
  String severity;
  DateTime createdAt;
  DiseaseResultModel({
    this.id,
    required this.complaint,
    required this.duration,
    required this.history,
    required this.additionalInfo,
    required this.mainSymptoms,
    required this.suggestions,
    required this.severity,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'complaint': complaint,
      'duration': duration,
      'history': history,
      'additionalInfo': additionalInfo,
      'mainSymptoms': jsonEncode(mainSymptoms),
      'suggestions': jsonEncode(suggestions),
      'severity': severity,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory DiseaseResultModel.fromMap(Map<String, dynamic> map) {
    return DiseaseResultModel(
      id: map['id'] != null ? map['id'] as int : null,
      complaint: map['complaint'] as String,
      duration: map['duration'] as String,
      history: map['history'] as String,
      additionalInfo: map['additionalInfo'] as String,
      mainSymptoms: List<String>.from(
        jsonDecode(map['mainSymptoms'] as String),
      ),
      suggestions: List<String>.from(jsonDecode(map['suggestions'] as String)),
      severity: map['severity'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory DiseaseResultModel.fromJson(String source) =>
      DiseaseResultModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
