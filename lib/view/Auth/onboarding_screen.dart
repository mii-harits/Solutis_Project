import 'package:flutter/material.dart';
import 'package:solutis_project/constant/app_color.dart';
import 'package:solutis_project/database/preference.dart';
import 'package:solutis_project/extension/navigator.dart';
import 'package:solutis_project/view/auth/login_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  double _dragPosition = 0;
  bool _completed = false;

  Future<void> openLink() async {
    final Uri url = Uri.parse(
      "https://www.termsfeed.com/live/efd28e65-2809-410c-90a7-24ff6b054f39",
    );

    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication, // buka di browser luar
    )) {
      throw Exception("Tidak bisa membuka link");
    }
  }

  void _onDragUpdate(DragUpdateDetails details, double maxWidth) {
    setState(() {
      _dragPosition += details.delta.dx;
      _dragPosition = _dragPosition.clamp(0, maxWidth);
    });
  }

  void _onDragEnd(double maxWidth) async {
    if (_dragPosition > maxWidth * 0.7) {
      setState(() {
        _dragPosition = maxWidth;
        _completed = true;
      });

      Future.delayed(const Duration(seconds: 2), () async {
        if (!mounted) return;

        await PreferenceHandler.setHasEverLogin(true);
        context.pushAndRemoveAll(LoginScreen());
      });
    } else {
      setState(() {
        _dragPosition = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 40;

    return Scaffold(
      body: Stack(
        children: [
          /// 🔹 Background Image
          Positioned.fill(
            child: Image.network(
              "https://images.unsplash.com/photo-1584515933487-779824d29309",
              fit: BoxFit.cover,
            ),
          ),

          /// 🔹 Overlay biar lebih elegan
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.4)),
          ),

          /// 🔹 Content
          SafeArea(
            top: false,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/Logo/Salutis_for_onBoarding.png",
                  height: 170,
                ),

                const Spacer(),

                /// 🔹 Text Bottom
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Selamat Datang",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Mari mulai perjalanan kesehatan Anda bersama Salutis.\nCek kondisi tubuh, dapatkan rekomendasi, dan jaga kesehatan Anda setiap hari.",
                        // textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      const SizedBox(height: 20),

                      /// 🔹 Slider Button
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          color: Colors.white.withOpacity(0.15),
                          child: Stack(
                            children: [
                              /// 🔥 PROGRESS BACKGROUND (warna ikut geser)
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 100),
                                width: _dragPosition + 30,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.greenAccent.withOpacity(0.5),
                                      Colors.tealAccent.withOpacity(0.7),
                                    ],
                                  ),
                                ),
                              ),

                              /// TEXT
                              Center(
                                child: Text(
                                  _completed
                                      ? "Memulai..."
                                      : "Geser untuk Memulai",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),

                              /// DRAG BUTTON
                              Positioned(
                                left: _dragPosition,
                                child: GestureDetector(
                                  onHorizontalDragUpdate: (details) =>
                                      _onDragUpdate(details, width - 60),
                                  onHorizontalDragEnd: (_) =>
                                      _onDragEnd(width - 60),
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          blurRadius: 10,
                                        ),
                                      ],
                                    ),
                                    child: const Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppColor.teal,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// 🔹 Policy Text
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                          children: [
                            const TextSpan(
                              text:
                                  "Dengan melanjutkan, Anda menyetujui Syarat & Ketentuan serta ",
                            ),

                            /// 🔥 BAGIAN YANG BISA DIKLIK (DI TENGAH)
                            WidgetSpan(
                              child: GestureDetector(
                                onTap: openLink,
                                child: const Text(
                                  "Kebijakan Privasi",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),

                            const TextSpan(text: " kami."),
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
