import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_desafio_revenda_gas/app/my_colors.dart';
import 'package:flutter_desafio_revenda_gas/app/pages/shopping_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  static String routerName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> revendedores;
  //!
  //!
  //!    CORRIGIR INICIALIZAÇÃO - AINDA NECESSARIO HOT REALOAD PARA A LISTA FICAR VISÍVEL
  //!
  //!

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/dados.json').then((jsonData) {
      revendedores = json.decode(jsonData);
    });
  }

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    ScreenUtil.init(BoxConstraints(maxWidth: MediaQuery.of(context).size.width, maxHeight: MediaQuery.of(context).size.height),
        //! informe aqui o tamanho da tela e orientação que foi utilizada para o desenvolvimento
        designSize: Size(313, 663),
        orientation: Orientation.portrait);

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
              onTap: () {
                setState(() {});
              },
              child: SizedBox(
                  width: 60,
                  child: Icon(
                    Icons.import_export,
                    size: 24.h,
                  )),
            ),
            InkWell(
              onTap: () {
                setState(() {});
                print('Botão  ?   pressionado');
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 23.h),
                child: Text(
                  '?',
                  style: TextStyle(color: Colors.white, fontSize: 24.h),
                ),
              ),
            ),
          ],
        ),
        body: !isPortrait
            ? Center(child: Text('Desculpe, utilize no modo retrato.'))
            : Container(
                color: Color(MyColors.cinzaFundo),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 13.w),
                      color: Colors.white,
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
                                  color: Color(MyColors.cinza),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 3.h, bottom: 1.h),
                                child: Text(
                                  'Av Paulista, 1001',
                                  style: TextStyle(
                                    fontSize: 14.h,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                'Paulista, São Paulo, Sp',
                                style: TextStyle(
                                  fontSize: 11.h,
                                  color: Color(MyColors.cinza),
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () => print('Click Mudar'),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Color(MyColors.azul),
                                  size: 24.h,
                                ),
                                Container(height: 2.h),
                                Text(
                                  'Mudar',
                                  style: TextStyle(
                                    fontSize: 11.h,
                                    color: Color(MyColors.azul),
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
                        itemCount: revendedores?.length ?? 0,
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: EdgeInsets.fromLTRB(10.w, 15.h, 10.w, 0),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  //!  --------------    Marcas de Gas ---------------------
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
                                            color: Color(int.parse('0xFF' + revendedores[index]['cor'])),
                                          ),
                                          height: 30.w,
                                          width: 95.h,
                                          child: Center(
                                            child: Text(
                                              revendedores[index]['tipo'],
                                              style: TextStyle(fontSize: 11.h, color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  //!   --------------     Área Branca   --------------
                                  InkWell(
                                    onTap: () {
                                      print('Navigator Shopping Page');
                                      Navigator.of(context).pushNamed(ShoppingPage.routerName);
                                    },
                                    child: Container(
                                      //  -30 é a lagura do Banner Marca do gás
                                      //  -20 é a soma padding inicial left + right
                                      width: MediaQuery.of(context).size.width - 30.w - 20.w,
                                      height: 95.h,
                                      color: Colors.white,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          //!  -------------- Linha Superior  --------------
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(top: 18.h, left: 8.w, bottom: 15.h),
                                                child: Text(
                                                  revendedores[index]['nome'],
                                                  style: TextStyle(
                                                    fontSize: 12.h,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              revendedores[index]['melhorPreco']
                                                  ? Container(
                                                      decoration: BoxDecoration(
                                                        color: Color(MyColors.laranja),
                                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(5.h),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                          children: [
                                                            Icon(
                                                              Icons.label,
                                                              size: 15.h,
                                                              color: Colors.white,
                                                            ),
                                                            SizedBox(width: 5.w),
                                                            Text(
                                                              'Melhor Preço',
                                                              style: TextStyle(fontSize: 8.5.h, color: Colors.white),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                          //!  --------------  linha inferior --------------
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
                                                          Text(revendedores[index]['nota'].toString(),
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
                                                //! --------------  Tempo Médio --------------
                                                Container(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        "Tempo Médio",
                                                        style: TextStyle(
                                                          fontSize: 11.h,
                                                          color: Color(MyColors.cinza),
                                                        ),
                                                      ),
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
                                                            padding: EdgeInsets.only(bottom: 1.2.h),
                                                            child: Text(
                                                              "min",
                                                              style: TextStyle(
                                                                fontSize: 10.h,
                                                                color: Color(MyColors.cinza),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                //! --------------   Preço  --------------
                                                Container(
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        "Preço",
                                                        style: TextStyle(
                                                          fontSize: 11.h,
                                                          color: Color(MyColors.cinza),
                                                        ),
                                                      ),
                                                      SizedBox(height: 3.h),
                                                      Text(('R\$ ' + revendedores[index]['preco'].toStringAsFixed(2)),
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
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
