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
      children: [
        Row(
          children: [
            SvgPicture.asset(widget.icon, height: 33, width: 33),
            SizedBox(width: 14),
            Text(widget.title, style: TextStyle(fontSize: 18)),
          ],
        ),

        SizedBox(height: 16),

        FutureBuilder(
          future: EducationController.getEducations(widget.category),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text("Belum ada data");
            }

            final data = snapshot.data!;

            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 18),
                  padding: const EdgeInsets.all(20),
                  decoration: boxDecorationConstant(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['title'], style: const TextStyle(fontSize: 17)),

                      const SizedBox(height: 10),

                      Text(
                        item['description'],
                        style: TextStyle(fontSize: 14, color: AppColor.grey2),
                      ),
                    ],
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
