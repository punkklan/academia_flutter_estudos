import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_listas/pages/listas_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

double graus = 0;
double inclinacao = 0;
const double pi = 3.1415926535897932;
var corCirculo = Colors.blue;

class _HomePageState extends State<HomePage> {
  double rotate() {
    if (graus >= 360 || graus <= -360) {
      graus = 0;
    }
    double radians = graus * pi / 180;
    return radians;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Home Page')),
        actions: <Widget>[
          Icon(Icons.access_alarm),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: PopupMenuButton(
              icon: Icon(Icons.alt_route),
              onSelected: (value) {
                switch (value) {
                  case 1:
                    Navigator.of(context).pushNamed(ListasPage.routerName);
                    break;
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: 1,
                    child: Text('Listas Page'),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text('Listas Page2'),
                  ),
                ];
              },
            ),
          )
        ],
      ),
      body: RawKeyboardListener(
        focusNode: FocusNode(),
        autofocus: true,
        onKey: (RawKeyEvent event) {
          switch (event.physicalKey.debugName) {
            case 'Arrow Up':
              inclinacao += 0.05;
              String x = inclinacao.toStringAsFixed(2);
              inclinacao = double.parse(x);
              print('acima');
              print(inclinacao);
              break;
            case 'Arrow Down':
              inclinacao -= 0.05;
              String x = inclinacao.toStringAsFixed(2);
              inclinacao = double.parse(x);
              print(inclinacao);
              break;
            case 'Arrow Left':
              graus -= 2;
              print('esquerda $graus');

              break;
            case 'Arrow Right':
              graus += 2;
              print('direita $graus');
              break;
            default:
          }
          if (inclinacao >= 1.55 || inclinacao <= -1.55) {
            corCirculo = Colors.yellow;
          }
          if (inclinacao >= 4.7 || inclinacao >= -4.7 || inclinacao >= -1.56) {
            corCirculo = Colors.blue;
          }

          if (inclinacao >= 6.35 || inclinacao <= -6.35) {
            inclinacao = 0;
          }

          setState(() {});
          print('Tecla Lógica ${event.physicalKey.debugName}');
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  height: 50,
                ),
                Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.01)
                    ..rotateX(inclinacao),
                  alignment: FractionalOffset.center,
                  child: Transform.rotate(
                    angle: rotate(),
                    child: Stack(alignment: Alignment.topCenter, children: [
                      Container(
                        alignment: Alignment.topCenter,
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 4),
                          color: corCirculo,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(150),
                            bottom: Radius.circular(150),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Container(
                          width: 5,
                          height: 75,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1),
                            color: Colors.red,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(50),
                              bottom: Radius.circular(50),
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
                Container(
                  height: 50,
                ),
                Text('Angulo ${graus.toInt()}'),
                Text('Rotate ${inclinacao.toStringAsFixed(2)}'),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          width: 1,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                            icon: Icon(Icons.send),
                            onPressed: () {
                              print('x.toString()');
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
