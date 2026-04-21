import 'package:flutter/material.dart';
import 'package:solutis_project/extension/navigator.dart';
import 'package:solutis_project/service/firebase_service.dart';

class HealthFormScreen extends StatefulWidget {
  const HealthFormScreen({super.key});

  @override
  State<HealthFormScreen> createState() => _HealthFormScreenState();
}

class _HealthFormScreenState extends State<HealthFormScreen> {
  final heightC = TextEditingController();
  final weightC = TextEditingController();
  final diseaseC = TextEditingController();
  final allergyC = TextEditingController();
  final medicineC = TextEditingController();

  String bloodType = "A";

  bool isLoading = false;

  Future<void> save() async {
    if (heightC.text.isEmpty || weightC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Tinggi & berat wajib diisi")),
      );
      return;
    }

    setState(() => isLoading = true);

    await FirebaseService.updateHealthData(
      height: double.tryParse(heightC.text) ?? 0,
      weight: double.tryParse(weightC.text) ?? 0,
      bloodType: bloodType,
      diseaseHistory: diseaseC.text.trim(),
      allergy: allergyC.text.trim(),
      medicine: medicineC.text.trim(),
    );

    setState(() => isLoading = false);

    if (mounted) {
      context.pop(true); // 🔥 kirim signal ke profile
    }
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType? type,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextField(
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
          filled: true,
          fillColor: Colors.grey.shade100,
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget cardWrapper(Widget child) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Informasi Kesehatan"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔥 DATA UTAMA
            cardWrapper(
              Column(
                children: [
                  sectionTitle("Data Fisik"),
                  buildTextField(
                    controller: heightC,
                    label: "Tinggi (cm)",
                    type: TextInputType.number,
                  ),
                  buildTextField(
                    controller: weightC,
                    label: "Berat (kg)",
                    type: TextInputType.number,
                  ),

                  const SizedBox(height: 10),

                  // 🔥 DROPDOWN BLOOD
                  DropdownButtonFormField<String>(
                    value: bloodType,
                    decoration: InputDecoration(
                      labelText: "Golongan Darah",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                    ),
                    items: ["A", "B", "AB", "O"]
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) {
                      setState(() => bloodType = val!);
                    },
                  ),
                ],
              ),
            ),

            // 🔥 DATA TAMBAHAN
            cardWrapper(
              Column(
                children: [
                  sectionTitle("Riwayat Kesehatan"),
                  buildTextField(
                    controller: diseaseC,
                    label: "Riwayat Penyakit",
                  ),
                  buildTextField(controller: allergyC, label: "Alergi"),
                  buildTextField(controller: medicineC, label: "Obat Rutin"),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // 🔥 BUTTON
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: isLoading ? null : save,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Simpan Data", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
