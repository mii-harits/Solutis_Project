import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solutis_project/constant/app_color.dart';
import 'package:solutis_project/view/Education_Screen/lifestyle_category_screen.dart';
import 'package:solutis_project/view/Education_Screen/obat_category_screen.dart';
import 'package:solutis_project/view/Education_Screen/penyakit_category_screen.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  int selectedIndex = 0;

  final List<Widget> categoryScreen = [
    LifestyleCategoryScreen(),
    PenyakitCategoryScreen(),
    ObatCategoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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

                categoryScreen[selectedIndex],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
