import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CidadesPage extends StatefulWidget {
  static String routeName = '/cidades_page';
  const CidadesPage({Key key}) : super(key: key);

  @override
  _CidadesPageState createState() => _CidadesPageState();
}

class _CidadesPageState extends State<CidadesPage> {
  List<dynamic> cidades;

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/cidades.json').then((jsonData) {
      this.setState(() {
        cidades = json.decode(jsonData);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height,
        ),
        // informa aqui o tamanho da tela e orientação que foi utilizada para o desenvolvimento
        designSize: Size(600, 800),
        orientation: Orientation.portrait);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cidades'),
      ),
      body: ListView.builder(
        itemCount: cidades?.length ?? 0,
        itemBuilder: (_, index) {
          return ListTile(
            title: Text(
              cidades[index]['cidade'],
              style: TextStyle(fontSize: 20.r),
            ),
            subtitle: Text(
              cidades[index]['estado'],
              style: TextStyle(fontSize: 15.r),
            ),
          );
        },
      ),
    );
  }
}
