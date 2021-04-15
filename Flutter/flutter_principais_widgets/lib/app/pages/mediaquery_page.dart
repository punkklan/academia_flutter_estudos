import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    // Inicializando e configurando o ScreenUtil
    ScreenUtil.init(
        BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height,
        ),
        // informa aqui o tamanho da tela e orientação que foi utilizada para o desenvolvimento
        designSize: Size(640, 690),
        orientation: Orientation.portrait);

    return Scaffold(
      appBar: _appBar,
      body: Container(
        // definindo largura utilizando o ScreenUtil
        width: 640.w,
        // definindo altura pelo MediaQuery
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: (MediaQuery.of(context).size.height - _appBar.preferredSize.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom) * 0.5,
              color: Colors.amber,
              child: Column(
                children: [
                  Text(
                    'Tamanho tela: ${ScreenUtil().screenHeight}',
                    style: TextStyle(
                      //
                      fontSize: ScreenUtil().setSp(20),
                    ),
                  ),
                  Text(
                    'Tamanho tela largura: ${MediaQuery.of(context).size.width}',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                    ),
                  ),
                  Text(
                    'Tamanho appBar: ${_appBar.preferredSize.height}',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                    ),
                  ),
                  Text(
                    'Tamanho padding top: ${MediaQuery.of(context).padding.top}',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                    ),
                  ),
                  Text(
                    'Tamanho padding bottom: ${MediaQuery.of(context).padding.bottom}',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
