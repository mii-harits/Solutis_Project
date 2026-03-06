import 'package:flutter/material.dart';
import 'package:solutis_project/utils/background.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(children: [BackgroundScreen()]));
  }
}
