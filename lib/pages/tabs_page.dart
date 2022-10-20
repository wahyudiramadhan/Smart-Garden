// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:seledriaarduino/pages/homepage.dart';
import 'package:seledriaarduino/pages/reportpage.dart';
import 'package:seledriaarduino/style/color.dart';

class tabsPage extends StatefulWidget {
  const tabsPage({Key? key}) : super(key: key);

  @override
  State<tabsPage> createState() => _tabsPageState();
}

class _tabsPageState extends State<tabsPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    homePage(),
    ReportPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xffF5FDFB).withOpacity(0.9),
        ),
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Report',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff3BCEAC),
        onTap: _onItemTapped,
      ),
    );
  }
}
