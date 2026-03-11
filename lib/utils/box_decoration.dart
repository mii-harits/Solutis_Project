import 'package:flutter/material.dart';
import 'package:solutis_project/constant/app_color.dart';

BoxDecoration boxDecorationConstant() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: AppColor.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 18,
        offset: Offset(0, 10),
      ),
    ],
  );
}

BoxDecoration secondBoxDecorationConstant({
  Alignment begin = Alignment.centerLeft,
  Alignment end = Alignment.centerRight,
}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    gradient: LinearGradient(
      colors: [
        AppColor.teal.withOpacity(0.9),
        AppColor.teal3.withOpacity(0.5),
        AppColor.teal4.withOpacity(0.9),
      ],
      begin: begin,
      end: end,
    ),
    boxShadow: [
      BoxShadow(
        color: AppColor.teal3.withOpacity(0.5),
        blurRadius: 10,
        offset: Offset(0, 5),
      ),
    ],
  );
}
