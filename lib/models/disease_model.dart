class DiseaseModel {
  final String id;
  final String name;
  final List<String> symptoms;
  final String description;
  final String solution;

  DiseaseModel({
    required this.id,
    required this.name,
    required this.symptoms,
    required this.description,
    required this.solution,
  });

  factory DiseaseModel.fromMap(Map<String, dynamic> map, String documentId) {
    return DiseaseModel(
      id: documentId,
      name: map['name'] ?? '',
      symptoms: List<String>.from(map['symptoms'] ?? []),
      description: map['description'] ?? '',
      solution: map['solution'] ?? '',
    );
  }
}
