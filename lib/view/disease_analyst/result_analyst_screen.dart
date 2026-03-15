import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solutis_project/constant/app_color.dart';
import 'package:solutis_project/extension/navigator.dart';
import 'package:solutis_project/widgets/box_decoration.dart';
import 'package:solutis_project/widgets/navigation_bar.dart';

class ResultAnalystScreen extends StatelessWidget {
  const ResultAnalystScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 25),
                  decoration: secondBoxDecorationConstant(
                    begin: Alignment(-0.2, -1),
                    end: Alignment(0.3, 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.white.withOpacity(0.3),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/History Icon/check-circle.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),

                      SizedBox(height: 10),

                      Text(
                        "Analisis Selesai",
                        style: TextStyle(
                          color: AppColor.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),

                      Text(
                        "Berikut hasil analisis gejala Anda",
                        style: TextStyle(color: AppColor.white, fontSize: 15),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  decoration: boxDecorationConstant(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/Analyst Icon/simple-line-icons_paper-clip.svg",
                            height: 25,
                            width: 25,
                          ),

                          SizedBox(width: 20),

                          Text(
                            "Hasil Analisis",
                            style: TextStyle(
                              color: AppColor.teal,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 12),

                      Text(
                        "Kemungkinan Kondisi:",
                        style: TextStyle(fontSize: 15),
                      ),

                      SizedBox(height: 12),

                      Text(
                        "Infeksi Saluran Pernapasan Atas atau Demam",
                        style: TextStyle(color: AppColor.grey2, fontSize: 15),
                      ),

                      Divider(color: Colors.black),

                      SizedBox(height: 12),

                      Text("Gejala Utama:", style: TextStyle(fontSize: 15)),

                      SizedBox(height: 12),

                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/Analyst Icon/warning.svg",
                            color: AppColor.warningColor,
                          ),

                          SizedBox(width: 6),

                          Text(
                            "Diare",
                            style: TextStyle(color: AppColor.grey2),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 22),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.indicationOrange.withOpacity(0.2),
                    border: Border.all(
                      color: AppColor.indicationOrange2.withOpacity(0.4),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.indicationOrange3.withOpacity(0.13),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/Analyst Icon/triangle_warning.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),

                      SizedBox(width: 14),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tingkat Keparahan: Sedang",
                              style: TextStyle(
                                color: AppColor.indicationOrange3,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Gejala yang kamu alami memerlukan perhatian lebih lanjut.",
                              style: TextStyle(
                                color: AppColor.indicationOrange2,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 22),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  decoration: boxDecorationConstant(),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/Analyst Icon/medic_tool.svg",
                          ),

                          SizedBox(width: 20),

                          Text(
                            "Saran Penanganan",
                            style: TextStyle(
                              color: AppColor.teal,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 12),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/Analyst Icon/full_circle_of_checklist.svg",
                            height: 22,
                            width: 22,
                          ),

                          SizedBox(width: 12),

                          Expanded(
                            child: Text(
                              "Istirahat yang cukup dan minum paracetamol jika demam",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/Analyst Icon/full_circle_of_checklist.svg",
                            height: 22,
                            width: 22,
                          ),

                          SizedBox(width: 12),

                          Expanded(
                            child: Text(
                              "Perbanyak minum air putih minimal 8 gelas sehari",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/Analyst Icon/full_circle_of_checklist.svg",
                            height: 22,
                            width: 22,
                          ),

                          SizedBox(width: 12),

                          Expanded(
                            child: Text(
                              "Konsultasi dokter jika gejala tidak membaik dalam 3 hari",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 22),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.realRed.withOpacity(0.1),
                    border: Border.all(
                      color: AppColor.realRed.withOpacity(0.4),
                    ),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/Analyst Icon/warning.svg",
                        fit: BoxFit.scaleDown,
                      ),

                      SizedBox(width: 14),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Penting untuk Diketahui",
                              style: TextStyle(
                                color: AppColor.warningColor2,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "Hasil ini adalah analisis awal. Untuk diagnosis yang akurat, sebaiknya konsultasi dengan dokter.",
                              style: TextStyle(
                                color: AppColor.indicationRed,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 22),

                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor.teal),
                          borderRadius: BorderRadius.circular(15),
                          color: AppColor.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 18,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "Ubah",
                            style: TextStyle(
                              color: AppColor.teal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 8),

                    Expanded(
                      child: InkWell(
                        onTap: () {
                          context.pushAndRemoveAll(
                            NavBarWidget(initialIndex: 2),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.teal),
                            borderRadius: BorderRadius.circular(15),
                            color: AppColor.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 18,
                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "Lihat Riwayat",
                              style: TextStyle(
                                color: AppColor.teal,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // SizedBox(height: 22),

                // InkWell(
                //   onTap: () {
                //     context.pushAndRemoveAll(NavBarWidget());
                //   },
                //   child: Container(
                //     width: double.infinity,
                //     padding: EdgeInsets.symmetric(vertical: 10),
                //     decoration: BoxDecoration(
                //       gradient: LinearGradient(
                //         colors: [
                //           AppColor.teal.withOpacity(0.9),
                //           AppColor.teal3.withOpacity(0.8),
                //           AppColor.teal4.withOpacity(0.9),
                //         ],
                //         begin: Alignment(0.17, -1),
                //         end: Alignment(0.19, 1),
                //       ),
                //       borderRadius: BorderRadius.circular(20),
                //     ),
                //     child: Center(
                //       child: Text(
                //         "Selesai",
                //         style: TextStyle(
                //           color: AppColor.white,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          decoration: secondBoxDecorationConstant(),
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Hasil analisis disimpan ke riwayat")),
              );
              context.push(NavBarWidget());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 0,
              padding: EdgeInsets.zero,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Selesai",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColor.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
