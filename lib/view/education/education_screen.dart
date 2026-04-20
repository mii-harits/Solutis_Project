import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:solutis_project/constant/app_color.dart';
import 'package:solutis_project/controller/education_controller.dart';
import 'package:solutis_project/extension/navigator.dart';
import 'package:solutis_project/service/education_service.dart';
import 'package:solutis_project/widgets/education_category_widget.dart';

class EducationScreen extends StatefulWidget {
  static String selectedFromHome = "lifestyle";

  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  int selectedIndex = 0;
  String selectedCategory = "lifestyle";
  String searchQuery = "";
  Timer? _debounce;
  File? selectedImage;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    selectedCategory = EducationScreen.selectedFromHome;

    switch (selectedCategory) {
      case "lifestyle":
        selectedIndex = 0;
        break;
      case "penyakit":
        selectedIndex = 1;
        break;
      case "obat":
        selectedIndex = 2;
        break;
    }
  }

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (picked != null) {
      selectedImage = File(picked.path);
    }
  }

  void resetForm() {
    titleController.clear();
    descController.clear();
    selectedImage = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 25, left: 25),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/Home Icon/Book.svg",
                          height: 35,
                          width: 35,
                        ),

                        SizedBox(width: 28),

                        Text(
                          "Edukasi Kesehatan",
                          style: TextStyle(fontSize: 22, color: AppColor.teal),
                        ),
                      ],
                    ),

                    SizedBox(height: 12),

                    Text(
                      "Wawasan lengkap untuk kendali kesehatan penuh. ✨",
                      style: TextStyle(fontSize: 16),
                    ),

                    SizedBox(height: 15),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColor.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: TextField(
                        onChanged: (value) {
                          if (_debounce?.isActive ?? false) _debounce!.cancel();

                          _debounce = Timer(Duration(milliseconds: 300), () {
                            setState(() {
                              searchQuery = value.toLowerCase();
                            });
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Cari Topik Kesehatanmu....",
                          hintStyle: TextStyle(color: AppColor.grey2),
                          prefixIcon: Icon(Icons.search, color: AppColor.grey2),
                          contentPadding: EdgeInsets.symmetric(vertical: 8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    LayoutBuilder(
                      builder: (context, constraints) {
                        double width = constraints.maxWidth;

                        return Container(
                          width: double.infinity,
                          height: 35,
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 5,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              AnimatedPositioned(
                                duration: Duration(milliseconds: 250),
                                curve: Curves.easeInOut,
                                left: (width / 3) * selectedIndex,
                                child: Container(
                                  width: width / 3,
                                  height: 35,
                                  padding: EdgeInsets.all(2.5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          AppColor.teal.withOpacity(0.9),
                                          AppColor.teal3.withOpacity(0.7),
                                          AppColor.teal4.withOpacity(0.9),
                                        ],
                                        begin: Alignment(0, -1),
                                        end: Alignment(0.2, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),

                              Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(20),
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = 0;
                                          selectedCategory = "lifestyle";
                                        });
                                      },
                                      child: Center(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              "assets/icons/Home Icon/Heartbeat.svg",
                                              height: 21,
                                              width: 21,
                                              color: selectedIndex == 0
                                                  ? AppColor.white
                                                  : AppColor.teal,
                                            ),

                                            SizedBox(width: 2),

                                            Text(
                                              "Gaya Hidup",
                                              style: TextStyle(
                                                color: selectedIndex == 0
                                                    ? AppColor.white
                                                    : Colors.black,
                                                fontWeight: selectedIndex == 0
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(20),
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = 1;
                                          selectedCategory = "penyakit";
                                        });
                                      },
                                      child: Center(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              "assets/icons/Home Icon/Heart.svg",
                                              height: 21,
                                              width: 21,
                                              color: selectedIndex == 1
                                                  ? AppColor.white
                                                  : AppColor.teal,
                                            ),

                                            SizedBox(width: 2),

                                            Text(
                                              "Penyakit",
                                              style: TextStyle(
                                                color: selectedIndex == 1
                                                    ? AppColor.white
                                                    : Colors.black,
                                                fontWeight: selectedIndex == 1
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(20),
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = 2;
                                          selectedCategory = "obat";
                                        });
                                      },
                                      child: Center(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              "assets/icons/Home Icon/Medicine.svg",
                                              height: 21,
                                              width: 21,
                                              color: selectedIndex == 2
                                                  ? AppColor.white
                                                  : AppColor.teal,
                                            ),

                                            SizedBox(width: 2),

                                            Text(
                                              "Obat",
                                              style: TextStyle(
                                                color: selectedIndex == 2
                                                    ? AppColor.white
                                                    : Colors.black,
                                                fontWeight: selectedIndex == 2
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                    SizedBox(height: 25),
                  ],
                ),
              ),

              Column(
                children: [
                  EducationCategoryWidget(
                    category: selectedCategory,
                    searchQuery: searchQuery,
                    title: selectedIndex == 0
                        ? "Gaya Hidup Sehat"
                        : selectedIndex == 1
                        ? "Informasi Penyakit"
                        : "Informasi Obat-obatan",
                    icon: "assets/icons/Education Icon/Stars.svg",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: addEducationFAB(context),
    );
  }

  FloatingActionButton addEducationFAB(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColor.teal,
      shape: CircleBorder(),
      elevation: 6,
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) {
            return StatefulBuilder(
              builder: (context, setModalState) {
                return DraggableScrollableSheet(
                  initialChildSize: 0.85,
                  minChildSize: 0.6,
                  maxChildSize: 0.95,
                  builder: (context, scrollController) {
                    return Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25),
                        ),
                      ),
                      child: ListView(
                        controller: scrollController,
                        children: [
                          // HANDLE
                          Center(
                            child: Container(
                              width: 60,
                              height: 6,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),

                          SizedBox(height: 20),

                          // HEADER
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: AppColor.teal.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.menu_book,
                                  color: AppColor.teal,
                                ),
                              ),
                              SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tambah Edukasi",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Isi informasi kesehatan",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          SizedBox(height: 25),

                          // ===== CARD FORM =====
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.2),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildFieldLabel("Kategori"),
                                SizedBox(height: 8),
                                DropdownButtonFormField<String>(
                                  value: selectedCategory,
                                  decoration: _inputDecoration(
                                    icon: Icons.category,
                                  ),
                                  items: [
                                    DropdownMenuItem(
                                      value: "lifestyle",
                                      child: Text("Gaya Hidup"),
                                    ),
                                    DropdownMenuItem(
                                      value: "penyakit",
                                      child: Text("Penyakit"),
                                    ),
                                    DropdownMenuItem(
                                      value: "obat",
                                      child: Text("Obat"),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      selectedCategory = value!;
                                    });
                                  },
                                ),

                                SizedBox(height: 16),

                                _buildFieldLabel("Judul"),
                                SizedBox(height: 8),
                                TextField(
                                  controller: titleController,
                                  decoration: _inputDecoration(
                                    icon: Icons.title,
                                    hint: "Contoh: Cara Menjaga Pola Tidur",
                                  ),
                                ),

                                SizedBox(height: 16),

                                _buildFieldLabel("Deskripsi"),
                                SizedBox(height: 8),
                                TextField(
                                  controller: descController,
                                  minLines: 4,
                                  maxLines: null,
                                  decoration: _inputDecoration(
                                    icon: Icons.description,
                                    hint: "Jelaskan secara detail...",
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 20),

                          // ===== IMAGE =====
                          _buildFieldLabel("Gambar"),
                          SizedBox(height: 8),

                          GestureDetector(
                            onTap: () async {
                              final picked = await ImagePicker().pickImage(
                                source: ImageSource.gallery,
                              );

                              if (picked != null) {
                                setModalState(() {
                                  selectedImage = File(picked.path);
                                });
                              }
                            },
                            child: Container(
                              height: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.grey[100],
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                              ),
                              child: selectedImage == null
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.image_outlined,
                                          size: 40,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          "Tap untuk memilih gambar",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.file(
                                        selectedImage!,
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                            ),
                          ),

                          SizedBox(height: 30),

                          // ===== BUTTON =====
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () async {
                                    // 🔥 CEK ADA ISI ATAU TIDAK
                                    if (titleController.text.isNotEmpty ||
                                        descController.text.isNotEmpty ||
                                        selectedImage != null) {
                                      final confirm = await showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              16,
                                            ),
                                          ),
                                          title: Text("Batalkan Perubahan?"),
                                          content: Text(
                                            "Data yang sudah kamu isi akan hilang. Yakin ingin keluar?",
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context, false),
                                              child: Text("Kembali"),
                                            ),
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context, true),
                                              child: Text(
                                                "Keluar",
                                                style: TextStyle(
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );

                                      if (confirm == true) {
                                        resetForm();
                                        context.pop();
                                      }
                                    } else {
                                      resetForm();
                                      context.pop();
                                    }
                                  },
                                  style: OutlinedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(vertical: 14),
                                    side: BorderSide(
                                      color: Colors.grey.shade400,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.close,
                                        size: 18,
                                        color: Colors.black,
                                      ),
                                      SizedBox(width: 6),
                                      Text(
                                        "Batal",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(width: 12),

                              Expanded(
                                child: ElevatedButton(
                                  onPressed: isLoading
                                      ? null
                                      : () async {
                                          // 🔥 VALIDASI WAJIB
                                          if (titleController.text
                                                  .trim()
                                                  .isEmpty ||
                                              descController.text
                                                  .trim()
                                                  .isEmpty ||
                                              selectedImage == null) {
                                            showDialog(
                                              context: context,
                                              builder: (_) => AlertDialog(
                                                title: Text(
                                                  "Data belum lengkap",
                                                ),
                                                content: Text(
                                                  "Semua field wajib diisi.",
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(context),
                                                    child: Text("OK"),
                                                  ),
                                                ],
                                              ),
                                            );
                                            return;
                                          }

                                          // 🔥 TRIGGER LOADING
                                          setModalState(() => isLoading = true);

                                          try {
                                            final imageUrl =
                                                await EducationService.uploadImage(
                                                  selectedImage!,
                                                );

                                            await EducationController.addEducation(
                                              selectedCategory,
                                              imageUrl,
                                              titleController.text,
                                              descController.text,
                                            );

                                            // reset form
                                            titleController.clear();
                                            descController.clear();
                                            selectedImage = null;

                                            if (mounted) {
                                              context.pop();
                                              setState(() {});
                                            }
                                          } catch (e) {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  "Terjadi kesalahan",
                                                ),
                                              ),
                                            );
                                          } finally {
                                            // 🔥 pastikan loading berhenti
                                            if (mounted) {
                                              setModalState(
                                                () => isLoading = false,
                                              );
                                            }
                                          }
                                        },

                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.teal,
                                    padding: EdgeInsets.symmetric(vertical: 14),
                                    elevation: 4,
                                    shadowColor: AppColor.teal.withOpacity(0.4),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                  ),

                                  // 🔥 LOADING YANG TERLIHAT JELAS
                                  child: AnimatedSwitcher(
                                    duration: Duration(milliseconds: 200),
                                    child: isLoading
                                        ? Row(
                                            key: ValueKey("loading"),
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 18,
                                                width: 18,
                                                child:
                                                    CircularProgressIndicator(
                                                      color: Colors.white,
                                                      strokeWidth: 2,
                                                    ),
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                "Menyimpan...",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          )
                                        : Row(
                                            key: ValueKey("text"),
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.save,
                                                size: 18,
                                                color: Colors.white,
                                              ),
                                              SizedBox(width: 6),
                                              Text(
                                                "Simpan",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            );
          },
        );
      },

      child: Icon(Icons.add, color: AppColor.white),
    );
  }

  Widget _buildFieldLabel(String text) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
    );
  }

  InputDecoration _inputDecoration({IconData? icon, String? hint}) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: icon != null ? Icon(icon) : null,
      filled: true,
      fillColor: Colors.grey[100],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
    );
  }
}
