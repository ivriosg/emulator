import 'package:flutter/material.dart';

import 'src/pages/home_page.dart';
import 'src/pages/administrator_page.dart';
import 'src/pages/operator_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: Colors.black,
        brightness: Brightness.dark,
        backgroundColor: const Color(0xFF212121),
        accentColor: Colors.white,
        accentIconTheme: IconThemeData(color: Colors.black),
        dividerColor: Colors.black12,
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomePage(),
        'admin': (BuildContext context) => AdministratorPage(),
        'operator': (BuildContext context) => OperatorPage(),
      },
    );
  }
}
