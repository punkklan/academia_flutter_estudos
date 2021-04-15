import 'package:flutter/material.dart';

class MediaQueryPage extends StatefulWidget {
  static String routerName = '/media';

  @override
  _MediaQueryPageState createState() => _MediaQueryPageState();
}

class _MediaQueryPageState extends State<MediaQueryPage> {
  var _appBar = AppBar(
    title: Text('Media Query'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: (MediaQuery.of(context).size.height - _appBar.preferredSize.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom) * 0.5,
              color: Colors.amber,
              child: Column(
                children: [
                  Text('Tamanho tela: ${MediaQuery.of(context).size.height}'),
                  Text('Tamanho appBar: ${_appBar.preferredSize.height}'),
                  Text('Tamanho padding top: ${MediaQuery.of(context).padding.top}'),
                  Text('Tamanho padding bottom: ${MediaQuery.of(context).padding.bottom}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
