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

    data.sort(
      (a, b) => b.createdAt.compareTo(a.createdAt),
    ); // 🔥 terbaru di atas

    setState(() {
      results = data;
      filteredResults = data;
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
    final q = query.toLowerCase();

    setState(() {
      filteredResults = results.where((r) {
        final date =
            "${r.createdAt.day.toString().padLeft(2, '0')} "
            "${_month(r.createdAt.month).toLowerCase()} "
            "${r.createdAt.year} "
            "${r.createdAt.hour.toString().padLeft(2, '0')}:"
            "${r.createdAt.minute.toString().padLeft(2, '0')}";

        return r.diseaseName.toLowerCase().contains(q) || // 🔥 tambah ini
            r.complaint.toLowerCase().contains(q) ||
            r.severity.toLowerCase().contains(q) ||
            r.mainSymptoms.join(" ").toLowerCase().contains(q) ||
            r.duration.toLowerCase().contains(q) ||
            r.additionalInfo.toLowerCase().contains(q) ||
            date.contains(q); // 🔥 search tanggal
      }).toList()..sort((a, b) => b.createdAt.compareTo(a.createdAt));
    });
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
                results.isEmpty
                    // 🔹 BELUM PERNAH ADA DATA
                    ? Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Column(
                          children: [
                            Icon(
                              Icons.medical_information_outlined,
                              size: 50,
                              color: AppColor.grey1,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Belum ada riwayat kesehatan",
                              style: TextStyle(color: AppColor.grey1),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "Mulai pemeriksaan untuk melihat riwayat di sini",
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColor.grey2,
                              ),
                            ),
                          ],
                        ),
                      )
                    // 🔹 ADA DATA TAPI HASIL SEARCH KOSONG
                    : filteredResults.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Column(
                          children: [
                            Icon(
                              Icons.search_off,
                              size: 50,
                              color: AppColor.grey1,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Data tidak ditemukan",
                              style: TextStyle(color: AppColor.grey1),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "Coba gunakan kata kunci lain",
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColor.grey2,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Column(
                        children: filteredResults.map((r) {
                          return Dismissible(
                            key: Key(r.id!),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                color: Colors.red.shade400,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Icons.delete_outline,
                                color: Colors.white,
                              ),
                            ),
                            confirmDismiss: (direction) async {
                              return await showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  title: Row(
                                    children: [
                                      Icon(
                                        Icons.warning_amber_rounded,
                                        color: Colors.red,
                                      ),
                                      SizedBox(width: 8),
                                      Text("Konfirmasi"),
                                    ],
                                  ),
                                  content: Text(
                                    "Yakin ingin menghapus riwayat ini?",
                                  ),
                                  actions: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 8,
                                        right: 8,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          // 🔹 BATAL (soft & minimal)
                                          InkWell(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            onTap: () =>
                                                Navigator.pop(context, false),
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 14,
                                                vertical: 10,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: Colors.grey.withOpacity(
                                                  0.08,
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.close_rounded,
                                                    size: 18,
                                                    color: AppColor.grey1,
                                                  ),
                                                  SizedBox(width: 6),
                                                  Text(
                                                    "Batal",
                                                    style: TextStyle(
                                                      color: AppColor.grey1,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),

                                          SizedBox(width: 10),

                                          // 🔥 HAPUS (fokus utama)
                                          InkWell(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            onTap: () =>
                                                Navigator.pop(context, true),
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 16,
                                                vertical: 10,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Colors.red.shade400,
                                                    Colors.red.shade300,
                                                  ],
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.red
                                                        .withOpacity(0.25),
                                                    blurRadius: 10,
                                                    offset: Offset(0, 4),
                                                  ),
                                                ],
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.delete_rounded,
                                                    size: 18,
                                                    color: Colors.white,
                                                  ),
                                                  SizedBox(width: 6),
                                                  Text(
                                                    "Hapus",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
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
                              );
                            },

                            onDismissed: (_) => deleteResult(r.id!),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () {
                                context.push(
                                  ResultAnalystScreen(
                                    result: r,
                                    fromHistory: true,
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 6),
                                padding: EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors
                                        .grey
                                        .shade200, // 🔥 garis tipis (klinis)
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // 🔹 Header (judul + waktu)
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // 🔥 Icon medis
                                        Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: AppColor.teal.withOpacity(
                                              0.1,
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.monitor_heart_outlined,
                                            size: 18,
                                            color: AppColor.teal,
                                          ),
                                        ),

                                        SizedBox(width: 10),

                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                r.diseaseName.isEmpty
                                                    ? "Tidak diketahui"
                                                    : r.diseaseName,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(height: 2),
                                              Text(
                                                "${r.createdAt.day.toString().padLeft(2, '0')} ${_month(r.createdAt.month)} ${r.createdAt.year} • ${r.createdAt.hour.toString().padLeft(2, '0')}:${r.createdAt.minute.toString().padLeft(2, '0')}",
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  color: AppColor.grey1,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        // 🔥 Severity indicator (bulat kecil)
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            color: _severityColor(r.severity),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 10),

                                    // 🔹 Divider tipis
                                    Divider(
                                      height: 1,
                                      color: Colors.grey.shade200,
                                    ),

                                    SizedBox(height: 10),

                                    // 🔹 Info detail
                                    if (r.complaint.isNotEmpty)
                                      _infoRow(
                                        icon: Icons.sick_outlined,
                                        text: r.complaint,
                                      ),

                                    if (r.duration.isNotEmpty)
                                      _infoRow(
                                        icon: Icons.schedule_outlined,
                                        text: "Durasi: ${r.duration}",
                                      ),

                                    if (r.additionalInfo.isNotEmpty)
                                      _infoRow(
                                        icon: Icons.notes_outlined,
                                        text: r.additionalInfo,
                                      ),

                                    SizedBox(height: 8),

                                    // 🔹 Footer label
                                    Row(
                                      children: [
                                        _tag("Pemeriksaan", AppColor.teal),
                                        SizedBox(width: 6),
                                        _tag(
                                          r.severity,
                                          _severityColor(r.severity),
                                        ),
                                      ],
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

  Widget _infoRow({required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 14, color: AppColor.grey1),
          SizedBox(width: 6),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 12, color: AppColor.grey2),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tag(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10,
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
