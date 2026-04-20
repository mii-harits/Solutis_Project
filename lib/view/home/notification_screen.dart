import 'package:flutter/material.dart';
import 'package:solutis_project/constant/app_color.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        title: Text("Notifikasi"),
        backgroundColor: AppColor.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 🔔 ICON
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  color: AppColor.teal.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Icon(
                  Icons.notifications_active_outlined,
                  size: 45,
                  color: AppColor.teal,
                ),
              ),

              SizedBox(height: 20),

              // 🔥 TITLE
              Text(
                "Fitur Notifikasi",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColor.teal,
                ),
              ),

              SizedBox(height: 8),

              // 📄 DESCRIPTION
              Text(
                "Fitur ini sedang dalam pengembangan.\n"
                "Nantinya kamu akan mendapatkan informasi penting seperti hasil analisis dan tips kesehatan secara real-time.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),

              SizedBox(height: 20),

              // 🚀 BADGE
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColor.teal.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Coming Soon 🚀",
                  style: TextStyle(
                    color: AppColor.teal,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
