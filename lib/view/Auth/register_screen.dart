import 'package:flutter/material.dart';
import 'package:solutis_project/constant/app_color.dart';
import 'package:solutis_project/database/preference.dart';
import 'package:solutis_project/database/sqflite.dart';
import 'package:solutis_project/extension/navigator.dart';
import 'package:solutis_project/models/user_model.dart';
import 'package:solutis_project/widgets/background.dart';
import 'package:solutis_project/widgets/input_decoration.dart';
import 'package:solutis_project/widgets/navigation_bar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController konfirmasiPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isVisibility = true;
  bool _isVisibility = true;

  void visibilityOnOff() {
    isVisibility = !isVisibility;
    setState(() {});
  }

  void _visibilityOnOff() {
    _isVisibility = !_isVisibility;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          BackgroundScreen(),
          Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/Logo/Salutis_text_logo.png",
                  width: 100,
                  height: 50,
                ),

                Text(
                  "Buat Akun Baru",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),

                Text("Lengkapi Data Anda Untuk Melanjutkan"),

                SizedBox(height: 10),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                  decoration: BoxDecoration(
                    color: AppColor.white.withOpacity(0.2),
                    border: Border.all(color: AppColor.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nama Lengkap",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),

                        SizedBox(height: 8),

                        TextFormField(
                          controller: namaController,
                          style: TextStyle(fontSize: 14),
                          decoration: decorationConstant(
                            hintText: 'Masukkan Nama Lengkap',
                            prefixIcon: Icon(Icons.person_outline),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Nama Lengkap Tidak Boleh Kosong";
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 10),

                        Text(
                          "Email / Username",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),

                        SizedBox(height: 8),

                        TextFormField(
                          controller: emailController,
                          style: TextStyle(fontSize: 14),
                          decoration: decorationConstant(
                            hintText: 'Masukkan Email / Username',
                            prefixIcon: Icon(Icons.email_outlined),
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
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),

                        SizedBox(height: 8),

                        TextFormField(
                          obscureText: isVisibility,
                          controller: passwordController,
                          decoration: decorationConstant(
                            hintText: 'Masukkan Password',
                            prefixIcon: Icon(Icons.lock_outline),
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
                            final hasUppercase = RegExp(
                              r'[A-Z]',
                            ).hasMatch(password);
                            final hasLowercase = RegExp(
                              r'[a-z]',
                            ).hasMatch(password);
                            final hasNumber = RegExp(r'\d').hasMatch(password);
                            if (password.isEmpty) {
                              return 'Password wajib diisi';
                            }
                            if (password.length < 6) {
                              return 'Password minimal 6 karakter';
                            }
                            if (!hasUppercase) {
                              return "Password harus mengandung minimal 1 huruf besar";
                            }
                            if (!hasLowercase) {
                              return "Password harus mengandung minimal 1 huruf kecil";
                            }
                            if (!hasNumber) {
                              return "Password harus mengandung minimal 1 angka";
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 10),

                        Text(
                          "Konfirmasi Password",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),

                        SizedBox(height: 8),

                        TextFormField(
                          obscureText: _isVisibility,
                          controller: konfirmasiPasswordController,
                          decoration: decorationConstant(
                            hintText: 'Konfirmasi Password',
                            prefixIcon: Icon(Icons.lock_outline),
                            suffixIcon: InkWell(
                              onTap: _visibilityOnOff,
                              child: Icon(
                                !_isVisibility
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
                            if (value != passwordController.text) {
                              return 'Password harus sama';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 20),

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
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  PreferenceHandler().storingIsLogin(true);
                                  DBHelper.registerUser(
                                    UserModel(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    ),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Pendaftaran Berhasil"),
                                    ),
                                  );
                                  context.push(NavBarWidget());
                                }
                              },
                              child: Stack(
                                children: [
                                  Center(
                                    child: Text(
                                      "Registrasi",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.white,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppColor.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // SizedBox(height: 12),

                        // Row(
                        //   children: [
                        //     Expanded(
                        //       child: Divider(
                        //         thickness: 1.2,
                        //         color: AppColor.grey2,
                        //         // indent: 10,
                        //         endIndent: 10,
                        //       ),
                        //     ),

                        //     Text(
                        //       "Atau Masuk Dengan",
                        //       style: TextStyle(color: AppColor.grey1),
                        //     ),

                        //     Expanded(
                        //       child: Divider(
                        //         thickness: 1.2,
                        //         color: AppColor.grey2,
                        //         indent: 10,
                        //         // endIndent: 10,
                        //       ),
                        //     ),
                        //   ],
                        // ),

                        // SizedBox(height: 5),

                        // SizedBox(
                        //   width: double.infinity,
                        //   child: ElevatedButton(
                        //     onPressed: () {},
                        //     child: Stack(
                        //       children: [
                        //         Positioned(
                        //           left: 5,
                        //           child: Image.asset(
                        //             "assets/images/Google/Google Logo.png",
                        //             width: 22,
                        //             height: 22,
                        //           ),
                        //         ),
                        //         Center(
                        //           child: Text(
                        //             "Login Dengan Google",
                        //             style: TextStyle(color: Colors.black87),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Sudah Memiliki Akun? "),
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        "Masuk",
                        style: TextStyle(color: AppColor.teal2),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
