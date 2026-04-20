import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solutis_project/database/preference.dart';
import 'package:solutis_project/models/disease_result_model.dart';
import 'package:solutis_project/view/disease_analyst/first_analyst_screen.dart';
import 'package:solutis_project/constant/app_color.dart';
import 'package:solutis_project/extension/navigator.dart';
import 'package:solutis_project/view/disease_analyst/result_analyst_screen.dart';
import 'package:solutis_project/view/education/education_screen.dart';
import 'package:solutis_project/view/home/notification_screen.dart';
import 'package:solutis_project/widgets/box_decoration.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.onNavigate});
  final Function(int)? onNavigate;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isUmum = true;
  bool isLoadingHistory = true;
  String greeting = "Selamat Datang,";
  String username = "Pengguna";

  List<DiseaseResultModel> recentResults = [];

  @override
  void initState() {
    super.initState();
    loadGreeting();
    loadUsername();
    loadRecentHistory();
  }

  void loadGreeting() async {
    final hour = DateTime.now().hour;
    bool hasEverLogin = await PreferenceHandler.getHasEverLogin();

    print("hasEverLogin: $hasEverLogin");

    String result;

    if (!hasEverLogin) {
      result = "Selamat Datang,";
    } else if (hour >= 5 && hour < 11) {
      result = "Selamat Pagi,";
    } else if (hour >= 11 && hour < 15) {
      result = "Selamat Siang,";
    } else if (hour >= 15 && hour < 18) {
      result = "Selamat Sore,";
    } else {
      result = "Selamat Malam,";
    }

    setState(() {
      greeting = result;
    });
  }

  Future<void> loadUsername() async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) return;

      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (doc.exists && doc.data()!.containsKey('username')) {
        final name = doc['username'];

        setState(() {
          username = name.isNotEmpty ? name : "Pengguna";
        });
      } else {
        setState(() {
          username = "Pengguna";
        });
      }
    } catch (e) {
      print("Error ambil username: $e");
    }
  }

  Future<void> loadRecentHistory() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('history')
          .where('userId', isEqualTo: user.uid)
          .orderBy('createdAt', descending: true)
          .limit(2)
          .get();

      final data = snapshot.docs.map((doc) {
        return DiseaseResultModel.fromMap(doc.data(), doc.id);
      }).toList();

      setState(() {
        recentResults = data;
        isLoadingHistory = false; // ✅ selesai load
      });
    } catch (e) {
      print("ERROR: $e");
      setState(() {
        isLoadingHistory = false;
      });
    }
  }

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
                          Text(greeting, style: TextStyle(fontSize: 16)),
                          Text("$username!", style: TextStyle(fontSize: 32)),
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
                            setState(() {
                              context.push(NotificationScreen());
                            });
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

                      isLoadingHistory
                          ? Center(child: CircularProgressIndicator())
                          : recentResults.isEmpty
                          ? Text(
                              "Belum ada riwayat",
                              style: TextStyle(color: Colors.grey),
                            )
                          : Column(
                              children: recentResults.map((r) {
                                return Container(
                                  margin: EdgeInsets.only(bottom: 10),
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
                                        color: AppColor.lightBlue.withOpacity(
                                          0.7,
                                        ),
                                      ),
                                      child: SvgPicture.asset(
                                        "assets/icons/Home Icon/Heart.svg",
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                    title: Text(r.complaint),
                                    subtitle: Text(
                                      "${r.createdAt.day.toString().padLeft(2, '0')}-"
                                      "${r.createdAt.month.toString().padLeft(2, '0')}-"
                                      "${r.createdAt.year}",
                                    ),
                                    onTap: () {
                                      context.push(
                                        ResultAnalystScreen(
                                          result: r,
                                          fromHistory: true,
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }).toList(),
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
                          InkWell(
                            onTap: () {
                              EducationScreen.selectedFromHome = "lifestyle";
                              widget.onNavigate?.call(1);
                            },
                            child: Container(
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
                                    "Gaya Hidup",
                                    style: TextStyle(fontSize: 11),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(width: 20),

                          InkWell(
                            onTap: () {
                              EducationScreen.selectedFromHome = "penyakit";
                              widget.onNavigate?.call(1);
                            },
                            child: Container(
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
                          ),

                          SizedBox(width: 20),

                          InkWell(
                            onTap: () {
                              EducationScreen.selectedFromHome = "obat";
                              widget.onNavigate?.call(1);
                            },
                            child: Container(
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
