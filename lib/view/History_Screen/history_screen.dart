import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solutis_project/constant/app_color.dart';
import 'package:solutis_project/utils/box_decoration.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
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
                      "assets/icons/NavBar Icon/History_Bar.svg",
                      color: AppColor.teal,
                      height: 45,
                      width: 45,
                    ),

                    SizedBox(width: 18),

                    Text(
                      "Riwayat Kesehatan",
                      style: TextStyle(fontSize: 22, color: AppColor.teal),
                    ),
                  ],
                ),

                SizedBox(height: 10),

                Text(
                  "Lihat rekam jejak kesehatan dan solusi yang kamu pelajari.📈",
                  style: TextStyle(fontSize: 16),
                ),

                SizedBox(height: 15),

                Container(
                  // height: 80,
                  // width: double.infinity,
                  padding: EdgeInsets.all(16.0),
                  decoration: secondBoxDecorationConstant(
                    begin: Alignment(-0.05, -1),
                    end: Alignment(0.09, 1),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Total Pemeriksaan\nKesehatan",
                        style: TextStyle(fontSize: 16, color: AppColor.white),
                      ),

                      Spacer(),

                      Text(
                        "3",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: AppColor.white,
                        ),
                      ),

                      Spacer(),

                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.white.withOpacity(0.4),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/History Icon/check-circle.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ],
                  ),
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
                      hintText: "Cari Riwayat Kesehatan....",
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

                SizedBox(height: 15),

                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: boxDecorationConstant(),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColor.realRed.withOpacity(0.32),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/History Icon/Heart Outline.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),

                      SizedBox(width: 15),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Demam & Sakit Kepala",
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/History Icon/Date.svg",
                                          color: AppColor.grey1,
                                          height: 11,
                                          width: 11,
                                        ),

                                        SizedBox(width: 10),

                                        Text(
                                          "13 Feb 2026",
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: AppColor.grey1,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/History Icon/Time.svg",
                                          color: AppColor.grey1,
                                          height: 11,
                                          width: 11,
                                        ),

                                        SizedBox(width: 10),

                                        Text(
                                          "09:15",
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: AppColor.grey1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            SizedBox(height: 5),

                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColor.green.withOpacity(0.15),
                                  ),
                                  child: Text(
                                    "Cek Kesehatan",
                                    style: TextStyle(
                                      color: AppColor.green2,
                                      fontSize: 11,
                                    ),
                                  ),
                                ),

                                SizedBox(width: 15),

                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColor.indicationGreen.withOpacity(
                                      0.15,
                                    ),
                                  ),
                                  child: Text(
                                    "Gejala Ringan",
                                    style: TextStyle(
                                      color: AppColor.indicationGreen2,
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 10),

                            Text(
                              "Demam ringan sejak 2 hari yang lalu",
                              style: TextStyle(color: AppColor.grey2),
                              softWrap: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 15),

                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: boxDecorationConstant(),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColor.realRed.withOpacity(0.32),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/History Icon/Heart Outline.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),

                      SizedBox(width: 15),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Demam & Sakit Kepala",
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/History Icon/Date.svg",
                                          color: AppColor.grey1,
                                          height: 11,
                                          width: 11,
                                        ),

                                        SizedBox(width: 10),

                                        Text(
                                          "13 Feb 2026",
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: AppColor.grey1,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/History Icon/Time.svg",
                                          color: AppColor.grey1,
                                          height: 11,
                                          width: 11,
                                        ),

                                        SizedBox(width: 10),

                                        Text(
                                          "09:15",
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: AppColor.grey1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            SizedBox(height: 5),

                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColor.green.withOpacity(0.15),
                                  ),
                                  child: Text(
                                    "Cek Kesehatan",
                                    style: TextStyle(
                                      color: AppColor.green2,
                                      fontSize: 11,
                                    ),
                                  ),
                                ),

                                SizedBox(width: 15),

                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColor.indicationOrange
                                        .withOpacity(0.15),
                                  ),
                                  child: Text(
                                    "Gejala Sedang",
                                    style: TextStyle(
                                      color: AppColor.indicationOrange2,
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 10),

                            Text(
                              "Demam ringan sejak 2 hari yang lalu",
                              style: TextStyle(color: AppColor.grey2),
                              softWrap: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 15),

                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: boxDecorationConstant(),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColor.realRed.withOpacity(0.32),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/History Icon/Heart Outline.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),

                      SizedBox(width: 15),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Demam & Sakit Kepala",
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/History Icon/Date.svg",
                                          color: AppColor.grey1,
                                          height: 11,
                                          width: 11,
                                        ),

                                        SizedBox(width: 10),

                                        Text(
                                          "13 Feb 2026",
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: AppColor.grey1,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/History Icon/Time.svg",
                                          color: AppColor.grey1,
                                          height: 11,
                                          width: 11,
                                        ),

                                        SizedBox(width: 10),

                                        Text(
                                          "09:15",
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: AppColor.grey1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            SizedBox(height: 5),

                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColor.green.withOpacity(0.15),
                                  ),
                                  child: Text(
                                    "Cek Kesehatan",
                                    style: TextStyle(
                                      color: AppColor.green2,
                                      fontSize: 11,
                                    ),
                                  ),
                                ),

                                SizedBox(width: 15),

                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColor.indicationRed.withOpacity(
                                      0.15,
                                    ),
                                  ),
                                  child: Text(
                                    "Gejala Ringan",
                                    style: TextStyle(
                                      color: AppColor.indicationRed2,
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 10),

                            Text(
                              "Demam ringan sejak 2 hari yang lalu",
                              style: TextStyle(color: AppColor.grey2),
                              softWrap: true,
                            ),
                          ],
                        ),
                      ),
                    ],
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
