import 'package:flutter/material.dart';
import 'package:flutter_desafio_revenda_gas/app/my_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({Key key}) : super(key: key);

  static String routerName = '/shopping_page';

  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  double _valorTotal = 0;
  int _unidades = 1;
  double _valor = 74.90;

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    _unidadesMais() {
      _unidades++;
      _valorTotal = _valor * _unidades;
      print('Valor Total $_valorTotal');
      setState(() {});
    }

    _unidadesMenos() {
      _unidades <= 0 ? _unidades = 0 : _unidades--;
      _valorTotal = _valor * _unidades;
      print('Valor Total $_valorTotal');
      setState(() {});
    }

    ScreenUtil.init(
        BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height,
        ),
        //! informa aqui o tamanho da tela e orientação que foi utilizada para o desenvolvimento
        designSize: Size(313, 663),
        orientation: Orientation.portrait);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Selecionar Produtos',
          style: TextStyle(fontSize: 16.h),
        ),
        toolbarHeight: 60.h,
        actions: [
          InkWell(
            onTap: () {},
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
                  //! ------------------------------   Barra Step Shop  -----------------------------
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 13.w),
                    color: Colors.white,
                    height: 85.h,
                    width: ScreenUtil().screenWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 16.w,
                              height: 16.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(MyColors.azul),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(MyColors.cinzaFundo),
                                    spreadRadius: 8.w,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 1,
                              width: 50.w,
                              color: Colors.grey[300],
                            ),
                            Container(
                              width: 16.w,
                              height: 16.h,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Color(MyColors.cinza),
                                  )
                                  // /  color: Color(MyColors.azul),
                                  ),
                            ),
                            Container(
                              height: 1,
                              width: 50.w,
                              color: Colors.grey[300],
                            ),
                            Container(
                              width: 16.w,
                              height: 16.h,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Color(MyColors.cinza),
                                  )
                                  // /  color: Color(MyColors.azul),
                                  ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Comprar',
                                style: TextStyle(fontSize: 12.w),
                              ),
                              Text(
                                'Pagamento',
                                style: TextStyle(fontSize: 12.w),
                              ),
                              Text(
                                'Confirmação',
                                style: TextStyle(fontSize: 12.w),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 2.h,
                  ),

                  //! ------------------------------   Barra Produto Selecionado  -----------------------------
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 11.5.h, vertical: 11.5.w),
                              child: Container(
                                width: 24.w,
                                height: 24.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                                child: Center(
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                      fontSize: 12.h,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'Unigas - Botijão de 13kg',
                              style: TextStyle(
                                fontSize: 12.h,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(right: 11.5.w),
                            child: Text(
                              'R\$ ${_valorTotal.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 16.h,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //! ------------------------------   Card Produto  -----------------------------
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //! -------------------  Card Produto - Linha Superior  ------------------------------
                              Padding(
                                padding: EdgeInsets.only(left: 10.w, top: 15.h, bottom: 15.h),
                                child: Icon(
                                  Icons.home,
                                  size: 32.h,
                                  color: Color(MyColors.cinza),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 5.h),
                                    child: Text(
                                      'Unigas',
                                      style: TextStyle(fontSize: 12.h),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '4.5',
                                        style: TextStyle(fontSize: 12.h),
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 9.h,
                                        color: Color(MyColors.laranja),
                                      ),
                                      SizedBox(width: 20.w),
                                      Text(
                                        '30-45 min',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                                child: Container(
                                  color: Colors.black,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                                    child: Text(
                                      'Multimarcas',
                                      style: TextStyle(color: Colors.white, fontSize: 10.h),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //! --------------------  Card Produto - Linha que separa  ------------------------------
                          Container(
                            height: 2.h,
                            color: Color(MyColors.cinzaFundo),
                          ),
                          //! --------------------  Card Produto - Linha Inferior  ------------------------------
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Itens da esquerda
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 15.0.h),
                                child: Column(
                                  children: [
                                    Text(
                                      'Botijão de 13kg',
                                      style: TextStyle(fontSize: 12.h),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 3.h),
                                      child: Text(
                                        'Unigas',
                                        style: TextStyle(fontSize: 12.h),
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 3.w, bottom: 2.w),
                                          child: Text(
                                            'R\$',
                                            style: TextStyle(
                                              fontSize: 8.h,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '${_valor.toStringAsFixed(2)}',
                                          style: TextStyle(
                                            fontSize: 16.h,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              //! ------------------------------  Itens da direita  ------------------------------
                              Row(
                                children: [
                                  //!  ------------------------------  Botão menos   ------------------------------
                                  InkWell(
                                    onTap: () => _unidadesMenos(),
                                    child: Stack(
                                      alignment: AlignmentDirectional.bottomCenter,
                                      children: [
                                        Container(
                                          height: 25.h,
                                          width: 25.w,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(MyColors.cinza),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 2.0.h,
                                          child: Text(
                                            '-',
                                            style: TextStyle(color: Colors.black, fontSize: 20.h),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //! ------------------------------  Botijão de Gás   ------------------------------
                                  Stack(
                                    alignment: AlignmentDirectional.bottomCenter,
                                    children: [
                                      Image.asset(
                                        'assets/prod_icon-gas.png',
                                        height: 62.h,
                                        width: 62.w,
                                        fit: BoxFit.contain,
                                      ),
                                      Positioned(
                                        bottom: 17.h,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(8)),
                                            color: Color(MyColors.laranja),
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(vertical: 1.8.h, horizontal: 1.8.w),
                                              child: Text(
                                                '$_unidades',
                                                style: TextStyle(color: Colors.black, fontSize: 15.h),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  //!  ------------------------------  botão mais   ------------------------------
                                  InkWell(
                                    onTap: () => _unidadesMais(),
                                    child: Stack(
                                      alignment: AlignmentDirectional.bottomCenter,
                                      children: [
                                        Container(
                                          height: 25.h,
                                          width: 25.w,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(MyColors.cinza),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 2.0.h,
                                          child: Text(
                                            '+',
                                            style: TextStyle(color: Colors.black, fontSize: 20.h),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                  Expanded(child: SizedBox()),
                  //! --------------------  Botão IR PARA O PAGAMENTO  ------------------------------
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 38.h),
                    child: InkWell(
                      onTap: () => print('Botão \'IR PARAMENTO\'  pressionado'),
                      child: Container(
                        height: 61.h,
                        width: 190.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100.0)),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.lightBlue[400], Colors.blue[800]],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'IR PARA O PAGAMENTO',
                            style: TextStyle(
                              fontSize: 13.h,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
