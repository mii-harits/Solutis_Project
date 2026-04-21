import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solutis_project/constant/app_color.dart';
import 'package:solutis_project/controller/disease_controller.dart';
import 'package:solutis_project/extension/navigator.dart';
import 'package:solutis_project/models/disease_result_model.dart';
import 'package:solutis_project/view/disease_analyst/first_analyst_screen.dart';
import 'package:solutis_project/widgets/box_decoration.dart';
import 'package:solutis_project/widgets/navigation_bar.dart';

class ResultAnalystScreen extends StatelessWidget {
  final DiseaseResultModel result;
  final DiseaseController controller = DiseaseController();
  final bool fromHistory;
  ResultAnalystScreen({
    super.key,
    required this.result,
    this.fromHistory = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 25),
                  decoration: secondBoxDecorationConstant(
                    begin: Alignment(-0.2, -1),
                    end: Alignment(0.3, 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.white.withOpacity(0.3),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/History Icon/check-circle.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),

                      SizedBox(height: 10),

                      Text(
                        "Analisis Selesai",
                        style: TextStyle(
                          color: AppColor.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),

                      Text(
                        "Berikut hasil analisis gejala Anda",
                        style: TextStyle(color: AppColor.white, fontSize: 15),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  decoration: boxDecorationConstant(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/Analyst Icon/simple-line-icons_paper-clip.svg",
                            height: 25,
                            width: 25,
                          ),

                          SizedBox(width: 12),

                          Text(
                            "Hasil Analisis",
                            style: TextStyle(
                              color: AppColor.teal,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 12),

                      Text(
                        "Kemungkinan Kondisi:",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 12),

                      Text(
                        result.diseaseName.isEmpty
                            ? "Tidak diketahui"
                            : result.diseaseName,
                        style: TextStyle(fontSize: 15),
                      ),

                      if (result.diseaseName == "Tidak diketahui")
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            "Sistem tidak dapat mengenali penyakit dari gejala ini.",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),

                      SizedBox(height: 8),

                      Text(
                        "Tingkat keyakinan: ${(result.confidence * 100).toStringAsFixed(0)}%",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Divider(color: Colors.black),

                      SizedBox(height: 15),

                      Text(
                        "Gejala Utama:",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 12),

                      Column(
                        children: result.mainSymptoms
                            .map(
                              (symptom) => Row(
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    color: Colors.orange,
                                  ),
                                  SizedBox(width: 6),
                                  Text(symptom),
                                ],
                              ),
                            )
                            .toList(),
                      ),

                      SizedBox(height: 15),

                      Text(
                        "Gejala lain yang mungkin:",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 12),

                      Column(
                        children: result.otherSymptoms.isEmpty
                            ? [
                                Text(
                                  "Tidak ada gejala tambahan",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ]
                            : result.otherSymptoms
                                  .map(
                                    (symptom) => Row(
                                      children: [
                                        Icon(
                                          Icons.info_outline,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(width: 6),
                                        Text(symptom),
                                      ],
                                    ),
                                  )
                                  .toList(),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 22),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.indicationOrange.withOpacity(0.2),
                    border: Border.all(
                      color: AppColor.indicationOrange2.withOpacity(0.4),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.indicationOrange3.withOpacity(0.13),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/Analyst Icon/triangle_warning.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),

                      SizedBox(width: 14),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tingkat Keparahan: ${result.severity}",
                              style: TextStyle(
                                color: AppColor.indicationOrange3,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Gejala yang kamu alami memerlukan perhatian lebih lanjut.",
                              style: TextStyle(
                                color: AppColor.indicationOrange2,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 22),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  decoration: boxDecorationConstant(),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/Analyst Icon/medic_tool.svg",
                          ),

                          SizedBox(width: 20),

                          Text(
                            "Saran Penanganan",
                            style: TextStyle(
                              color: AppColor.teal,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 12),

                      Column(
                        children: result.suggestions
                            .map(
                              (s) => Row(
                                children: [
                                  Icon(
                                    Icons.check_circle_outline,
                                    size: 22,
                                    color: AppColor.teal,
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(child: Text(s)),
                                  SizedBox(width: 12),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 22),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.realRed.withOpacity(0.1),
                    border: Border.all(
                      color: AppColor.realRed.withOpacity(0.4),
                    ),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/Analyst Icon/warning.svg",
                        fit: BoxFit.scaleDown,
                      ),

                      SizedBox(width: 14),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Penting untuk Diketahui",
                              style: TextStyle(
                                color: AppColor.warningColor2,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "Hasil ini adalah analisis awal. Untuk diagnosis yang akurat, sebaiknya konsultasi dengan dokter.",
                              style: TextStyle(
                                color: AppColor.indicationRed,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 22),

                if (!fromHistory)
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            context.push(
                              FirstAnalystScreen(tempResult: result),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColor.teal),
                              borderRadius: BorderRadius.circular(15),
                              color: AppColor.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 18,
                                  offset: Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "Ubah",
                                style: TextStyle(
                                  color: AppColor.teal,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 8),

                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            DiseaseResultModel finalResult;

                            if (result.id == null) {
                              finalResult = await controller.addResult(
                                result,
                              ); // 🔥 ambil hasil + ID
                            } else {
                              await controller.updateResult(result);
                              finalResult = result;
                            }

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Hasil analisis disimpan ke riwayat",
                                ),
                              ),
                            );

                            context.pushAndRemoveAll(
                              NavBarWidget(initialIndex: 2),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColor.teal),
                              borderRadius: BorderRadius.circular(15),
                              color: AppColor.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 18,
                                  offset: Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "Lihat Riwayat",
                                style: TextStyle(
                                  color: AppColor.teal,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          decoration: secondBoxDecorationConstant(),
          child: ElevatedButton(
            onPressed: () async {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Hasil analisis disimpan ke riwayat")),
              );
              if (fromHistory) {
                context.pop(context); // <-- Kembali ke HistoryScreen
              } else {
                context.push(NavBarWidget(initialIndex: 0));
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 0,
              padding: EdgeInsets.zero,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Selesai",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColor.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
