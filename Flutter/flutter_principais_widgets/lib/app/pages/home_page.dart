import 'package:flutter/material.dart';

var amarelo = 0xFFF7F33A;
var verde = 0xFF0F5220;
var branco = 0xFFFFFFFF;

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
                      Navigator.of(context).pushNamed('/textos_Botoes');
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
                    child: Icon(
                      Icons.mouse,
                      color: Color(verde),
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
