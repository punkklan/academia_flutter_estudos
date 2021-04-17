import 'package:flutter/material.dart';
import 'package:flutter_desafio_revenda_gas/app/pages/home_page.dart';

int cinza = 0xFFA0A0A0;
int azul = 0xFF0A9EF3;

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xFF0A9EF3)),
      initialRoute: HomePage.routerName,
      routes: {
        HomePage.routerName: (_) => HomePage(),
      },
    );
  }
}
