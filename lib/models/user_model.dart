class UserModel {
  final String uid;
  final String email;
  final String username;
  final String phone;
  final String gender;
  final String address;
  final String dateOfBirth;
  final String imageProfile;

  // 🔥 TAMBAHAN HEALTH
  final double height;
  final double weight;
  final String bloodType;
  final String diseaseHistory;
  final String allergy;
  final String medicine;

  UserModel({
    required this.uid,
    required this.email,
    required this.username,
    this.phone = '',
    this.gender = '',
    this.address = '',
    this.dateOfBirth = '',
    this.imageProfile = '',

    // 🔥 DEFAULT VALUE
    this.height = 0,
    this.weight = 0,
    this.bloodType = '',
    this.diseaseHistory = '',
    this.allergy = '',
    this.medicine = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'username': username,
      'phone': phone,
      'gender': gender,
      'address': address,
      'dateOfBirth': dateOfBirth,
      'imageProfile': imageProfile,

      // 🔥 HEALTH
      'height': height,
      'weight': weight,
      'bloodType': bloodType,
      'diseaseHistory': diseaseHistory,
      'allergy': allergy,
      'medicine': medicine,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map, String documentId) {
    return UserModel(
      uid: documentId,
      email: map['email'] ?? '',
      username: map['username'] ?? '',
      phone: map['phone'] ?? '',
      gender: map['gender'] ?? '',
      address: map['address'] ?? '',
      dateOfBirth: map['dateOfBirth'] ?? '',
      imageProfile: map['imageProfile'] ?? '',

      // 🔥 FIX AMAN
      height: map['height'] != null ? (map['height'] as num).toDouble() : 0,

      weight: map['weight'] != null ? (map['weight'] as num).toDouble() : 0,

      bloodType: map['bloodType'] ?? '',
      diseaseHistory: map['diseaseHistory'] ?? '',
      allergy: map['allergy'] ?? '',
      medicine: map['medicine'] ?? '',
    );
  }

  double get bmi {
    if (height == 0 || weight == 0) return 0;

    final heightMeter = height / 100;
    return weight / (heightMeter * heightMeter);
  }

  String get bmiStatus {
    final value = bmi;

    if (value == 0) return "-";
    if (value < 18.5) return "Kurus";
    if (value < 25) return "Normal";
    if (value < 30) return "Gemuk";
    return "Obesitas";
  }
}
