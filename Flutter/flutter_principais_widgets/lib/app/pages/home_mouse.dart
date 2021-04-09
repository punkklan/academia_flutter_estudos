import 'package:flutter/material.dart';

var amarelo = 0xFFF7F33A;
var verde = 0xFF0F5220;
var branco = 0xFFFFFFFF;

class HomeMouse extends StatefulWidget {
  @override
  _HomeMouseState createState() => _HomeMouseState();
}

class _HomeMouseState extends State<HomeMouse> {
  double x = 0.0;
  double y = 0.0;

  void _updateLocation(PointerEvent details) {
    setState(() {
      x = details.position.dx;
      y = details.position.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(verde),
        title: Text('Mouse Region   x= ${x.toStringAsFixed(2)} | y= ${y.toStringAsFixed(2)}', style: TextStyle(color: Color(branco))),
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
              onSelected: (value) => print(value),
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: 'Menu 1',
                    child: Text(
                      'Menu 1',
                      style: TextStyle(color: Color(verde)),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'Menu 2',
                    child: Text(
                      'Menu 2',
                      style: TextStyle(color: Color(verde)),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'Icon ADD',
                    child: Icon(
                      Icons.add,
                      color: Color(verde),
                    ),
                  ),
                ];
              },
            ),
          ),
        ],
      ),
      body: Center(
        child: MouseRegion(
          onHover: _updateLocation,
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset('assets/botHunterTelegram.jpg'),
                  Positioned(
                    top: y - 25 - 56,
                    left: x - 25,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/botHunterTelegram.jpg'),
                          scale: 2,
                          fit: BoxFit.none,
                        ),
                        color: Color(verde),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 10,
                            offset: Offset(5, 5),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
