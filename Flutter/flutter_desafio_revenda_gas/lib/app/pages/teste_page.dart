import 'package:flutter/material.dart';
import 'package:flutter_desafio_revenda_gas/app/my_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestePage extends StatelessWidget {
  const TestePage({Key key}) : super(key: key);

  static String routerName = '/teste_page';

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

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Teste page',
          style: TextStyle(fontSize: 16.h),
        ),
        toolbarHeight: 60.h,
        actions: [],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.w, 15.h, 10.w, 0),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Marcas de Gas ---------------------
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RotatedBox(
                    quarterTurns: -1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                        color: Color(MyColors.azul),
                      ),
                      height: 30.w,
                      width: 90.h,
                      child: Center(
                        child: Text(
                          'Multimarcas',
                          style: TextStyle(fontSize: 11.h, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //
              // Área Branca
              SizedBox(
                //  -30 é a lagura do Banner Marca do gás
                //  -20 é a soma padding inicial left + right
                width: MediaQuery.of(context).size.width - 30.w - 20.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //
                    // Linha Superior
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 15.h, left: 8.w, bottom: 15.h),
                          child: Text(
                            'Revenda do Gás',
                            style: TextStyle(
                              fontSize: 11.h,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(MyColors.laranja),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
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
                                SizedBox(width: 7.w),
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
                    //
                    //  linha inferior
                    Padding(
                      padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 8.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //
                          //  Nota
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Nota", style: TextStyle(fontSize: 11.h, color: Color(MyColors.cinza))),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Row(
                                  children: [
                                    Text("4.6",
                                        style: TextStyle(
                                          fontSize: 18.h,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Stack(
                                      alignment: AlignmentDirectional.center,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 18.h,
                                          color: Color(MyColors.cinza),
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 12.h,
                                          color: Colors.yellow,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          //  Tempo Médio
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Tempo Médio", style: TextStyle(fontSize: 11.h, color: Color(MyColors.cinza))),
                                SizedBox(height: 3.h),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("30-45",
                                        style: TextStyle(
                                          fontSize: 18.h,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 0.5.h),
                                      child: Text("min", style: TextStyle(fontSize: 10.h, color: Color(MyColors.cinza))),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          //  Preço
                          Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Preço", style: TextStyle(fontSize: 11.h, color: Color(MyColors.cinza))),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Text('R\$ 72,00',
                                    style: TextStyle(
                                      fontSize: 18.h,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
