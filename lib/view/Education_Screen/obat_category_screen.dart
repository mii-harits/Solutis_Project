import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solutis_project/constant/app_color.dart';
import 'package:solutis_project/utils/box_decoration.dart';

class ObatCategoryScreen extends StatelessWidget {
  const ObatCategoryScreen({super.key});

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

            Text("Informasi Obat-obatan", style: TextStyle(fontSize: 18)),
          ],
        ),

        SizedBox(height: 16),

        Container(
          padding: EdgeInsets.all(20.0),
          decoration: boxDecorationConstant(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/icons/Education Icon/3d medicine.png",
                height: 45,
                width: 45,
              ),

              SizedBox(width: 20),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Panduan Penggunaan Antibiotik yang Benar",
                      style: TextStyle(fontSize: 17),
                    ),

                    SizedBox(height: 10),

                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Aturan minum antibiotik agar efektif",
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
              Image.asset(
                "assets/icons/Education Icon/Injection.png",
                height: 45,
                width: 45,
              ),

              SizedBox(width: 20),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Paracetamol: Kapan dan Bagaimana Menggunakannya",
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
              Image.asset(
                "assets/icons/Education Icon/Vitamin.png",
                height: 45,
                width: 45,
              ),

              SizedBox(width: 20),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Vitamin dan Suplemen: Perlu atau Tidak?",
                      style: TextStyle(fontSize: 17),
                    ),

                    SizedBox(height: 10),

                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Fakta tentang suplemen kesehatan",
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
