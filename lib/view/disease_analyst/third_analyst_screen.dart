import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solutis_project/constant/app_color.dart';
import 'package:solutis_project/controller/disease_controller.dart';
import 'package:solutis_project/extension/navigator.dart';
import 'package:solutis_project/models/disease_model.dart';
import 'package:solutis_project/models/disease_result_model.dart';
import 'package:solutis_project/service/disease_service.dart';
import 'package:solutis_project/widgets/box_decoration.dart';
import 'package:solutis_project/view/disease_analyst/result_analyst_screen.dart';

class ThirdAnalystScreen extends StatefulWidget {
  final DiseaseResultModel tempResult;
  const ThirdAnalystScreen({super.key, required this.tempResult});

  @override
  State<ThirdAnalystScreen> createState() => _ThirdAnalystScreenState();
}

class _ThirdAnalystScreenState extends State<ThirdAnalystScreen> {
  final TextEditingController additionalController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // isi field dengan data lama jika ada (untuk edit)
    additionalController.text = widget.tempResult.additionalInfo;

    fetchData(); // 🔥 tambahkan ini
  }

  void fetchData() async {
    final data = await DiseaseService.getDiseases();

    for (var d in data) {
      print("Disease: ${d.name}");
      print("Symptoms: ${d.symptoms}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(CupertinoIcons.arrow_uturn_left, size: 30),
                    onPressed: () {
                      context.pop();
                    },
                  ),

                  SizedBox(width: 10),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cek Kesehatan",
                        style: TextStyle(fontSize: 22, color: AppColor.teal),
                      ),
                      Text(
                        "Langkah 3 dari 3",
                        style: TextStyle(color: AppColor.grey1),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 15),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.teal,
                      ),
                    ),
                  ),

                  SizedBox(width: 8),

                  Expanded(
                    child: Container(
                      height: 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.teal,
                      ),
                    ),
                  ),

                  SizedBox(width: 8),

                  Expanded(
                    child: Container(
                      height: 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.teal,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      ),
                      decoration: boxDecorationConstant(),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: AppColor.warningColor.withOpacity(
                                    0.25,
                                  ),
                                ),
                                child: SvgPicture.asset(
                                  "assets/icons/Analyst Icon/warning.svg",
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              SizedBox(width: 10),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Kondisi Tambahan",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      "Informasi Tambahan mengenai kondisi saat ini",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColor.grey1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 15),

                          TextField(
                            controller: additionalController,
                            decoration: InputDecoration(
                              hintText:
                                  "Contoh : Panas Dingin saat malam hari, Tenggorokan terasa panas....",
                              hintStyle: TextStyle(color: AppColor.grey2),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: AppColor.grey2.withOpacity(0.2),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: AppColor.grey2.withOpacity(0.2),
                                ),
                              ),
                              filled: true,
                              fillColor: AppColor.grey2.withOpacity(0.1),
                            ),
                            minLines: 4,
                            maxLines: null,
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

      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          decoration: secondBoxDecorationConstant(),
          child: ElevatedButton(
            onPressed: () async {
              // 🔥 ambil data dari Firebase
              final diseases = await DiseaseService.getDiseases();

              final complaint = widget.tempResult.complaint.toLowerCase();

              // 🔥 cari yang paling cocok
              DiseaseModel? bestMatch;
              int highestScore = 0;

              for (var disease in diseases) {
                int score = disease.symptoms.where((s) {
                  return complaint.toLowerCase().contains(s.toLowerCase());
                }).length;

                if (score > highestScore) {
                  highestScore = score;
                  bestMatch = disease;
                }
              }

              String diseaseName;
              List<String> symptoms;
              List<String> suggestions;
              double confidence;

              // 🔥 HANDLE JIKA TIDAK DITEMUKAN
              if (bestMatch == null) {
                diseaseName = "Tidak diketahui";
                symptoms = [];
                suggestions = [
                  "Gejala tidak cukup jelas, silakan isi lebih detail atau konsultasi dokter",
                ];
                confidence = 0;
              } else {
                double percentage = highestScore / bestMatch.symptoms.length;

                diseaseName = bestMatch.name;
                symptoms = bestMatch.symptoms.where((s) {
                  return complaint.contains(s.toLowerCase());
                }).toList();
                suggestions = [bestMatch.solution];
                confidence = percentage;
              }

              String severity;

              if (confidence >= 0.7) {
                severity = "Berat";
              } else if (confidence >= 0.4) {
                severity = "Sedang";
              } else {
                severity = "Ringan";
              }

              final result = widget.tempResult.copyWith(
                diseaseName: diseaseName,
                mainSymptoms: symptoms,
                otherSymptoms: bestMatch == null
                    ? []
                    : bestMatch.symptoms.where((s) {
                        return !complaint.contains(s.toLowerCase());
                      }).toList(),
                suggestions: suggestions,
                severity: severity,
                confidence: confidence,
              );

              final controller = DiseaseController();
              await controller.addResult(result); // 🔥 SAVE DI SINI

              context.push(ResultAnalystScreen(result: result));
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
                Icon(
                  Icons.assignment_outlined,
                  color: AppColor.white,
                  size: 20,
                ),

                SizedBox(width: 6),

                Text(
                  "Lihat Hasil",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
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
