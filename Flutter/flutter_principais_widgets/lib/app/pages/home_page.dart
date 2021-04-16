import 'package:flutter/material.dart';
import 'package:flutter_principais_widgets/app/pages/cidade_page.dart';
import 'package:flutter_principais_widgets/app/pages/scroll_list_view.page.dart';
import 'package:flutter_principais_widgets/app/pages/textos_botoes_page.dart';

var amarelo = 0xFFF7F33A;
var verde = 0xFF0F5220;
var branco = 0xFFFFFFFF;
var vermelho = 0xFFFF0101;

class HomePage extends StatelessWidget {
  static String routerName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Color(verde),
        title: Text('App Bar 1', style: TextStyle(color: Color(branco))),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.add),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.add_alert),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton(
              icon: Icon(Icons.settings_applications),
              onSelected: (value) {
                print(value);

                switch (value) {
                  case 1:
                    {
                      // Navigator.of(context).push(MaterialPageRoute(builder: (_) => MediaQueryPage()));

                      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => MediaQueryPage()));

                      // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => MediaQueryPage()), (route) => route.isFirst);

                      Navigator.of(context).pushNamed('/media');

                      //  Navigator.of(context).pushReplacementNamed('/media1');
                      //
                      // Navigator.of(context).pushNamedAndRemoveUntil(
                      //   (MediaQueryPage.routerName),
                      //   ModalRoute.withName('/'),
                      // );
                    }
                    break;
                  case 2:
                    {
                      Navigator.of(context).pushNamed('/listas');
                    }
                    break;
                  case 3:
                    {
                      Navigator.of(context).pushNamed(TextosBotoesPage.routerName);
                    }
                    break;
                  case 4:
                    {
                      Navigator.of(context).pushNamed(ScrollListViewPage.routerName);
                    }
                    break;
                  case 5:
                    {
                      Navigator.of(context).pushNamed('/mouse');
                    }
                    break;
                  case 6:
                    {
                      Navigator.of(context).pushNamed(CidadesPage.routeName);
                    }
                    break;
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: 1,
                    child: Text(
                      'Media Query',
                      style: TextStyle(color: Color(verde)),
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text(
                      'Listas',
                      style: TextStyle(color: Color(verde)),
                    ),
                  ),
                  PopupMenuItem(
                    value: 3,
                    child: Text(
                      'Textos Botões',
                      style: TextStyle(color: Color(verde)),
                    ),
                  ),
                  PopupMenuItem(
                    value: 4,
                    child: Text(
                      'Scroll List',
                      style: TextStyle(color: Color(verde)),
                    ),
                  ),
                  PopupMenuItem(
                    value: 5,
                    child: Icon(
                      Icons.mouse,
                      color: Color(verde),
                    ),
                  ),
                  PopupMenuItem(
                    value: 6,
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_city,
                          color: Color(vermelho),
                        ),
                        Text(
                          ' Cidades',
                          style: TextStyle(color: Color(vermelho)),
                        ),
                      ],
                    ),
                  ),
                ];
              },
            ),
          ),
        ],
      ),
      body: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Color(verde),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.red,
              blurRadius: 10,
              offset: Offset(5, 5),
            ),
          ],
        ),
      ),
    );
  }
}
