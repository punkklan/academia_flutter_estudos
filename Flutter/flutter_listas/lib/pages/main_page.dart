import 'package:flutter/material.dart';
import 'package:flutter_listas/pages/home_page.dart';
import 'package:flutter_listas/pages/listas_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: HomePage(),
      routes: {
        ListasPage.routerName: (_) => ListasPage(),
      },
    );
  }
}
