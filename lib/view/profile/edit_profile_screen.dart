import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:solutis_project/constant/app_color.dart';
import 'package:solutis_project/extension/navigator.dart';
import 'package:solutis_project/models/user_model.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  UserModel? user;
  bool isLoading = true;
  bool isEdited = false;
  bool isUploading = false;
  File? imageFile;
  String initialName = '';
  String initialPhone = '';
  String initialAddress = '';
  String initialGender = '';
  String initialDob = '';
  String initialImage = '';

  String gender = '';
  String dateOfBirth = '';
  String imageUrl = '';

  // ================= GET DATA =================
  Future<void> getUserData() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get();

    if (doc.exists) {
      user = UserModel.fromMap(doc.data()!, doc.id);

      nameController.text = user!.username;
      emailController.text = user!.email;
      phoneController.text = user!.phone;
      addressController.text = user!.address;

      gender = user!.gender;
      dateOfBirth = user!.dateOfBirth;
      imageUrl = user!.imageProfile;
      initialName = user!.username;
      initialPhone = user!.phone;
      initialAddress = user!.address;
      initialGender = user!.gender;
      initialDob = user!.dateOfBirth;
      initialImage = user!.imageProfile;
    }

    isLoading = false;
    setState(() {
      isEdited = false;
      print("COMPARE:");
      print(nameController.text + " vs " + initialName);
    });
  }

  // ================= DETECT CHANGE =================
  void checkIfEdited() {
    final edited =
        nameController.text.trim() != initialName.trim() ||
        phoneController.text.trim() != initialPhone.trim() ||
        addressController.text.trim() != initialAddress.trim() ||
        gender != initialGender ||
        dateOfBirth != initialDob ||
        imageUrl != initialImage;

    if (edited != isEdited) {
      setState(() {
        isEdited = edited;
      });
    }
  }

  // ================= BACK VALIDATION =================
  Future<bool> onWillPop() async {
    if (!isEdited) return true;

    final result = await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text("Buang Perubahan?"),
        content: Text("Perubahan yang kamu lakukan belum disimpan."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text("Lanjut Edit"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text("Buang"),
          ),
        ],
      ),
    );

    return result ?? false;
  }

  Future<void> pickAndUploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return;

    File file = File(pickedFile.path);

    setState(() {
      imageFile = file;
      isUploading = true; // 🔥 mulai loading
    });

    final uid = FirebaseAuth.instance.currentUser!.uid;

    final ref = FirebaseStorage.instance
        .ref()
        .child('profile_images')
        .child('$uid.jpg');

    await ref.putFile(file);
    final url = await ref.getDownloadURL();

    setState(() {
      imageUrl = url; // 🔥 pastikan masuk state
      isUploading = false;
    });
    checkIfEdited();
  }

  @override
  void initState() {
    super.initState();
    getUserData();

    nameController.addListener(checkIfEdited);
    phoneController.addListener(checkIfEdited);
    addressController.addListener(checkIfEdited);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: AppColor.white,
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    // ================= HEADER =================
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(top: 60, bottom: 30),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [AppColor.teal, AppColor.teal3],
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: pickAndUploadImage,
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.white,
                                  backgroundImage: imageFile != null
                                      ? FileImage(imageFile!)
                                      : (imageUrl.isNotEmpty
                                                ? NetworkImage(imageUrl)
                                                : null)
                                            as ImageProvider?,
                                  child: isUploading
                                      ? CircularProgressIndicator(
                                          color: AppColor.teal,
                                        )
                                      : (imageUrl.isEmpty
                                            ? Icon(
                                                Icons.person,
                                                size: 40,
                                                color: AppColor.teal,
                                              )
                                            : null),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Edit Profil",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Kelola informasi pribadi Anda",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // 🔙 BACK BUTTON
                        Positioned(
                          top: 50,
                          left: 16,
                          child: GestureDetector(
                            onTap: () async {
                              final canPop = await onWillPop();
                              if (canPop) context.pop();
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // ================= FORM =================
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 15,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Informasi Pribadi",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: AppColor.teal,
                                  ),
                                ),
                                SizedBox(height: 15),

                                buildInput(
                                  "Nama lengkap",
                                  nameController,
                                  Icons.person_outline,
                                ),

                                buildInput(
                                  "Email",
                                  emailController,
                                  Icons.email_outlined,
                                  enabled: false,
                                ),

                                buildInput(
                                  "Nomor Telepon",
                                  phoneController,
                                  Icons.phone_outlined,
                                ),

                                buildDatePicker(),
                                buildGenderDropdown(),

                                buildInput(
                                  "Alamat",
                                  addressController,
                                  Icons.location_on_outlined,
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 25),

                          if (!isEdited)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    size: 16,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    "Ubah data terlebih dahulu untuk menyimpan",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          // ================= BUTTON =================
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: isEdited
                                  ? LinearGradient(
                                      colors: [AppColor.teal, AppColor.teal3],
                                    )
                                  : LinearGradient(
                                      colors: [
                                        Colors.grey.shade400,
                                        Colors.grey.shade300,
                                      ],
                                    ),
                            ),
                            child: Tooltip(
                              message: isEdited
                                  ? "Simpan perubahan"
                                  : "Tidak ada perubahan",
                              child: ElevatedButton(
                                onPressed: isEdited && !isUploading
                                    ? () async {
                                        final uid = FirebaseAuth
                                            .instance
                                            .currentUser!
                                            .uid;

                                        await FirebaseFirestore.instance
                                            .collection('users')
                                            .doc(uid)
                                            .update({
                                              'username': nameController.text,
                                              'phone': phoneController.text,
                                              'address': addressController.text,
                                              'gender': gender,
                                              'dateOfBirth': dateOfBirth,
                                              'imageProfile': imageUrl,
                                            });

                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              "Profile berhasil diupdate",
                                            ),
                                          ),
                                        );

                                        context.pop();
                                      }
                                    : null,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                ),
                                child: Text(
                                  "Simpan Perubahan",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  // ================= INPUT =================
  Widget buildInput(
    String label,
    TextEditingController controller,
    IconData icon, {
    bool enabled = true,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 14),
      child: TextField(
        controller: controller,
        enabled: enabled,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: AppColor.teal),
          filled: true,
          fillColor: Colors.grey.withOpacity(0.05),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  // ================= DATE =================
  Widget buildDatePicker() {
    return Padding(
      padding: EdgeInsets.only(bottom: 14),
      child: InkWell(
        onTap: () async {
          final picked = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            lastDate: DateTime.now(),
          );

          if (picked != null) {
            setState(() {
              dateOfBirth = picked.toString().split(" ")[0];
            });
            checkIfEdited();
          }
        },
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: "Tanggal Lahir",
            prefixIcon: Icon(Icons.calendar_today, color: AppColor.teal),
            filled: true,
            fillColor: Colors.grey.withOpacity(0.05),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
          ),
          child: Text(dateOfBirth.isEmpty ? "Select Date" : dateOfBirth),
        ),
      ),
    );
  }

  // ================= GENDER =================
  Widget buildGenderDropdown() {
    return Padding(
      padding: EdgeInsets.only(bottom: 14),
      child: DropdownButtonFormField<String>(
        value: gender.isEmpty ? null : gender,
        decoration: InputDecoration(
          labelText: "Jenis Kelamin",
          prefixIcon: Icon(Icons.person, color: AppColor.teal),
          filled: true,
          fillColor: Colors.grey.withOpacity(0.05),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
        items: [
          "Male",
          "Female",
        ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
        onChanged: (value) {
          setState(() {
            gender = value!;
          });
          checkIfEdited(); // ✅ TAMBAH INI
        },
      ),
    );
  }
}
