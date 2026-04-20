import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
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
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              transform: Matrix4.translationValues(
                0,
                active ? -3 : 0, // 🔥 naik sedikit saat aktif
                0,
              ),
              child: Icon(
                icon,
                color: active ? AppColor.teal2 : AppColor.grey2,
                size: 26,
              ),
            ),
            if (active)
              Positioned(
                top: -6,
                left: -35,
                right: -35,
                child: Container(
                  height: 50, // tinggi kotak cahaya
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColor.teal2, // 🔥 garis tegas di atas
                        AppColor.teal2.withOpacity(0.1),
                        AppColor.teal2.withOpacity(0.15),
                        AppColor.teal2.withOpacity(0.1),
                        Colors.transparent,
                      ],
                      stops: [
                        0.05, // full solid
                        0.0, // mulai fade
                        0.0,
                        0.4,
                        0.9,
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
      PhosphorIcons.house(),
      PhosphorIcons.book(),
      PhosphorIcons.clock(),
      PhosphorIcons.user(),
    ];

    final activeIcons = [
      PhosphorIcons.house(PhosphorIconsStyle.fill),
      PhosphorIcons.book(PhosphorIconsStyle.fill),
      PhosphorIcons.clock(PhosphorIconsStyle.fill),
      PhosphorIcons.user(PhosphorIconsStyle.fill),
    ];

    final labels = ['Beranda', 'Edukasi', 'Riwayat', 'Profil'];

    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColor.white,
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
          selectedFontSize: 12,
          unselectedFontSize: 12,
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
