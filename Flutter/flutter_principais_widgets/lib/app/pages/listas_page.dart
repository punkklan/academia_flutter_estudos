import 'package:flutter/material.dart';

class ListasPage extends StatelessWidget {
  get routerName => '/listas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text('Olá Marcio'),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Oiiii',
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Icon(Icons.send),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
