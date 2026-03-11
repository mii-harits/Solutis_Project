import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solutis_project/constant/app_color.dart';
import 'package:solutis_project/utils/box_decoration.dart';

class PenyakitCategoryScreen extends StatelessWidget {
  const PenyakitCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              "assets/icons/Education Icon/Stars.svg",
              height: 33,
              width: 33,
            ),

            SizedBox(width: 14),

            Text("Informasi Penyakit", style: TextStyle(fontSize: 18)),
          ],
        ),

        SizedBox(height: 16),

        Container(
          padding: EdgeInsets.all(20.0),
          decoration: boxDecorationConstant(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                "assets/icons/Education Icon/Steshoscope colorful.svg",
                height: 45,
                width: 45,
              ),

              SizedBox(width: 20),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mengenal Diabetes Tipe 2",
                      style: TextStyle(fontSize: 17),
                    ),

                    SizedBox(height: 10),

                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Gejala, penyebab, dan cara pencegahan",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColor.grey2,
                            ),
                          ),
                        ),
                        Icon(Icons.arrow_forward, color: AppColor.teal),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 18),

        Container(
          padding: EdgeInsets.all(20.0),
          decoration: boxDecorationConstant(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                "assets/icons/Education Icon/Love.svg",
                height: 45,
                width: 45,
              ),

              SizedBox(width: 20),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hipertensi: Si Pembunuh Senyap",
                      style: TextStyle(fontSize: 17),
                    ),

                    SizedBox(height: 10),

                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Panduan lengkap mengatur jam tidur yang ideal",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColor.grey2,
                            ),
                          ),
                        ),
                        Icon(Icons.arrow_forward, color: AppColor.teal),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 18),

        Container(
          padding: EdgeInsets.all(20.0),
          decoration: boxDecorationConstant(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                "assets/icons/Education Icon/Blush.svg",
                height: 45,
                width: 45,
              ),

              SizedBox(width: 20),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Flu dan Cara Mengatasinya",
                      style: TextStyle(fontSize: 17),
                    ),

                    SizedBox(height: 10),

                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Panduan lengkap mengatasi influenza",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColor.grey2,
                            ),
                          ),
                        ),
                        Icon(Icons.arrow_forward, color: AppColor.teal),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
