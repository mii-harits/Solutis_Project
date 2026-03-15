import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solutis_project/view/disease_analyst/second_analyst_screen.dart';
import 'package:solutis_project/constant/app_color.dart';
import 'package:solutis_project/extension/navigator.dart';
import 'package:solutis_project/widgets/box_decoration.dart';

class FirstAnalystScreen extends StatefulWidget {
  const FirstAnalystScreen({super.key});

  @override
  State<FirstAnalystScreen> createState() => _FirstAnalystScreenState();
}

class _FirstAnalystScreenState extends State<FirstAnalystScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(CupertinoIcons.arrow_uturn_left, size: 30),
                    onPressed: () {
                      context.pop();
                    },
                  ),

                  SizedBox(width: 10),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cek Kesehatan",
                        style: TextStyle(fontSize: 22, color: AppColor.teal),
                      ),
                      Text(
                        "Langkah 1 dari 3",
                        style: TextStyle(color: AppColor.grey1),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 15),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.teal,
                      ),
                    ),
                  ),

                  SizedBox(width: 8),

                  Expanded(
                    child: Container(
                      height: 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.grey2.withOpacity(0.3),
                      ),
                    ),
                  ),

                  SizedBox(width: 8),

                  Expanded(
                    child: Container(
                      height: 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.grey2.withOpacity(0.3),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      ),
                      decoration: boxDecorationConstant(),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: AppColor.teal.withOpacity(0.25),
                                ),
                                child: SvgPicture.asset(
                                  "assets/icons/Home Icon/Stethoscope.svg",
                                  color: AppColor.teal,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              SizedBox(width: 10),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Gejala Yang Dirasakan",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Ceritakan keluhan Anda",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: AppColor.grey1,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          SizedBox(height: 15),

                          TextField(
                            decoration: InputDecoration(
                              hintText:
                                  "Contoh : Saya merasakan demam, batuk, dan pilek sejak kemarin....",
                              hintStyle: TextStyle(color: AppColor.grey2),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: AppColor.grey2.withOpacity(0.2),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: AppColor.grey2.withOpacity(0.2),
                                ),
                              ),
                              filled: true,
                              fillColor: AppColor.grey2.withOpacity(0.1),
                            ),
                            minLines: 5,
                            maxLines: null,
                          ),
                        ],
                      ),
                    ),

                    // SizedBox(height: 15),

                    // Text(
                    //   "Atau cari gejala umum",
                    //   style: TextStyle(fontSize: 16),
                    // ),

                    // SizedBox(height: 12),

                    // Container(
                    //   padding: EdgeInsets.symmetric(horizontal: 15),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(25),
                    //     color: AppColor.white,
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.black.withOpacity(0.2),
                    //         blurRadius: 4,
                    //         offset: Offset(0, 4),
                    //       ),
                    //     ],
                    //   ),
                    //   child: TextField(
                    //     decoration: InputDecoration(
                    //       hintText: "Cari Gejala Umum....",
                    //       hintStyle: TextStyle(color: AppColor.grey2),
                    //       prefixIcon: Icon(Icons.search, color: AppColor.grey2),
                    //       contentPadding: EdgeInsets.symmetric(vertical: 8),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(25),
                    //         borderSide: BorderSide.none,
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    // SizedBox(height: 22),

                    // Column(
                    //   children: [
                    //     Row(
                    //       children: [
                    //         Container(
                    //           padding: EdgeInsets.symmetric(
                    //             horizontal: 12,
                    //             vertical: 4,
                    //           ),
                    //           decoration: suggestBoxDecoration(),
                    //           child: Center(child: Text("Demam")),
                    //         ),

                    //         SizedBox(width: 12),

                    //         Container(
                    //           padding: EdgeInsets.symmetric(
                    //             horizontal: 12,
                    //             vertical: 4,
                    //           ),
                    //           decoration: suggestBoxDecoration(),
                    //           child: Center(child: Text("Pusing")),
                    //         ),

                    //         SizedBox(width: 12),

                    //         Container(
                    //           padding: EdgeInsets.symmetric(
                    //             horizontal: 12,
                    //             vertical: 4,
                    //           ),
                    //           decoration: suggestBoxDecoration(),
                    //           child: Center(child: Text("Nyeri otot")),
                    //         ),
                    //       ],
                    //     ),

                    //     SizedBox(height: 10),

                    //     Row(
                    //       children: [
                    //         Container(
                    //           padding: EdgeInsets.symmetric(
                    //             horizontal: 12,
                    //             vertical: 4,
                    //           ),
                    //           decoration: suggestBoxDecoration(),
                    //           child: Center(child: Text("Sesak Nafas")),
                    //         ),

                    //         SizedBox(width: 12),

                    //         Container(
                    //           padding: EdgeInsets.symmetric(
                    //             horizontal: 12,
                    //             vertical: 4,
                    //           ),
                    //           decoration: suggestBoxDecoration(),
                    //           child: Center(child: Text("Sakit Kepala")),
                    //         ),
                    //       ],
                    //     ),

                    //     SizedBox(height: 10),

                    //     Row(
                    //       children: [
                    //         Container(
                    //           padding: EdgeInsets.symmetric(
                    //             horizontal: 12,
                    //             vertical: 4,
                    //           ),
                    //           decoration: suggestBoxDecoration(),
                    //           child: Center(child: Text("Mual / Muntah")),
                    //         ),

                    //         SizedBox(width: 12),

                    //         Container(
                    //           padding: EdgeInsets.symmetric(
                    //             horizontal: 12,
                    //             vertical: 4,
                    //           ),
                    //           decoration: suggestBoxDecoration(),
                    //           child: Center(child: Text("Lemas")),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          decoration: secondBoxDecorationConstant(),
          child: ElevatedButton(
            onPressed: () {
              context.push(SecondAnalystScreen());
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
                  "Lanjutkan",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColor.white,
                  ),
                ),

                SizedBox(width: 6),

                Icon(Icons.arrow_forward_ios, color: AppColor.white, size: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
