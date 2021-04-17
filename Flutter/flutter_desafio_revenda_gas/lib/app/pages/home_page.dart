import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

int cinza = 0xFFA0A0A0;
int cinzaFundo = 0xFFDADADA;
int azul = 0xFF0A9EF3;
int laranja = 0xFFF3A10A;

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  static String routerName = '/';

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height,
        ),
        // informa aqui o tamanho da tela e orientação que foi utilizada para o desenvolvimento
        designSize: Size(313, 663),
        orientation: Orientation.portrait);
    var x = MediaQuery.of(context).size.width;
    var y = MediaQuery.of(context).size.height;
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Escolha uma Revenda',
            style: TextStyle(fontSize: 16.h),
          ),
          toolbarHeight: 60.h,
          actions: [
            InkWell(
              onTap: () {},
              child: SizedBox(
                  width: 60,
                  child: Icon(
                    Icons.import_export,
                    size: 24.h,
                  )),
            ),
            InkWell(
              onTap: () {},
              child: TextButton(
                onPressed: () {},
                child: Text(
                  '?',
                  style: TextStyle(color: Colors.white, fontSize: 24.h),
                ),
              ),
            ),
          ],
        ),
        body: Container(
          color: Color(cinzaFundo),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(15.h),
                color: Colors.white,
                height: 70.h,
                width: ScreenUtil().screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Botijões de 13kg em:',
                          style: TextStyle(
                            fontSize: 9.h,
                            color: Color(cinza),
                          ),
                        ),
                        Text(
                          'Av Paulista, 1001',
                          style: TextStyle(
                            fontSize: 14.h,
                          ),
                        ),
                        Text(
                          'Paulista, São Paulo, Sp',
                          style: TextStyle(
                            fontSize: 11.h,
                            color: Color(cinza),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Color(azul),
                            size: 24.h,
                          ),
                          Container(height: 2.h),
                          Text(
                            'Mudar',
                            style: TextStyle(
                              fontSize: 11.h,
                              color: Color(azul),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(10.w, 15.h, 10.w, 0),
                      child: InkWell(
                        onTap: () => print(index),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          height: 90.h,
                          child: Row(
                            children: [
                              // Marcas de Gas ---------------------
                              RotatedBox(
                                quarterTurns: -1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                    ),
                                    color: Color(azul),
                                  ),
                                  height: 30.w,
                                  width: 90.h,
                                  child: Center(
                                      child: Text(
                                    'Multimarcas',
                                    style: TextStyle(fontSize: 11.h, color: Colors.white),
                                  )),
                                ),
                              ),
                              //   Área branca do card ----------------------
                              Padding(
                                padding: EdgeInsets.only(top: 8.h, bottom: 8.h, left: 8.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    //      Linha Superior do card------------------
                                    Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            // height: 40.h,
                                            // width: 178.w,
                                            //  color: Colors.red,
                                            child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8.0),
                                              child: Text(
                                                'Revenda do Gás',
                                                style: TextStyle(
                                                  fontSize: 11.h,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                        // Banner melhor preço ---------------------------
                                        Container(
                                          // height: 26.h,
                                          // width: 83.w,
                                          decoration: BoxDecoration(
                                            color: Color(laranja),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(7.h),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Icon(
                                                  Icons.label,
                                                  size: 15.h,
                                                  color: Colors.white,
                                                ),
                                                Text(
                                                  'Melhor Preço',
                                                  style: TextStyle(fontSize: 8.5.h, color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8.h),

                                    //      Linha inferior do card ------------------
                                    Row(
                                      children: [
                                        Container(
                                          // height: 50.h,
                                          // width: 50.w,
                                          color: Colors.amber,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Nota", style: TextStyle(fontSize: 11.h, color: Color(cinza))),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text("4.6", style: TextStyle(fontSize: 20.h)),
                                                  Icon(
                                                    Icons.star,
                                                    size: 15.h,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Container(
                                          // height: 50.h,
                                          // width: 90.w,
                                          color: Colors.amber,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Tempo Médio", style: TextStyle(fontSize: 11.h, color: Color(cinza))),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Text("30-45", style: TextStyle(fontSize: 20.h)),
                                                  Text("min", style: TextStyle(fontSize: 10.h, color: Color(cinza))),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Container(
                                          // height: 50.h,
                                          // width: 90.w,
                                          color: Colors.amber,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text("Preço", style: TextStyle(fontSize: 11.h, color: Color(cinza))),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text('R\$ 72,00', style: TextStyle(fontSize: 20.h)),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Column(
                children: [
                  Text(x.toStringAsFixed(2)),
                  Text(y.toStringAsFixed(2)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
