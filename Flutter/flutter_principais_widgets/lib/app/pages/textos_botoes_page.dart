import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextosBotoesPage extends StatelessWidget {
  static String routerName = '/textos_Botoes';
  const TextosBotoesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Inicializando e configurando o ScreenUtil
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
        toolbarHeight: 60.h,
        leadingWidth: 600.w,
        title: Text(
          'Textos e Botões',
          style: TextStyle(fontSize: 24.sp),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotatedBox(
              quarterTurns: -1,
              child: Container(
                color: Colors.red,
                padding: EdgeInsets.all(10.r),
                child: Text(
                  'Text',
                  style: TextStyle(fontSize: 20.sp),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(10.r),
                child: TextButton(
                  onPressed: () {},
                  child: Text('TextButton', style: TextStyle(fontSize: 15.sp)),
                )),
            IconButton(iconSize: 20.r, icon: Icon(Icons.ad_units), onPressed: () {}),
            ElevatedButton(
              onPressed: () {},
              child: Text('ElevatedButton', style: TextStyle(fontSize: 15.sp)),
            ),
            InkWell(
              onTap: () {},
              child: Text('InkWell', style: TextStyle(fontSize: 15.sp)),
            ),
            Container(
              color: Colors.black38,
              height: 60.h,
              child: GestureDetector(
                onTap: () => print('onTap'),
                onHorizontalDragStart: (_) => print('Start $_'),
                onHorizontalDragEnd: (_) => print('End $_'),
                child: Text('GestureDetector', style: TextStyle(fontSize: 15.sp)),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 10,
                    offset: Offset(8, 8),
                  )
                ],
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blue,
                    Colors.green,
                  ],
                ),
              ),
              width: 250.w,
              height: 60.h,
              child: Center(
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    'Botão Gradiente',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.r,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
