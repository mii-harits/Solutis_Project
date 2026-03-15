import 'package:flutter/material.dart';
import 'package:solutis_project/constant/app_color.dart';

class BackgroundScreen extends StatelessWidget {
  const BackgroundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(decoration: BoxDecoration(color: AppColor.white)),
        Positioned(
          top: -290,
          left: -730,
          child: Container(
            width: 1000,
            height: 1000,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  AppColor.teal.withOpacity(0.7),
                  AppColor.teal.withOpacity(0.0),
                ],
              ),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: -290,
          right: -730,
          child: Container(
            width: 1000,
            height: 1000,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  AppColor.teal.withOpacity(0.7),
                  AppColor.teal.withOpacity(0.0),
                ],
              ),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
