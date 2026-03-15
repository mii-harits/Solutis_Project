import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solutis_project/constant/app_color.dart';
import 'package:solutis_project/controller/education_controller.dart';
import 'package:solutis_project/widgets/box_decoration.dart';

class EducationCategoryWidget extends StatefulWidget {
  final String category;
  final String title;
  final String icon;
  const EducationCategoryWidget({
    super.key,
    required this.category,
    required this.title,
    required this.icon,
  });

  @override
  State<EducationCategoryWidget> createState() =>
      _EducationCategoryWidgetState();
}

class _EducationCategoryWidgetState extends State<EducationCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              SvgPicture.asset(widget.icon, height: 33, width: 33),
              SizedBox(width: 14),
              Text(
                widget.category == "lifestyle"
                    ? "Gaya Hidup Sehat"
                    : widget.category == "penyakit"
                    ? "Informasi Penyakit"
                    : "Informasi Obat-obatan",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),

        SizedBox(height: 16),

        FutureBuilder(
          future: EducationController.getEducations(widget.category),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25), // jarak tetap
                child: Center(child: Text("Belum ada data")),
              );
            }

            final data = snapshot.data!;

            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];

                return Dismissible(
                  key: Key(item['id'].toString()),
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                  secondaryBackground: Container(
                    color: Colors.blue,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20),
                    child: Icon(Icons.edit, color: Colors.white),
                  ),
                  confirmDismiss: (direction) async {
                    if (direction == DismissDirection.startToEnd) {
                      // Tampilkan konfirmasi sebelum hapus
                      final confirm = await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Hapus Informasi"),
                          content: Text(
                            "Apakah kamu yakin ingin menghapus '${item['title']}'?",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.of(context).pop(false), // batal
                              child: Text("Batal"),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.of(context).pop(true), // hapus
                              child: Text(
                                "Hapus",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      );

                      if (confirm == true) {
                        await EducationController.deleteEducation(item['id']);
                        setState(() {}); // refresh list
                        return true;
                      }
                      return false;
                    } else {
                      // Buat controller untuk pre-fill data
                      TextEditingController editTitle = TextEditingController(
                        text: item['title'],
                      );
                      TextEditingController editDesc = TextEditingController(
                        text: item['description'],
                      );

                      // Tampilkan modal bottom sheet
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return FractionallySizedBox(
                            heightFactor: 0.75,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 30,
                                horizontal: 20,
                              ),
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    "Edit Informasi Kesehatan",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  TextField(
                                    controller: editTitle,
                                    decoration: InputDecoration(
                                      labelText: "Judul",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  TextField(
                                    controller: editDesc,
                                    minLines: 5,
                                    maxLines: null,
                                    decoration: InputDecoration(
                                      labelText: "Deskripsi",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColor.redHeight,
                                            foregroundColor: AppColor.white,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                          onPressed: () async {
                                            // Cek perubahan
                                            if (editTitle.text !=
                                                    item['title'] ||
                                                editDesc.text !=
                                                    item['description']) {
                                              final discard = await showDialog(
                                                context: context,
                                                builder: (context) => AlertDialog(
                                                  title: Text(
                                                    "Buang Perubahan?",
                                                  ),
                                                  content: Text(
                                                    "Kamu telah melakukan perubahan. Apakah kamu ingin membuangnya?",
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                            context,
                                                            false,
                                                          ),
                                                      child: Text("Tidak"),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                            context,
                                                            true,
                                                          ),
                                                      child: Text(
                                                        "Ya",
                                                        style: TextStyle(
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                              if (discard == true)
                                                Navigator.pop(context);
                                            } else {
                                              Navigator.pop(context);
                                            }
                                          },
                                          child: Text("Batal"),
                                        ),
                                      ),
                                      SizedBox(width: 12),
                                      Expanded(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColor.teal,
                                            foregroundColor: AppColor.white,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                          onPressed: () async {
                                            await EducationController.updateEducation(
                                              item['id'],
                                              editTitle.text,
                                              editDesc.text,
                                            );
                                            setState(() {});
                                            Navigator.pop(context);
                                          },
                                          child: Text("Simpan"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                      return false;
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 18),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 20,
                      ),
                      decoration: boxDecorationConstant(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title'],
                            style: const TextStyle(fontSize: 17),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            item['description'],
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColor.grey2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
