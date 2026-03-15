import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solutis_project/constant/app_color.dart';
import 'package:solutis_project/controller/education_controller.dart';
import 'package:solutis_project/extension/navigator.dart';
import 'package:solutis_project/widgets/education_category_widget.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  int selectedIndex = 0;
  String selectedCategory = "lifestyle";

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

                                            SizedBox(width: 8),

                                            Text(
                                              "Lifestyle",
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

                                            SizedBox(width: 8),

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

                                            SizedBox(width: 8),

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
                    category: selectedIndex == 0
                        ? "lifestyle"
                        : selectedIndex == 1
                        ? "penyakit"
                        : "obat",
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.teal,
        shape: CircleBorder(),
        elevation: 6,
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return FractionallySizedBox(
                heightFactor: 0.75,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Tambah Informasi Kesehatan",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 20),
                      Divider(thickness: 1),
                      SizedBox(height: 20),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kategory",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),

                            SizedBox(height: 10),

                            DropdownButtonFormField(
                              value: selectedCategory,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              items: [
                                DropdownMenuItem(
                                  value: "lifestyle",
                                  child: Text("Lifestyle"),
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

                            SizedBox(height: 14),

                            Text(
                              "Judul",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),

                            SizedBox(height: 10),

                            TextField(
                              controller: titleController,
                              decoration: InputDecoration(
                                hintText: "Masukkan Judul Edukasi...",
                                hintStyle: TextStyle(color: AppColor.grey2),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColor.grey2.withOpacity(0.7),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColor.grey2.withOpacity(0.7),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 14),

                            Text(
                              "Deskripsi",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),

                            SizedBox(height: 10),

                            TextField(
                              controller: descController,
                              minLines: 5,
                              maxLines: null,
                              decoration: InputDecoration(
                                hintText: "Masukkan Deskripsi Edukasi...",
                                hintStyle: TextStyle(color: AppColor.grey2),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColor.grey2.withOpacity(0.7),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColor.grey2.withOpacity(0.7),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 30),

                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.redHeight,
                                      foregroundColor: AppColor.white,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    onPressed: () async {
                                      // Cek apakah semua field kosong
                                      if (titleController.text.isEmpty &&
                                          descController.text.isEmpty) {
                                        Navigator.pop(
                                          context,
                                        ); // langsung tutup bottom sheet
                                      } else {
                                        // Ada isi → tampilkan konfirmasi
                                        final discard = await showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: Text("Buang Perubahan?"),
                                            content: Text(
                                              "Kamu telah memasukkan beberapa data. Apakah kamu ingin membuangnya?",
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                  context,
                                                  false,
                                                ),
                                                child: Text(
                                                  "Batal",
                                                ), // lanjutkan editing
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                  context,
                                                  true,
                                                ),
                                                child: Text(
                                                  "Ya",
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );

                                        if (discard == true)
                                          Navigator.pop(
                                            context,
                                          ); // tutup bottom sheet
                                      }
                                    },
                                    child: Text(
                                      "Batal",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(width: 12),

                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.teal,
                                      foregroundColor: AppColor.white,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    onPressed: () async {
                                      await EducationController.addEducation(
                                        selectedCategory,
                                        titleController.text,
                                        descController.text,
                                      );
                                      titleController.clear();
                                      descController.clear();

                                      setState(() {});
                                      context.pop(context);
                                    },
                                    child: Text(
                                      "Tambahkan",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add, color: AppColor.white),
      ),
    );
  }
}
