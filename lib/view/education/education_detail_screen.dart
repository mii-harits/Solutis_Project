import 'package:flutter/material.dart';
import 'package:solutis_project/models/education_model.dart';

class EducationDetailScreen extends StatelessWidget {
  final EducationModel item;

  const EducationDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(item.imageUrl),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(item.description),
            ),
          ],
        ),
      ),
    );
  }
}
