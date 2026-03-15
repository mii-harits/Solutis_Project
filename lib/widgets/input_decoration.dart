import 'package:flutter/material.dart';
import 'package:solutis_project/constant/app_color.dart';

InputDecoration decorationConstant({
  required String hintText,
  Widget? suffixIcon,
  Widget? prefixIcon,
}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(color: AppColor.grey1, fontSize: 14),
    filled: true,
    fillColor: AppColor.white.withOpacity(0.4),
    isDense: true,
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: BorderSide(color: AppColor.white),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: BorderSide(color: AppColor.white),
    ),
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,

    suffixIconConstraints: BoxConstraints(minHeight: 20, minWidth: 40),
    prefixIconConstraints: BoxConstraints(minHeight: 20, minWidth: 40),
  );
}
