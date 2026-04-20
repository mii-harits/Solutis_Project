import 'package:flutter/material.dart';
import 'package:solutis_project/constant/app_color.dart';
import 'package:solutis_project/database/preference.dart';
import 'package:solutis_project/extension/navigator.dart';
import 'package:solutis_project/service/firebase_service.dart';
import 'package:solutis_project/service/google_auth_service.dart';
import 'package:solutis_project/utils/snackbar_helper.dart';
import 'package:solutis_project/widgets/background.dart';
import 'package:solutis_project/widgets/input_decoration.dart';
import 'package:solutis_project/widgets/navigation_bar.dart';
import 'package:solutis_project/view/auth/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isVisibility = true;

  void visibilityOnOff() {
    isVisibility = !isVisibility;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          BackgroundScreen(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/Logo/Salutis_logo_2.png",
                width: 115,
                height: 115,
              ),

              SizedBox(height: 20),

              Text(
                "Silahkan Login Untuk Mengakses Akunmu",
                style: TextStyle(fontSize: 15, color: Colors.black87),
              ),
              Container(
                padding: EdgeInsets.all(24.0),
                margin: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.white),
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.white.withOpacity(0.2),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      SizedBox(height: 8),

                      TextFormField(
                        controller: emailController,
                        style: TextStyle(fontSize: 14),
                        decoration: decorationConstant(
                          hintText: "Masukkan Email",
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: AppColor.grey1,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email wajib diisi";
                          } else if (!value.contains("@")) {
                            return "Email tidak valid";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 10),

                      Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      SizedBox(height: 8),

                      TextFormField(
                        obscureText: isVisibility,
                        controller: passwordController,
                        style: TextStyle(fontSize: 14),
                        decoration: decorationConstant(
                          hintText: "Masukkan Password",
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: AppColor.grey1,
                          ),
                          suffixIcon: InkWell(
                            onTap: visibilityOnOff,
                            child: Icon(
                              !isVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                            ),
                          ),
                        ),
                        validator: (value) {
                          final password = value ?? "";
                          if (password.isEmpty) {
                            return 'Password wajib diisi';
                          }
                          return null;
                        },
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
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                try {
                                  final user = await FirebaseService.loginUser(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );

                                  if (user != null) {
                                    SnackBarHelper.show(
                                      context,
                                      message: "Login Berhasil",
                                    );

                                    /// 🔥 TAMBAHKAN INI
                                    await PreferenceHandler().storingIsLogin(
                                      true,
                                    );
                                    await PreferenceHandler.setHasEverLogin(
                                      true,
                                    );

                                    context.push(NavBarWidget());
                                  }
                                } catch (e) {
                                  SnackBarHelper.show(
                                    context,
                                    message:
                                        "Login gagal, Email atau Password salah",
                                    isError: true,
                                  );
                                }
                              }
                            },
                            child: Stack(
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

                      ElevatedButton(
                        onPressed: () async {
                          try {
                            final user = await AuthService.signInWithGoogle();

                            if (user != null) {
                              SnackBarHelper.show(
                                context,
                                message: "Login Berhasil",
                              );

                              print("Login berhasil: ${user.email}");
                              await PreferenceHandler().storingIsLogin(true);
                              await PreferenceHandler.setHasEverLogin(true);

                              context.pushAndRemoveAll(NavBarWidget());
                            } else {
                              /// 🔥 USER CANCEL LOGIN (beda dengan error)
                              SnackBarHelper.show(
                                context,
                                message: "Login dibatalkan",
                                isError: true,
                              );
                            }
                          } catch (e) {
                            /// 🔥 ERROR (misalnya jaringan / config / dll)
                            SnackBarHelper.show(
                              context,
                              message: "Login Google gagal, silakan coba lagi",
                              isError: true,
                            );

                            print("Google Login Error: $e");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 2,
                          minimumSize: const Size(double.infinity, 47),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/Google/Google Logo.png",
                              height: 24,
                            ),
                            const SizedBox(width: 12),
                            const Text(
                              "Masuk dengan Google",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Belum Punya Akun? "),
                  TextButton(
                    onPressed: () {
                      context.push(RegisterScreen());
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(0, 0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      "Daftar",
                      style: TextStyle(color: AppColor.teal2),
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
