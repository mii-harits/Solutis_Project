import 'package:flutter/material.dart';
import 'package:solutis_project/constant/app_color.dart';

class SalutisPremiumScreen extends StatelessWidget {
  const SalutisPremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Salutis Premium"),
        centerTitle: true,
        backgroundColor: AppColor.teal,
      ),

      body: SingleChildScrollView(
        // 🔥 FIX OVERFLOW
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // 🔥 HEADER PREMIUM
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColor.premiumColor,
                    AppColor.premiumColor2,
                    AppColor.premiumColor3,
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: const [
                  Icon(Icons.workspace_premium, size: 50, color: Colors.white),
                  SizedBox(height: 10),
                  Text(
                    "Salutis Premium",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Upgrade pengalaman kesehatanmu 🚀",
                    style: TextStyle(color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔥 FITUR
            buildFeature(
              Icons.health_and_safety_outlined,
              "Analisis Kesehatan AI",
              "Insight otomatis dari data kesehatan",
            ),
            buildFeature(
              Icons.notifications_active_outlined,
              "Pengingat Pintar",
              "Notifikasi minum obat & cek kesehatan",
            ),
            buildFeature(
              Icons.insights_outlined,
              "Statistik Lengkap",
              "Pantau perkembangan kesehatan",
            ),
            buildFeature(
              Icons.lock_outline,
              "Privasi Maksimal",
              "Data terenkripsi & aman",
            ),

            const SizedBox(height: 20),

            // 🔥 STATUS
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: const [
                  Text(
                    "🚧 Sedang Dikembangkan",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Fitur premium akan segera hadir.\nStay tuned!",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // 🔥 BUTTON
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [AppColor.premiumColor, AppColor.premiumColor2],
                ),
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  "Segera Hadir",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget buildFeature(IconData icon, String title, String desc) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColor.teal),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 3),
                Text(desc, style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
