import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solutis_project/view/disease_analyst/first_analyst_screen.dart';
import 'package:solutis_project/constant/app_color.dart';
import 'package:solutis_project/extension/navigator.dart';
import 'package:solutis_project/widgets/box_decoration.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.onNavigate});
  final Function(int)? onNavigate;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isUmum = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Selamat Datang,",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Muhammad Harits!",
                            style: TextStyle(fontSize: 32),
                          ),
                          Text(
                            "Bagaimana Kondisi Kesehatanmu\nHari Ini?",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {
                            setState(() {});
                          },
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: AppColor.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.15),
                                  blurRadius: 5,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/Home Icon/Notification.svg",
                              width: 15,
                              height: 15,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // SizedBox(height: 15),

                // LayoutBuilder(
                //   builder: (context, constraints) {
                //     double width = constraints.maxWidth;

                //     return Container(
                //       width: 250,
                //       height: 40,
                //       decoration: BoxDecoration(
                //         color: AppColor.white,
                //         borderRadius: BorderRadius.circular(20),
                //         boxShadow: [
                //           BoxShadow(
                //             color: Colors.black.withOpacity(0.2),
                //             blurRadius: 5,
                //             offset: Offset(0, 4),
                //           ),
                //         ],
                //       ),
                //       child: Stack(
                //         children: [
                //           AnimatedAlign(
                //             duration: Duration(milliseconds: 250),
                //             curve: Curves.easeInOut,
                //             alignment: isUmum
                //                 ? Alignment.centerLeft
                //                 : Alignment.centerRight,
                //             child: Container(
                //               width: width / 3,
                //               margin: EdgeInsets.all(2.5),
                //               decoration: BoxDecoration(
                //                 gradient: LinearGradient(
                //                   colors: [
                //                     AppColor.teal.withOpacity(0.9),
                //                     AppColor.teal3.withOpacity(0.7),
                //                     AppColor.teal4.withOpacity(0.9),
                //                   ],
                //                   begin: Alignment(0, -1),
                //                   end: Alignment(0.2, 1),
                //                 ),
                //                 borderRadius: BorderRadius.circular(20),
                //               ),
                //             ),
                //           ),

                //           Row(
                //             children: [
                //               Expanded(
                //                 child: InkWell(
                //                   borderRadius: BorderRadius.circular(20),
                //                   onTap: () {
                //                     setState(() {
                //                       isUmum = true;
                //                     });
                //                   },
                //                   child: Center(
                //                     child: Text(
                //                       "Mode Umum",
                //                       style: TextStyle(
                //                         color: isUmum
                //                             ? Colors.white
                //                             : Colors.black,
                //                         fontWeight: isUmum
                //                             ? FontWeight.bold
                //                             : FontWeight.normal,
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //               Expanded(
                //                 child: InkWell(
                //                   borderRadius: BorderRadius.circular(20),
                //                   onTap: () {
                //                     setState(() {
                //                       isUmum = false;
                //                     });
                //                   },
                //                   child: Center(
                //                     child: Text(
                //                       "Mode Dokter",
                //                       style: TextStyle(
                //                         color: !isUmum
                //                             ? Colors.white
                //                             : Colors.black,
                //                         fontWeight: !isUmum
                //                             ? FontWeight.bold
                //                             : FontWeight.normal,
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ],
                //       ),
                //     );
                //   },
                // ),
                SizedBox(height: 20),

                InkWell(
                  onTap: () {
                    context.push(FirstAnalystScreen());
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                      right: 30,
                      left: 30,
                      top: 15,
                      bottom: 25,
                    ),
                    decoration: secondBoxDecorationConstant(
                      begin: Alignment(-0.2, -1),
                      end: Alignment(0.3, 1),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/Home Icon/Stethoscope.svg",
                                  ),

                                  SizedBox(width: 12),

                                  Text(
                                    "Pemeriksaan Kesehatan",
                                    style: TextStyle(
                                      color: AppColor.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 5),

                              Text(
                                "Cek Kesehatanmu Sekarang",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: AppColor.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 12),

                              Text(
                                "Periksa Gejala dan Saran\nKesehatan",
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 65,
                          width: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColor.white.withOpacity(0.1),
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.white.withOpacity(0.1),
                                blurRadius: 15,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/Home Icon/Heartbeat.svg",
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 30),

                Container(
                  padding: EdgeInsets.only(
                    right: 20,
                    left: 20,
                    top: 15,
                    bottom: 22,
                  ),
                  decoration: boxDecorationConstant(),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/Home Icon/History.svg",
                            height: 33,
                            width: 33,
                          ),

                          SizedBox(width: 8),

                          Text(
                            "Riwayat Terkini",
                            style: TextStyle(fontSize: 18),
                          ),

                          Spacer(),

                          TextButton(
                            onPressed: () {
                              widget.onNavigate?.call(2);
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size(0, 0),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              "Lihat Semua",
                              style: TextStyle(color: AppColor.teal),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColor.teal.withOpacity(0.04),
                        ),
                        child: ListTile(
                          leading: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppColor.lightBlue.withOpacity(0.7),
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/Home Icon/Heart.svg",
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          title: Text("Demam dan Sakit Kepala"),
                          subtitle: Text("2026-02-13"),
                        ),
                      ),

                      SizedBox(height: 10),

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColor.teal.withOpacity(0.04),
                        ),
                        child: ListTile(
                          leading: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppColor.lightBlue.withOpacity(0.7),
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/Home Icon/Medicine.svg",
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          title: Text("Demam dan Sakit Kepala"),
                          subtitle: Text("2026-02-13"),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30),

                Container(
                  padding: EdgeInsets.only(
                    right: 22,
                    left: 22,
                    top: 18,
                    bottom: 22,
                  ),
                  decoration: boxDecorationConstant(),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("assets/icons/Home Icon/Book.svg"),

                          SizedBox(width: 12),

                          Text(
                            "Edukasi Kesehatan",
                            style: TextStyle(fontSize: 18),
                          ),

                          Spacer(),

                          TextButton(
                            onPressed: () {
                              widget.onNavigate?.call(1);
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size(0, 0),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              "Jelajahi",
                              style: TextStyle(color: AppColor.teal),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 75,
                            width: 75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.lightBlueToGreen.withOpacity(
                                0.15,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/Home Icon/Heartbeat.svg",
                                  color: AppColor.teal,
                                  height: 25,
                                  width: 25,
                                ),
                                Text(
                                  "Lifestyle",
                                  style: TextStyle(fontSize: 11),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(width: 20),

                          Container(
                            height: 75,
                            width: 75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.blue2.withOpacity(0.15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/Home Icon/Heart.svg",
                                  color: AppColor.blue,
                                  height: 25,
                                  width: 25,
                                ),
                                Text(
                                  "Penyakit",
                                  style: TextStyle(fontSize: 11),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(width: 20),

                          Container(
                            height: 75,
                            width: 75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.purple.withOpacity(0.15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/Home Icon/Medicine.svg",
                                  color: AppColor.purple2,
                                  height: 25,
                                  width: 25,
                                ),
                                Text("Obat", style: TextStyle(fontSize: 11)),
                              ],
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
        ),
      ),
    );
  }
}
