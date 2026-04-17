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
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) {
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
                        Center(
                          child: Container(
                            width: 40,
                            height: 5,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),

                        SizedBox(height: 20),

                        Text(
                          "Tambah Edukasi",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 6),

                        Text(
                          "Tambahkan informasi kesehatan yang bermanfaat",
                          style: TextStyle(color: Colors.grey),
                        ),

                        SizedBox(height: 24),

                        // KATEGORI
                        _buildFieldLabel("Kategori"),
                        SizedBox(height: 8),
                        DropdownButtonFormField<String>(
                          value: selectedCategory,
                          decoration: _inputDecoration(icon: Icons.category),
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

                        SizedBox(height: 16),

                        // JUDUL
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

                        // DESKRIPSI
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

                        SizedBox(height: 30),

                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () => Navigator.pop(context),
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                child: Text("Batal"),
                              ),
                            ),

                            SizedBox(width: 12),

                            Expanded(
                              child: ElevatedButton(
                                onPressed: () async {
                                  await EducationController.addEducation(
                                    selectedCategory,
                                    titleController.text,
                                    descController.text,
                                  );

                                  titleController.clear();
                                  descController.clear();

                                  Navigator.pop(context);
                                  setState(() {});
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.teal,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                child: Text("Simpan"),
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

        child: Icon(Icons.add, color: AppColor.white),
      ),
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
