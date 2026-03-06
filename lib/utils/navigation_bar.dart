import 'package:flutter/material.dart';
import 'package:solutis_project/constant/app_color.dart';
import 'package:solutis_project/view/Education_Screen/education_screen.dart';
import 'package:solutis_project/view/History_Screen/history_screen.dart';
import 'package:solutis_project/view/Home_Screen/home_screen.dart';
import 'package:solutis_project/view/Profile_Screen/profile_screen.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    EducationScreen(),
    HistoryScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            label: 'Edukasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_outlined),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColor.teal2,
        unselectedItemColor: AppColor.grey2,
        backgroundColor: AppColor.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
