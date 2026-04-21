import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:solutis_project/models/user_model.dart';

class FirebaseService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;

  static Future<UserModel> registerUser({
    required String email,
    required String password,
    required String username,
  }) async {
    final cred = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = cred.user!;
    final model = UserModel(uid: user.uid, email: email, username: username);

    await _firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .set(model.toMap());
    return model;
  }

  static Future<UserModel?> loginUser({
    required String email,
    required String password,
  }) async {
    final cred = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = cred.user;

    if (user == null) return null;

    final doc = await _firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .get();

    return UserModel.fromMap(doc.data()!, doc.id);
  }

  static Future<void> updateHealthData({
    required double height,
    required double weight,
    required String bloodType,
    required String diseaseHistory,
    required String allergy,
    required String medicine,
  }) async {
    final uid = _auth.currentUser!.uid;

    await _firebaseFirestore.collection('users').doc(uid).update({
      'height': height,
      'weight': weight,
      'bloodType': bloodType,
      'diseaseHistory': diseaseHistory,
      'allergy': allergy,
      'medicine': medicine,
    });
  }
}
