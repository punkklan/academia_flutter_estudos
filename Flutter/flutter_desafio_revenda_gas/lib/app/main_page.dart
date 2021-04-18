import 'package:flutter/material.dart';
import 'package:flutter_desafio_revenda_gas/app/my_colors.dart';
import 'package:flutter_desafio_revenda_gas/app/pages/home_page.dart';
import 'package:flutter_desafio_revenda_gas/app/pages/teste_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(MyColors.azul)),
      initialRoute: HomePage.routerName,
      routes: {
        HomePage.routerName: (_) => HomePage(),
        TestePage.routerName: (_) => TestePage(),
      },
    );
  }
}
