import 'package:flutter/material.dart';
import 'package:flutter_desafio_revenda_gas/app/pages/home/components/endereco_usuario.dart';
import 'package:flutter_desafio_revenda_gas/app/pages/home/components/lista_revendedores.dart';
import 'package:flutter_desafio_revenda_gas/app/pages/my_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  static String routerName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    bool isPortrait = ScreenUtil().orientation == Orientation.portrait;
    final List<String> filtros = ['Melhor Avaliação', 'Mais Rápido', 'Mais Barato'];

    return Scaffold(
      backgroundColor: Color(MyColors.cinzaFundo),
      appBar: AppBar(
        title: Text(
          'Escolha uma Revenda',
          style: TextStyle(fontSize: 16.r, fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 60.r,
        actions: <Widget>[
          PopupMenuButton(
            tooltip: 'Filtro',
            child: SizedBox(
              width: 30.w,
              child: Icon(
                Icons.import_export,
                size: 24.r,
              ),
            ),
            itemBuilder: (_) {
              return filtros.map((f) {
                return PopupMenuItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(f,
                          style: TextStyle(
                            fontSize: 10.r,
                          )),
                      Checkbox(
                        onChanged: (bool value) {},
                        value: false,
                      ),
                    ],
                  ),
                );
              }).toList();
            },
          ),
          PopupMenuButton(
            tooltip: 'Ajuda',
            child: SizedBox(
              width: 30.w,
              child: Center(
                child: Text(
                  '?',
                  style: TextStyle(color: Colors.white, fontSize: 24.r),
                ),
              ),
            ),
            itemBuilder: (_) {
              return [
                PopupMenuItem(
                  child: Text('Suporte', style: TextStyle(fontSize: 10.r, color: Color(MyColors.azul))),
                ),
                PopupMenuItem(
                  child: Text('Termos de Serviço', style: TextStyle(fontSize: 10.r, color: Color(MyColors.azul))),
                ),
              ];
            },
          ),
          SizedBox(
            width: 5.w,
          ),
        ],
      ),
      body: !isPortrait
          ? Center(child: Text('Desculpe, utilize no modo retrato.'))
          : Column(
              children: [
                EnderecoUsuario(),
                ListaRevenderes(),
              ],
            ),
    );
  }
}
