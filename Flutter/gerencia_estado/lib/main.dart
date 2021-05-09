import 'package:flutter/material.dart';
import 'package:gerencia_estado/change_notifier/change_notifier_page.dart';
import 'package:gerencia_estado/home.dart';
import 'package:gerencia_estado/setstate/set_state_page.dart';
import 'package:gerencia_estado/stream/atualizar_nome_page.dart';
import 'package:gerencia_estado/value_notifier/value_notifier_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/setState': (_) => SetStatePage(),
        '/valueNotifier': (_) => ValueNotifierpage(),
        '/changeNotifier': (_) => ChangeNotifierPage(),
        '/stream': (_) => AtualizarNomePage(),
      },
      home: HomePage(),
    );
  }
}
