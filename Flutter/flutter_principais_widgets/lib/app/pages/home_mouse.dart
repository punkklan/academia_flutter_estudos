import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        backgroundColor: Color(verde),
        title: Text('Mouse Region   x= ${x.toStringAsFixed(2)} | y= ${y.toStringAsFixed(2)}', style: TextStyle(color: Color(branco))),
        centerTitle: true,
      ),
      body: Container(
        width: 640.w,
        height: 800.w,
        child: MouseRegion(
          onHover: _updateLocation,
          child: Stack(
            children: [
              Positioned(
                top: y - 25.w - 56.h,
                left: x - 25.w,
                child: Container(
                  width: 50.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/botHunterTelegram.jpg'),
                      scale: 2,
                      fit: BoxFit.none,
                    ),
                    color: Color(verde),
                    borderRadius: BorderRadius.circular(30.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 10.r,
                        offset: Offset(5, 5),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
