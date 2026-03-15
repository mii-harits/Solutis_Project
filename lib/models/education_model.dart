import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class EducationModel {
  int? id;
  String category;
  String title;
  String description;
  EducationModel({
    this.id,
    required this.category,
    required this.title,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'category': category,
      'title': title,
      'description': description,
    };
  }

  factory EducationModel.fromMap(Map<String, dynamic> map) {
    return EducationModel(
      id: map['id'] != null ? map['id'] as int : null,
      category: map['category'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EducationModel.fromJson(String source) =>
      EducationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
