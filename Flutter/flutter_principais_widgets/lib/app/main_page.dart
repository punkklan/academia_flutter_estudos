import 'package:flutter/material.dart';
import 'package:flutter_principais_widgets/app/pages/home_mouse.dart';
import 'package:flutter_principais_widgets/app/pages/home_page.dart';
import 'package:flutter_principais_widgets/app/pages/listas_page.dart';

import 'pages/mediaquery_page.dart';
import 'pages/mediaquery_page2.dart';

// Aula complementar de rotas em:
//  https://academiadoflutter.club.hotmart.com/lesson/RONErqrA7P/navegacao-no-flutter-(-varias-telas-)

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        MediaQueryPage.routerName: (_) => MediaQueryPage(),
        ListasPage().routerName: (_) => ListasPage(),
        '/media2': (_) => MediaQueryPage2(),
        '/mouse': (_) => HomeMouse(),
      },
    );
  }
}
