import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solutis_project/constant/app_color.dart';
import 'package:solutis_project/controller/disease_controller.dart';
import 'package:solutis_project/extension/navigator.dart';
import 'package:solutis_project/models/disease_result_model.dart';
import 'package:solutis_project/view/disease_analyst/result_analyst_screen.dart';
import 'package:solutis_project/widgets/box_decoration.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final DiseaseController controller = DiseaseController();
  List<DiseaseResultModel> results = [];
  List<DiseaseResultModel> filteredResults = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadResults(); // load data saat pertama kali screen muncul
  }

  Future<void> loadResults() async {
    final data = await controller.getAllResults();
    setState(() {
      results = data;
      filteredResults = data; // awalnya filtered sama dengan semua data
    });
  }

  // Fungsi hapus riwayat berdasarkan id
  void deleteResult(String id) async {
    await controller.deleteResult(id);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Riwayat berhasil dihapus")));
    loadResults();
  }

  void searchResults(String query) {
    if (query.isEmpty) {
      setState(() => filteredResults = results);
    } else {
      setState(() {
        filteredResults = results
            .where(
              (r) => r.complaint.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/NavBar Icon/History_Bar.svg",
                      color: AppColor.teal,
                      height: 45,
                      width: 45,
                    ),

                    SizedBox(width: 18),

                    Text(
                      "Riwayat Kesehatan",
                      style: TextStyle(fontSize: 22, color: AppColor.teal),
                    ),
                  ],
                ),

                SizedBox(height: 10),

                Text(
                  "Lihat rekam jejak kesehatan dan solusi yang kamu pelajari.📈",
                  style: TextStyle(fontSize: 16),
                ),

                SizedBox(height: 15),

                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: secondBoxDecorationConstant(
                    begin: Alignment(-0.05, -1),
                    end: Alignment(0.09, 1),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Total Pemeriksaan\nKesehatan",
                        style: TextStyle(fontSize: 16, color: AppColor.white),
                      ),

                      Spacer(),

                      Text(
                        "${results.length}",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: AppColor.white,
                        ),
                      ),

                      Spacer(),

                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.white.withOpacity(0.4),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/History Icon/check-circle.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 15),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: AppColor.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: searchController,
                    onChanged: searchResults,
                    decoration: InputDecoration(
                      hintText: "Cari Riwayat Kesehatan....",
                      hintStyle: TextStyle(color: AppColor.grey2),
                      prefixIcon: Icon(Icons.search, color: AppColor.grey2),
                      contentPadding: EdgeInsets.symmetric(vertical: 8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15),

                // History List
                filteredResults.isEmpty
                    ? Text("Belum ada riwayat analisis")
                    : Column(
                        children: filteredResults.map((r) {
                          return Dismissible(
                            key: Key(r.id!),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Icon(Icons.delete, color: Colors.white),
                            ),
                            onDismissed: (_) => deleteResult(r.id!),
                            child: InkWell(
                              onTap: () {
                                context.push(
                                  ResultAnalystScreen(
                                    result: r,
                                    fromHistory: true,
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                padding: EdgeInsets.all(16),
                                decoration: boxDecorationConstant(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Judul + tanggal/jam
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            r.complaint,
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "${r.createdAt.day.toString().padLeft(2, '0')} ${_month(r.createdAt.month)} ${r.createdAt.year}",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: AppColor.grey1,
                                              ),
                                            ),
                                            Text(
                                              "${r.createdAt.hour.toString().padLeft(2, '0')}:${r.createdAt.minute.toString().padLeft(2, '0')}",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: AppColor.grey1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),

                                    // Indicator + Severity
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                            color: AppColor.green.withOpacity(
                                              0.15,
                                            ),
                                          ),
                                          child: Text(
                                            "Cek Kesehatan",
                                            style: TextStyle(
                                              color: AppColor.green2,
                                              fontSize: 11,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                            color: _severityColor(
                                              r.severity,
                                            ).withOpacity(0.15),
                                          ),
                                          child: Text(
                                            r.severity,
                                            style: TextStyle(
                                              color: _severityColor(r.severity),
                                              fontSize: 11,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),

                                    // Detail tambahan (gejala, durasi, info)
                                    if (r.mainSymptoms.isNotEmpty)
                                      Text(
                                        r.mainSymptoms.join(", "),
                                        style: TextStyle(color: AppColor.grey2),
                                      ),
                                    if (r.duration.isNotEmpty)
                                      Text(
                                        "Sudah ${r.duration}",
                                        style: TextStyle(color: AppColor.grey2),
                                      ),
                                    if (r.additionalInfo.isNotEmpty)
                                      Text(
                                        r.additionalInfo,
                                        style: TextStyle(color: AppColor.grey2),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Fungsi bantu convert severity jadi warna
  Color _severityColor(String severity) {
    switch (severity.toLowerCase()) {
      case "ringan":
        return Colors.green;
      case "sedang":
        return Colors.orange;
      case "berat":
        return Colors.red;
      default:
        return AppColor.grey1;
    }
  }

  // Fungsi bantu convert nomor bulan ke nama
  String _month(int m) {
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "Mei",
      "Jun",
      "Jul",
      "Agu",
      "Sep",
      "Okt",
      "Nov",
      "Des",
    ];
    return months[m - 1];
  }
}
