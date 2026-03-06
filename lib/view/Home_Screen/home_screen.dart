import 'package:flutter/material.dart';
import 'package:solutis_project/constant/app_color.dart';
import 'package:solutis_project/utils/background.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundScreen(),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Selamat Datang,"),
                Row(
                  children: [
                    Text("Muhammad Harits"),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 5,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text("Bagaimana Kondisi Kesehatanmu Hari Ini?"),
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(children: [Container()]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
