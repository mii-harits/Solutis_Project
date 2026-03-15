import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solutis_project/constant/app_color.dart';
import 'package:solutis_project/database/preference.dart';
import 'package:solutis_project/extension/navigator.dart';
import 'package:solutis_project/widgets/box_decoration.dart';
import 'package:solutis_project/view/Auth/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isOn = false;
  @override
  Widget build(BuildContext context) {
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

                Positioned(
                  bottom: -70,
                  left: 25,
                  right: 25,
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    decoration: boxDecorationConstant(),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [
                                    AppColor.teal.withOpacity(0.8),
                                    AppColor.teal3.withOpacity(0.6),
                                    AppColor.teal4.withOpacity(0.8),
                                  ],
                                  begin: Alignment(0, -1),
                                  end: Alignment(0, 1),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColor.teal3.withOpacity(0.3),
                                    blurRadius: 6,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: SvgPicture.asset(
                                "assets/icons/Profile Icon/Profile Person.svg",
                                fit: BoxFit.scaleDown,
                              ),
                            ),

                            SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Muhammad Harits",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "@muhammadharits",
                                  style: TextStyle(
                                    color: AppColor.grey1,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "emharits007@gmail.com",
                                  style: TextStyle(
                                    color: AppColor.grey1,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        SizedBox(height: 15),

                        Container(
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
                      ],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 90),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Column(
                children: [
                  Container(
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
                                  color: AppColor.greenHeight.withOpacity(0.15),
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
                                          "170",
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
                                  color: AppColor.blueHeight.withOpacity(0.15),
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
                                          "70",
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
                                          Text(
                                            "22.2",
                                            style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          SizedBox(width: 3),

                                          Text(
                                            "normal",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
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
                                  color: AppColor.redHeight.withOpacity(0.15),
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
                                          "A+",
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
                                padding: EdgeInsets.symmetric(horizontal: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Riwayat Penyakit",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: AppColor.teal,
                                      ),
                                    ),
                                    Text(
                                      "Tidak ada riwayat penyakit",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),

                              Divider(thickness: 2, color: AppColor.white),

                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Alergi",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: AppColor.teal,
                                      ),
                                    ),
                                    Text(
                                      "Tidak ada alergi bawaan",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),

                              Divider(thickness: 2, color: AppColor.white),

                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Obat Rutin",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: AppColor.teal,
                                      ),
                                    ),
                                    Text(
                                      "Tidak ada obat rutin",
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

                            Text("Pengaturan", style: TextStyle(fontSize: 18)),
                          ],
                        ),

                        SizedBox(height: 10),

                        Container(
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

                        SizedBox(height: 8),

                        Container(
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
                                isOn
                                    ? "assets/icons/Profile Icon/Sun.svg"
                                    : "assets/icons/Profile Icon/Moon.svg",
                                height: 27,
                                width: 27,
                              ),

                              SizedBox(width: 10),

                              Text(
                                isOn ? 'Mode Terang' : 'Mode Gelap',
                                style: TextStyle(color: AppColor.grey1),
                              ),

                              Spacer(),

                              SizedBox(
                                height: 26,
                                child: Transform.scale(
                                  scale: 0.8,
                                  child: Switch(
                                    value: isOn,
                                    activeColor: AppColor.grey1,
                                    onChanged: (value) {
                                      setState(() {
                                        isOn = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 8),

                        Container(
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
                      ],
                    ),
                  ),

                  SizedBox(height: 25),

                  Container(
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

                        Icon(Icons.arrow_forward_ios, color: AppColor.white),
                      ],
                    ),
                  ),

                  SizedBox(height: 25),

                  InkWell(
                    onTap: () {
                      PreferenceHandler().deleteIsLogin();
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
          ],
        ),
      ),
    );
  }
}
