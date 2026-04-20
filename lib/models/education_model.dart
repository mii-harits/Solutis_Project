import 'package:cloud_firestore/cloud_firestore.dart';

class EducationModel {
  final String id;
  final String category;
  final String imageUrl;
  final String title;
  final String description;

  EducationModel({
    required this.id,
    required this.category,
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'imageUrl': imageUrl,
      'title': title,
      'description': description,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }

  factory EducationModel.fromMap(Map<String, dynamic> map, String documentId) {
    return EducationModel(
      id: documentId,
      category: map['category'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
    );
  }
}
