import 'package:flutter/material.dart';
import 'package:solutis_project/constant/app_color.dart';
import 'package:solutis_project/view/education/education_screen.dart';
import 'package:solutis_project/view/history/history_screen.dart';
import 'package:solutis_project/view/home/home_screen.dart';
import 'package:solutis_project/view/profile/profile_screen.dart';

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

  Widget _buildCustomNavItem(IconData icon, bool active) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Icon(
              icon,
              color: active ? AppColor.teal2 : AppColor.grey2,
              size: 28,
            ),
            if (active)
              Positioned(
                top: -6,
                left: -30,
                right: -30,
                child: Container(
                  height: 35, // tinggi kotak cahaya
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColor.teal2,
                        AppColor.teal2.withOpacity(0.05),
                        AppColor.teal2.withOpacity(0.05),
                        AppColor.teal2.withOpacity(0.05),
                        AppColor.teal2.withOpacity(0.05),
                        AppColor.teal2.withOpacity(0.05),
                        AppColor.teal2.withOpacity(0.05),
                        AppColor.teal2.withOpacity(0.05),
                        AppColor.teal2.withOpacity(0.05),
                        AppColor.teal2.withOpacity(0.05),
                        AppColor.teal2.withOpacity(0.05),
                        AppColor.teal2.withOpacity(0.05),
                        AppColor.teal2.withOpacity(0.05),
                        AppColor.teal2.withOpacity(0.01),
                        Colors.transparent,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final icons = [
      Icons.home_outlined,
      Icons.menu_book_outlined,
      Icons.history_outlined,
      Icons.person_outline,
    ];

    final activeIcons = [
      Icons.home_rounded,
      Icons.menu_book_rounded,
      Icons.history_rounded,
      Icons.person_rounded,
    ];

    final labels = ['Beranda', 'Edukasi', 'Riwayat', 'Profil'];

    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: AppColor.teal2,
          unselectedItemColor: AppColor.grey2,
          items: List.generate(4, (index) {
            return BottomNavigationBarItem(
              icon: _buildCustomNavItem(icons[index], false),
              activeIcon: _buildCustomNavItem(activeIcons[index], true),
              label: labels[index],
            );
          }),
        ),
      ),
    );
  }
}
