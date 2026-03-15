import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solutis_project/constant/app_color.dart';
import 'package:solutis_project/widgets/box_decoration.dart';

class LifestyleCategoryScreen extends StatelessWidget {
  const LifestyleCategoryScreen({super.key});

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

            Text("Gaya Hidup Sehat", style: TextStyle(fontSize: 18)),
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
                "assets/icons/Education Icon/Sleep_zzz.svg",
                height: 45,
                width: 45,
              ),

              SizedBox(width: 20),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pola Tidur Sehat untuk Kualitas Hidup Lebih Baik",
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
                "assets/icons/Education Icon/Running_man.svg",
                height: 45,
                width: 45,
              ),

              SizedBox(width: 20),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Olahraga Ringan untuk Pemula",
                      style: TextStyle(fontSize: 17),
                    ),

                    SizedBox(height: 10),

                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Panduan lengkap olahraga ringan yang ideal",
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
                "assets/icons/Education Icon/Healthy_food.svg",
                height: 45,
                width: 45,
              ),

              SizedBox(width: 20),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nutrisi Seimbang untuk Tubuh Ideal",
                      style: TextStyle(fontSize: 17),
                    ),

                    SizedBox(height: 10),

                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Tips memilih makanan bergizi setiap hari",
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
