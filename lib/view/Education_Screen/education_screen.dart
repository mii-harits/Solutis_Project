import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solutis_project/constant/app_color.dart';
import 'package:solutis_project/utils/input_decoration.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/Home Icon/Book.svg"),
                    SizedBox(width: 10),
                    Text("Edukasi Kesehatan"),
                  ],
                ),

                SizedBox(height: 10),

                Text("Wawasan lengkap untuk kendali kesehatan penuh. ✨"),

                SizedBox(height: 10),

                TextField(
                  decoration: decorationConstant(
                    hintText: "Cari Topik Kesehatan....",
                  ),
                ),

                SizedBox(height: 10),

                LayoutBuilder(
                  builder: (context, constraints) {
                    double width = constraints.maxWidth;

                    return Container(
                      width: double.infinity,
                      height: 40,
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
                              height: 40,
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
                              SizedBox(width: 10),

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
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/Home Icon/Heartbeat.svg",
                                        ),

                                        SizedBox(width: 8),

                                        Text(
                                          "Lifestyle",
                                          style: TextStyle(
                                            color: selectedIndex == 0
                                                ? Colors.white
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
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/Home Icon/Heart.svg",
                                        ),

                                        SizedBox(width: 8),

                                        Text(
                                          "Penyakit",
                                          style: TextStyle(
                                            color: selectedIndex == 1
                                                ? Colors.white
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
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/Home Icon/Medicine.svg",
                                        ),

                                        SizedBox(width: 8),

                                        Text(
                                          "Obat",
                                          style: TextStyle(
                                            color: selectedIndex == 2
                                                ? Colors.white
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
