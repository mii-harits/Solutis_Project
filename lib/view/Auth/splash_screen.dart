import 'package:flutter/material.dart';
import 'package:solutis_project/constant/app_color.dart';
import 'package:solutis_project/database/preference.dart';
import 'package:solutis_project/extension/navigator.dart';
import 'package:solutis_project/widgets/navigation_bar.dart';
import 'package:solutis_project/view/Auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    autoLogin();
  }

  void autoLogin() async {
    await Future.delayed(Duration(seconds: 5));
    bool? data = await PreferenceHandler.getIsLogin();
    print(data);
    if (data == true) {
      context.pushAndRemoveAll(NavBarWidget());
    } else {
      context.pushAndRemoveAll(LoginScreen());
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // warna Background splash screen
          Container(
            decoration: BoxDecoration(color: AppColor.teal.withOpacity(0.3)),
          ),

          //circle yang berada di posisi ketiga
          Positioned(
            top: -200,
            left: -500,
            child: Container(
              width: 1000,
              height: 1000,
              decoration: BoxDecoration(
                color: AppColor.teal.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
            ),
          ),

          //circle yang berada di posisi kedua
          Positioned(
            top: -400,
            left: -550,
            child: Container(
              width: 1000,
              height: 1000,
              decoration: BoxDecoration(
                color: AppColor.teal.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            ),
          ),

          //circle yang berada di posisi pertama
          Positioned(
            top: -610,
            left: -630,
            child: Container(
              width: 1000,
              height: 1000,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [AppColor.teal, AppColor.teal.withOpacity(0.4)],
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),

          //circle yang berada di tengah untuk gambar logo
          Center(
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    AppColor.white.withOpacity(0.3),
                    AppColor.white.withOpacity(0.0),
                  ],
                ),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  "assets/images/Logo/Salutis_logo_3.png",
                  width: 300,
                  height: 300,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
