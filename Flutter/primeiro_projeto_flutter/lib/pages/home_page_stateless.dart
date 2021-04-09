import 'package:flutter/material.dart';

class HomepageStateless extends StatefulWidget {
  @override
  _HomepageStatelessState createState() => _HomepageStatelessState();
}

class _HomepageStatelessState extends State<HomepageStateless> {
  @override
  void initState() {
    super.initState();
  }

  String mensagem = 'Ola ';
  bool msg1 = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Teste'),
          ),
        ),
        drawer: Icon(
          Icons.access_alarms,
        ),
        body: Center(
          child: Text(mensagem),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(
              () {
                msg1 = !msg1;
                if (msg1 == true) {
                  mensagem = 'true';
                } else {
                  mensagem = 'false';
                }
              },
            );
          },
          mini: true,
          child: Icon(
            Icons.add_a_photo,
          ),
        ),
      ),
    );
  }
}
