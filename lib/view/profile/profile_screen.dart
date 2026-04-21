import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solutis_project/constant/app_color.dart';
import 'package:solutis_project/database/preference.dart';
import 'package:solutis_project/extension/navigator.dart';
import 'package:solutis_project/models/user_model.dart';
import 'package:solutis_project/service/google_auth_service.dart';
import 'package:solutis_project/view/profile/account_settings_screen.dart';
import 'package:solutis_project/view/profile/edit_profile_screen.dart';
import 'package:solutis_project/view/profile/health_form_screen.dart';
import 'package:solutis_project/view/profile/salutis_premium_screen.dart';
import 'package:solutis_project/view/profile/security_privacy_screen.dart';
import 'package:solutis_project/widgets/box_decoration.dart';
import 'package:solutis_project/view/auth/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserModel? userModel;
  bool isLoading = true;
  bool isOn = false;

  Color getBmiColor(double bmi) {
    if (bmi == 0) return Colors.grey;
    if (bmi < 18.5) return Colors.blue;
    if (bmi < 25) return Colors.green;
    if (bmi < 30) return Colors.orange;
    return Colors.red;
  }

  Future<void> getUserData() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get();

    if (doc.exists) {
      userModel = UserModel.fromMap(doc.data()!, doc.id);
    }

    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    final bmi = userModel?.bmi ?? 0;
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/Background Card Image/background abstract.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Positioned(
                  top: 50,
                  left: 25,
                  right: 25,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Profil Saya",
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Icon(Icons.settings, color: AppColor.white),
                    ],
                  ),
                ),
              ],
            ),

            Transform.translate(
              offset: Offset(0, -90),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: boxDecorationConstant(),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (userModel?.imageProfile != null &&
                                  userModel!.imageProfile.isNotEmpty) {
                                showDialog(
                                  context: context,
                                  builder: (_) => Dialog(
                                    backgroundColor: Colors.transparent,
                                    child: InteractiveViewer(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          userModel!.imageProfile,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient:
                                    userModel?.imageProfile.isEmpty ?? true
                                    ? LinearGradient(
                                        colors: [
                                          AppColor.teal.withOpacity(0.8),
                                          AppColor.teal3.withOpacity(0.6),
                                          AppColor.teal4.withOpacity(0.8),
                                        ],
                                      )
                                    : null,
                              ),
                              child: ClipOval(
                                child:
                                    userModel?.imageProfile != null &&
                                        userModel!.imageProfile.isNotEmpty
                                    ? Image.network(
                                        userModel!.imageProfile,
                                        fit: BoxFit.cover,

                                        // 🔥 LOADING
                                        loadingBuilder:
                                            (context, child, progress) {
                                              if (progress == null)
                                                return child;

                                              return Center(
                                                child: SizedBox(
                                                  width: 20,
                                                  height: 20,
                                                  child:
                                                      CircularProgressIndicator(
                                                        strokeWidth: 2,
                                                      ),
                                                ),
                                              );
                                            },

                                        // 🔥 ERROR HANDLING
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                              return Icon(
                                                Icons.person,
                                                color: AppColor.teal,
                                              );
                                            },
                                      )
                                    : SvgPicture.asset(
                                        "assets/icons/Profile Icon/Profile Person.svg",
                                        fit: BoxFit.scaleDown,
                                      ),
                              ),
                            ),
                          ),

                          SizedBox(width: 15),
                          isLoading
                              ? CircularProgressIndicator()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      userModel?.username ?? "Pengguna",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      userModel?.email ?? "-",
                                      style: TextStyle(
                                        color: AppColor.grey1,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                        ],
                      ),

                      SizedBox(height: 15),

                      InkWell(
                        onTap: () {
                          context.push(EditProfileScreen()).then((_) {
                            getUserData(); // reload data
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColor.grey2.withOpacity(0.08),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/Profile Icon/Edit.svg",
                              ),
                              SizedBox(width: 7),

                              Text(
                                "Edit Profil",
                                style: TextStyle(color: AppColor.teal),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 15),

            Transform.translate(
              offset: Offset(0, -90),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        context.push(HealthFormScreen()).then((_) {
                          getUserData(); // reload data
                        });
                      },

                      child: Container(
                        padding: EdgeInsets.only(
                          top: 12,
                          bottom: 24,
                          left: 22,
                          right: 22,
                        ),
                        decoration: boxDecorationConstant(),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/Profile Icon/Heartbeat in Love.svg",
                                  height: 35,
                                  width: 35,
                                ),

                                SizedBox(width: 10),

                                Text(
                                  "Informasi Kesehatan",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),

                            SizedBox(height: 12),

                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColor.greenHeight.withOpacity(
                                        0.15,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/icons/Profile Icon/Ruler.svg",
                                              height: 25,
                                              width: 25,
                                            ),

                                            SizedBox(width: 5),

                                            Text(
                                              "Tinggi",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),

                                        SizedBox(height: 3),

                                        Row(
                                          children: [
                                            Text(
                                              "${userModel?.height ?? 0}",
                                              style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),

                                            SizedBox(width: 3),

                                            Text(
                                              "cm",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(width: 8),

                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColor.blueHeight.withOpacity(
                                        0.15,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/icons/Profile Icon/Weight.svg",
                                              height: 25,
                                              width: 25,
                                            ),

                                            SizedBox(width: 5),

                                            Text(
                                              "Berat",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),

                                        SizedBox(height: 3),

                                        Row(
                                          children: [
                                            Text(
                                              "${userModel?.weight ?? 0}",
                                              style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),

                                            SizedBox(width: 3),

                                            Text(
                                              "kg",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 8),

                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColor.purpleHeight.withOpacity(
                                        0.15,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/icons/Home Icon/Heartbeat.svg",
                                              color: AppColor.purpleHeight2,
                                              height: 25,
                                              width: 25,
                                            ),

                                            SizedBox(width: 5),

                                            Text(
                                              "Berat",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),

                                        SizedBox(height: 3),

                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    userModel != null
                                                        ? userModel!.bmi
                                                              .toStringAsFixed(
                                                                1,
                                                              )
                                                        : "0",
                                                    style: TextStyle(
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: getBmiColor(bmi),
                                                    ),
                                                  ),

                                                  SizedBox(width: 5),

                                                  Text(
                                                    userModel?.bmiStatus ?? "-",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(width: 8),

                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColor.redHeight.withOpacity(
                                        0.15,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/icons/Profile Icon/Blood.svg",
                                              height: 25,
                                              width: 25,
                                            ),

                                            SizedBox(width: 5),

                                            Text(
                                              "Gol. Darah",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),

                                        SizedBox(height: 3),

                                        Row(
                                          children: [
                                            Text(
                                              userModel?.bloodType ?? "-",
                                              style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 8),

                            Container(
                              padding: EdgeInsets.symmetric(
                                // horizontal: 24,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColor.grey2.withOpacity(0.04),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 24,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Riwayat Penyakit",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: AppColor.teal,
                                          ),
                                        ),
                                        Text(
                                          userModel
                                                      ?.diseaseHistory
                                                      .isNotEmpty ==
                                                  true
                                              ? userModel!.diseaseHistory
                                              : "Tidak ada riwayat penyakit",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Divider(thickness: 2, color: AppColor.white),

                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 24,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Alergi",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: AppColor.teal,
                                          ),
                                        ),
                                        Text(
                                          userModel?.allergy.isNotEmpty == true
                                              ? userModel!.allergy
                                              : "Tidak ada alergi",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Divider(thickness: 2, color: AppColor.white),

                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 24,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Obat Rutin",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: AppColor.teal,
                                          ),
                                        ),
                                        Text(
                                          userModel?.medicine.isNotEmpty == true
                                              ? userModel!.medicine
                                              : "Tidak ada obat rutin",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 25),

                    Container(
                      padding: EdgeInsets.all(22.0),
                      decoration: boxDecorationConstant(),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/Profile Icon/Settings Icon.svg",
                                height: 35,
                                width: 35,
                              ),

                              SizedBox(width: 10),

                              Text(
                                "Pengaturan",
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),

                          SizedBox(height: 10),

                          InkWell(
                            onTap: () {
                              context.push(const AccountSettingsScreen());
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                top: 10,
                                bottom: 10,
                                left: 16,
                                right: 7,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColor.grey2.withOpacity(0.08),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/Profile Icon/Settings Icon.svg",
                                    color: AppColor.grey1,
                                    height: 27,
                                    width: 27,
                                  ),

                                  SizedBox(width: 10),

                                  Text(
                                    "Pengaturan Akun",
                                    style: TextStyle(color: AppColor.grey1),
                                  ),

                                  Spacer(),

                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: AppColor.grey2,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 8),

                          // Container(
                          //   padding: EdgeInsets.only(
                          //     top: 10,
                          //     bottom: 10,
                          //     left: 16,
                          //     right: 7,
                          //   ),
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(15),
                          //     color: AppColor.grey2.withOpacity(0.08),
                          //   ),
                          //   child: Row(
                          //     children: [
                          //       SvgPicture.asset(
                          //         isOn
                          //             ? "assets/icons/Profile Icon/Sun.svg"
                          //             : "assets/icons/Profile Icon/Moon.svg",
                          //         height: 27,
                          //         width: 27,
                          //       ),

                          //       SizedBox(width: 10),

                          //       Text(
                          //         isOn ? 'Mode Terang' : 'Mode Gelap',
                          //         style: TextStyle(color: AppColor.grey1),
                          //       ),

                          //       Spacer(),

                          //       SizedBox(
                          //         height: 26,
                          //         child: Transform.scale(
                          //           scale: 0.8,
                          //           child: Switch(
                          //             value: isOn,
                          //             activeColor: AppColor.grey1,
                          //             onChanged: (value) {
                          //               setState(() {
                          //                 isOn = value;
                          //               });
                          //             },
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),

                          // SizedBox(height: 8),
                          InkWell(
                            onTap: () {
                              context.push(const SecurityPrivacyScreen());
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                top: 10,
                                bottom: 10,
                                left: 16,
                                right: 7,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColor.grey2.withOpacity(0.08),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/Profile Icon/Shield.svg",
                                    height: 28,
                                    width: 28,
                                  ),

                                  SizedBox(width: 10),

                                  Text(
                                    "Keamanan dan Privasi",
                                    style: TextStyle(color: AppColor.grey1),
                                  ),

                                  Spacer(),

                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: AppColor.grey2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 25),

                    InkWell(
                      onTap: () {
                        context.push(const SalutisPremiumScreen());
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 16,
                          bottom: 16,
                          left: 24,
                          right: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [
                              AppColor.premiumColor,
                              AppColor.premiumColor2,
                              AppColor.premiumColor3,
                            ],
                            begin: Alignment(-0.029, -1),
                            end: Alignment(0.03, 1),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.premiumColor3.withOpacity(0.5),
                              blurRadius: 18,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.white.withOpacity(0.2),
                              ),
                              child: SvgPicture.asset(
                                "assets/icons/Profile Icon/Crown.svg",
                                fit: BoxFit.scaleDown,
                              ),
                            ),

                            SizedBox(width: 17),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Salutis Premium",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.white,
                                  ),
                                ),
                                Text(
                                  "Fitur lengkap tanpa batas",
                                  style: TextStyle(
                                    color: AppColor.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),

                            Spacer(),

                            Icon(
                              Icons.arrow_forward_ios,
                              color: AppColor.white,
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 25),

                    InkWell(
                      onTap: () async {
                        await AuthService.logout();

                        await PreferenceHandler().deleteIsLogin();

                        context.pushAndRemoveAll(LoginScreen());
                      },
                      child: Container(
                        padding: EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor.realRed, width: 1),
                          borderRadius: BorderRadius.circular(20),
                          color: AppColor.realRed.withOpacity(0.2),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.logout, color: AppColor.realRed2),
                            SizedBox(width: 8),
                            Text(
                              "Keluar",
                              style: TextStyle(
                                color: AppColor.realRed2,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
