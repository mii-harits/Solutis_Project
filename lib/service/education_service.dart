import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:solutis_project/models/education_model.dart';

class EducationService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ADD
  static Future<void> addEducation({
    required String category,
    required String imageUrl,
    required String title,
    required String description,
  }) async {
    await _firestore.collection('education').add({
      'category': category,
      'imageUrl': imageUrl,
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
    required String imageUrl,
  }) async {
    await _firestore.collection('education').doc(id).update({
      'title': title,
      'description': description,
      'imageUrl': imageUrl, // 🔥 INI KUNCI
    });
  }

  // DELETE
  static Future<void> deleteEducation(String id) async {
    await _firestore.collection('education').doc(id).delete();
  }

  // UPLOAD IMAGE
  static Future<String> uploadImage(File imageFile) async {
    final fileName = DateTime.now().millisecondsSinceEpoch.toString();

    final ref = FirebaseStorage.instance.ref().child(
      'education_images/$fileName.jpg',
    );

    await ref.putFile(imageFile);

    return await ref.getDownloadURL();
  }
}
