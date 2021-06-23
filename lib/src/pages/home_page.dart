import 'package:flutter/material.dart';

import 'package:emulator/src/pages/administrator_page.dart';
import 'package:emulator/src/pages/operator_page.dart';
import 'package:emulator/src/pages/terminal_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pageBottomBar = [
    AdministratorPage(),
    OperatorPage(),
    TerminalPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/huawei-white.png',
          width: 150.0,
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pageBottomBar,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Administrator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Operator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.code),
            label: 'Terminal',
          )
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
