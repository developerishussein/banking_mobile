import 'package:banking_mobile/screens/Home/home_page.dart';
import 'package:banking_mobile/screens/My-Cards/Mycards.dart';
import 'package:banking_mobile/screens/Statistics/Statistics_page.dart';
import 'package:flutter/material.dart';

import 'Settings/Settings.dart';

class Mynv extends StatefulWidget {
  const Mynv({super.key});

  @override
  State<Mynv> createState() => _MynvState();
}

class _MynvState extends State<Mynv> {
  int _currentIndex = 0;

  final List<dynamic> _pages = [
    HomePage(),
    Mycards(),
    Statistics(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // ضروري للحفاظ على التحديد
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        unselectedItemColor: Colors.white,
        selectedItemColor: const Color(0xff0066FF),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xff27273A),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'My Card',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stream_outlined),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_suggest_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
