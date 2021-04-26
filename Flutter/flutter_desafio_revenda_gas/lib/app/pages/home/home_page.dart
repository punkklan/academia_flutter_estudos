import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_desafio_revenda_gas/app/pages/my_colors.dart';
import 'package:flutter_desafio_revenda_gas/app/pages/home/components/tag_melhor_preco.dart';
import 'package:flutter_desafio_revenda_gas/app/pages/shop/shop_page.dart';
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
    final List<String> filtros = ['Melhor Avaliação', 'Mais Rápido', 'Mais Barato'];
    ScreenUtil.init(
        BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height,
        ),
        //! informe aqui o tamanho da tela e orientação que foi utilizada para o desenvolvimento
        designSize: Size(313, 663),
        orientation: Orientation.portrait);

    return Scaffold(
      backgroundColor: Color(MyColors.cinzaFundo),
      appBar: AppBar(
        title: Text(
          'Escolha uma Revenda',
          style: TextStyle(fontSize: 16.r, fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 60.r,
        actions: <Widget>[
          PopupMenuButton(
            tooltip: 'Filtro',
            child: SizedBox(
              width: 30.w,
              child: Icon(
                Icons.import_export,
                size: 24.r,
              ),
            ),
            itemBuilder: (_) {
              return filtros.map((f) {
                return PopupMenuItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(f,
                          style: TextStyle(
                            fontSize: 10.r,
                          )),
                      Checkbox(
                        onChanged: (bool value) {},
                        value: false,
                      ),
                    ],
                  ),
                );
              }).toList();
            },
          ),
          PopupMenuButton(
            tooltip: 'Ajuda',
            child: SizedBox(
              width: 30.w,
              child: Center(
                child: Text(
                  '?',
                  style: TextStyle(color: Colors.white, fontSize: 24.r),
                ),
              ),
            ),
            itemBuilder: (_) {
              return [
                PopupMenuItem(
                  child: Text('Suporte', style: TextStyle(fontSize: 10.r, color: Color(MyColors.azul))),
                ),
                PopupMenuItem(
                  child: Text('Termos de Serviço', style: TextStyle(fontSize: 10.r, color: Color(MyColors.azul))),
                ),
              ];
            },
          ),
          SizedBox(
            width: 5.w,
          ),
        ],
      ),
      body: !isPortrait
          ? Center(child: Text('Desculpe, utilize no modo retrato.'))
          : Column(
              children: [
                //!  --------------------  Container com o endereço do cliente    -----------
                Container(
                  padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 13.w),
                  color: Colors.white,
                  width: ScreenUtil().screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Botijões de 13kg em:',
                              style: TextStyle(fontSize: 9.r, color: Color(MyColors.cinza)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 3.h, bottom: 1.h),
                              child: Text(
                                'Av Paulista, 1001',
                                style: TextStyle(fontSize: 14.r, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              'Paulista, São Paulo, Sp',
                              style: TextStyle(fontSize: 11.r, color: Color(MyColors.cinza)),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () => print('Click Mudar'),
                        child: Column(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Color(MyColors.azul),
                              size: 24.r,
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              'Mudar',
                              style: TextStyle(
                                fontSize: 11.r,
                                color: Color(MyColors.azul),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //!   ---------   Lista de Revendedores de gás  ----------------
                Expanded(
                  child: ListView.builder(
                    itemCount: revendedores?.length ?? 0,
                    itemBuilder: (_, index) {
                      return _buildRevenda(index, context);
                    },
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildRevenda(int index, BuildContext context) {
    return Container(
      height: 90.r,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      child: InkWell(
        onTap: () {
          print('Navigator Shopping Page');
          Navigator.of(context).pushNamed(ShopPage.routerName);
        },
        child: Row(
          children: [
            //!  --------------    Marcas de Gás  'tipo' ---------------------
            //          InkWell(
            Column(
              children: [
                Container(
                  height: 90.r,
                  width: 30.r,
                  decoration: BoxDecoration(
                    color: Color(int.parse('0xFF' + revendedores[index]['cor'])),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8.r), bottomLeft: Radius.circular(8.r)),
                  ),
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: Center(
                      child: Text(
                        revendedores[index]['tipo'],
                        style: TextStyle(fontSize: 11.r, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //!   --------------     Área Branca   --------------
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(8.r), bottomRight: Radius.circular(8.r)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //!  -------------- Linha Superior  --------------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 12.r,
                          ),
                          child: Text(
                            revendedores[index]['nome'],
                            style: TextStyle(
                              fontSize: 12.r,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        revendedores[index]['melhorPreco'] ? TagMelhorPreco() : SizedBox(),
                      ],
                    ),
                    //!  --------------  linha inferior --------------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //! --------------  Nota  --------------
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Nota", style: TextStyle(fontSize: 11.r, color: Color(MyColors.cinza))),
                            SizedBox(height: 3.h),
                            Row(
                              children: [
                                Text(revendedores[index]['nota'].toString(),
                                    style: TextStyle(
                                      fontSize: 18.r,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 18.r,
                                      color: Color(MyColors.cinza),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 12.r,
                                      color: Colors.yellow,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        //! --------------  Tempo Médio --------------
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tempo Médio",
                              style: TextStyle(
                                fontSize: 11.r,
                                color: Color(MyColors.cinza),
                              ),
                            ),
                            SizedBox(height: 3.h),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: revendedores[index]['tempoMedio'],
                                    style: TextStyle(fontSize: 18.r, fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: ' min',
                                    style: TextStyle(fontSize: 10.r, color: Color(MyColors.cinza)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        //! --------------   Preço  --------------
                        Column(
                          children: [
                            Text(
                              "Preço",
                              style: TextStyle(
                                fontSize: 11.r,
                                color: Color(MyColors.cinza),
                              ),
                            ),
                            SizedBox(height: 3.h),
                            Text(
                              ('R\$ ' + revendedores[index]['preco'].toStringAsFixed(2)),
                              style: TextStyle(
                                fontSize: 18.r,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
