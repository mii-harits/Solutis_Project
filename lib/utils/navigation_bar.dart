import 'package:flutter/material.dart';
import 'package:solutis_project/constant/app_color.dart';
import 'package:solutis_project/view/Education_Screen/education_screen.dart';
import 'package:solutis_project/view/History_Screen/history_screen.dart';
import 'package:solutis_project/view/Home_Screen/home_screen.dart';
import 'package:solutis_project/view/Profile_Screen/profile_screen.dart';

class NavBarWidget extends StatefulWidget {
  final int initialIndex;
  const NavBarWidget({super.key, this.initialIndex = 0});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  late int _selectedIndex = 0;

  late final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(onNavigate: _onItemTapped),
    EducationScreen(),
    HistoryScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
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
