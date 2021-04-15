import 'package:flutter/material.dart';
import 'package:flutter_principais_widgets/app/pages/home_mouse.dart';
import 'package:flutter_principais_widgets/app/pages/home_page.dart';
import 'package:flutter_principais_widgets/app/pages/listas_page.dart';

import 'package:flutter_principais_widgets/app/pages/scroll_list_view.page.dart';
import 'package:flutter_principais_widgets/app/pages/textos_botoes_page.dart';

import 'pages/mediaquery_page.dart';

// Aula complementar de rotas em:
//  https://academiadoflutter.club.hotmart.com/lesson/RONErqrA7P/navegacao-no-flutter-(-varias-telas-)

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        ListasPage().routerName: (_) => ListasPage(),
        MediaQueryPage.routerName: (_) => MediaQueryPage(),
        TextosBotoesPage.routerName: (_) => TextosBotoesPage(),
        ScrollListViewPage.routerName: (_) => ScrollListViewPage(),
        '/mouse': (_) => HomeMouse(),
      },
    );
  }
}
