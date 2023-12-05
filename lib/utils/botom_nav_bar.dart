import 'package:flutter/material.dart';

class BottomMenu extends StatelessWidget {
  final selectedIndex;
  ValueChanged<int>? onClicked;

  BottomMenu({this.selectedIndex, this.onClicked});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Calender"),
        BottomNavigationBarItem(icon: Icon(Icons.all_inclusive_rounded), label: "Attanendance"),
        BottomNavigationBarItem(icon: Icon(Icons.school), label: "Profile")

      ],
      currentIndex: selectedIndex,
      onTap: onClicked,
      selectedItemColor: Colors.red[800],
      unselectedItemColor: Colors.black38,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 14,
      unselectedFontSize: 12,
    );
  }
}
