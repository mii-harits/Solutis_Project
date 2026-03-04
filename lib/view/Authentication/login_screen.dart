import 'package:flutter/material.dart';
import 'package:solutis_project/constant/app_color.dart';
import 'package:solutis_project/utils/background.dart';
import 'package:solutis_project/utils/input_decoration.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundScreen(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/Logo/Salutis_logo_2.png",
                width: 125,
                height: 125,
              ),

              SizedBox(height: 20),

              Text(
                "Silahkan Login Untuk Mengakses Akunmu",
                style: TextStyle(fontSize: 15, color: Colors.black87),
              ),
              Container(
                padding: EdgeInsets.all(24.0),
                margin: EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.white),
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.white.withOpacity(0.2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email / Username",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),

                    SizedBox(height: 8),

                    TextFormField(
                      style: TextStyle(fontSize: 14),
                      decoration: decorationConstant(
                        hintText: "Masukkan Email / Username",
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: AppColor.grey1,
                        ),
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Password",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),

                    SizedBox(height: 8),

                    TextFormField(
                      style: TextStyle(fontSize: 14),
                      decoration: decorationConstant(
                        hintText: "Masukkan Password",
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: AppColor.grey1,
                        ),
                        suffixIcon: Icon(
                          Icons.visibility_outlined,
                          color: AppColor.grey1,
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Lupa Password?",
                          style: TextStyle(color: AppColor.teal),
                        ),
                      ),
                    ),

                    SizedBox(
                      width: double.infinity,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [
                              AppColor.teal2.withOpacity(1),
                              AppColor.teal2.withOpacity(0.6),
                              AppColor.teal2.withOpacity(1),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff16BEBE).withOpacity(0.4),
                              blurRadius: 5,
                              spreadRadius: 2,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                          onPressed: () {},
                          child: Stack(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  "Masuk",
                                  style: TextStyle(
                                    color: AppColor.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 12),

                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1.2,
                            color: AppColor.grey2,
                            indent: 10,
                            endIndent: 10,
                          ),
                        ),

                        Text(
                          "Atau Masuk Dengan",
                          style: TextStyle(color: AppColor.grey1),
                        ),

                        Expanded(
                          child: Divider(
                            thickness: 1.2,
                            color: AppColor.grey2,
                            indent: 10,
                            endIndent: 10,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 5),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              left: 5,
                              child: Image.asset(
                                "assets/images/Google/Google Logo.png",
                                width: 24,
                                height: 24,
                              ),
                            ),
                            Center(
                              child: Text(
                                "Masuk Dengan Google",
                                style: TextStyle(color: Colors.black87),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Belum Punya Akun? "),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(0, 0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      "Daftar",
                      style: TextStyle(color: AppColor.teal),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
