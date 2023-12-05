import 'package:employe_attatendence/screen/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/botom_nav_bar.dart';
import 'attaendance_screen.dart';
import 'calander_screen.dart';


const List _page = [CalendarScreen(), AttendanceScreen(), ProfileScreen()];

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomMenu(
        selectedIndex: _selectedIndex,
        onClicked: _onItemTapped,
      ),
      body: Center(
        child: _page.elementAt(_selectedIndex),
      ),
    );
  }
}
