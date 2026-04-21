import 'package:flutter/material.dart';
import 'package:solutis_project/constant/app_color.dart';

class SecurityPrivacyScreen extends StatelessWidget {
  const SecurityPrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Keamanan & Privasi"),
        centerTitle: true,
        backgroundColor: AppColor.teal,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // 🔥 CARD UTAMA
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Icon(Icons.security, size: 80, color: AppColor.teal),

                  const SizedBox(height: 16),

                  Text(
                    "Fitur Dalam Pengembangan",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.teal,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Mohon maaf, pengaturan keamanan & privasi belum tersedia saat ini.\nKami sedang menyiapkannya untuk Anda.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // 🔥 LIST PREVIEW FITUR (biar terlihat profesional)
            buildItem("Ubah Password", Icons.lock_outline),
            buildItem("Verifikasi Email", Icons.email_outlined),
            buildItem("Autentikasi 2 Langkah", Icons.verified_user_outlined),
            buildItem("Kelola Perangkat Login", Icons.devices),
            buildItem("Kebijakan Privasi", Icons.privacy_tip_outlined),

            const Spacer(),

            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 14,
                ),
              ),
              child: const Text(
                "Kembali",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem(String title, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.05),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColor.teal),
          const SizedBox(width: 10),
          Expanded(child: Text(title)),
          const Icon(Icons.lock, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}
