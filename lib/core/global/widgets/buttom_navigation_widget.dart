import 'package:dro_hometest/home_test_icon_icons.dart';
import 'package:flutter/material.dart';

class GBottomNavigation extends StatelessWidget {
  const GBottomNavigation(
      {required this.currentIndex, required this.onTap, Key? key})
      : super(key: key);
  final int currentIndex;
  final Function(int x) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0xFFEEEBF1),
      onTap: onTap,
      currentIndex: currentIndex,
      showUnselectedLabels: true,
      selectedItemColor: const Color(0xFF9F5DE2),
      unselectedItemColor: const Color(0xFF828282),
      selectedLabelStyle:
          const TextStyle(color: Color(0xFF9F5DE2), fontSize: 12),
      unselectedLabelStyle:
          const TextStyle(color: Color(0xFF828282), fontSize: 12),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(HomeTestIcon.apphome),
          label: 'Home',
        ),
        BottomNavigationBarItem(
            icon: Icon(HomeTestIcon.appuser), label: 'Doctors'),
        BottomNavigationBarItem(
          icon: Icon(HomeTestIcon.cartplus),
          label: 'Pharmacy',
        ),
        BottomNavigationBarItem(
          icon: Icon(HomeTestIcon.appchat),
          label: 'Communities',
        ),
        BottomNavigationBarItem(
          icon: Icon(HomeTestIcon.profile),
          label: 'Profile',
        ),
      ],
    );
  }
}
