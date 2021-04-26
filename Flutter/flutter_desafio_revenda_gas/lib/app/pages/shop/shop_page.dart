import 'package:flutter/material.dart';
import 'package:flutter_desafio_revenda_gas/app/components/bullet.dart';
import 'package:flutter_desafio_revenda_gas/app/pages/my_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key key}) : super(key: key);

  static String routerName = '/shopping_page';

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
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
      backgroundColor: Color(MyColors.cinzaFundo),
      appBar: AppBar(
        title: Text(
          'Selecionar Produtos',
          style: TextStyle(fontSize: 16.r),
        ),
        toolbarHeight: 60.r,
        actions: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.r, horizontal: 23.r),
              child: Text(
                '?',
                style: TextStyle(color: Colors.white, fontSize: 24.r),
              ),
            ),
          ),
        ],
      ),
      body: !isPortrait
          ? Center(child: Text('Desculpe, utilize no modo retrato.'))
          : Column(
              children: [
                //! ------------------------------   Barra Step Shop  -----------------------------

                Container(
                  padding: EdgeInsets.all(15.r),
                  color: Colors.white,
                  width: ScreenUtil().screenWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 6.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Bullet(
                            label: 'Comprar',
                            enabled: true,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 23.r),
                              child: Container(
                                height: 1.5.h,
                                color: Color(MyColors.cinzaFundo),
                              ),
                            ),
                          ),
                          const Bullet(
                            label: 'Pagamento',
                            enabled: false,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 23.r),
                              child: Container(
                                height: 1.5.h,
                                color: Color(MyColors.cinzaFundo),
                              ),
                            ),
                          ),
                          const Bullet(
                            label: 'Confirmação',
                            enabled: false,
                          ),
                        ],
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
                            padding: EdgeInsets.all(11.5.r),
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
                                  style: TextStyle(fontSize: 12.r, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Unigas - Botijão de 13kg',
                            style: TextStyle(fontSize: 12.r),
                          ),
                        ],
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(right: 11.5.w),
                          child: Text(
                            'R\$ ${_valorTotal.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 16.r, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //! ------------------------------   Card Produto  -----------------------------
                Padding(
                  padding: EdgeInsets.all(15.r),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
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
                                size: 32.r,
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
                                    style: TextStyle(fontSize: 12.r),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '4.5',
                                      style: TextStyle(fontSize: 12.r),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 9.r,
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
                              padding: EdgeInsets.all(5.r),
                              child: Container(
                                color: Colors.black,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                                  child: Text(
                                    'Multimarcas',
                                    style: TextStyle(color: Colors.white, fontSize: 10.r),
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Itens da esquerda
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.0.h),
                              child: Column(
                                children: [
                                  Text(
                                    'Botijão de 13kg',
                                    style: TextStyle(fontSize: 12.r),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 3.h),
                                    child: Text(
                                      'Unigas',
                                      style: TextStyle(fontSize: 12.r),
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
                                            fontSize: 8.r,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '${_valor.toStringAsFixed(2)}',
                                        style: TextStyle(
                                          fontSize: 16.r,
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
                                        height: 25.r,
                                        width: 25.r,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(MyColors.cinza),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 2.0.r,
                                        child: Text(
                                          '-',
                                          style: TextStyle(color: Colors.black, fontSize: 20.r),
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
                                      height: 62.r,
                                      width: 62.r,
                                      fit: BoxFit.contain,
                                    ),
                                    Positioned(
                                      bottom: 17.r,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                                          color: Color(MyColors.laranja),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(1.8.r),
                                            child: Text(
                                              '$_unidades',
                                              style: TextStyle(color: Colors.black, fontSize: 15.r),
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
                                        height: 25.r,
                                        width: 25.r,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(MyColors.cinza),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 2.0.r,
                                        child: Text(
                                          '+',
                                          style: TextStyle(color: Colors.black, fontSize: 20.r),
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
                      height: 61.r,
                      width: 190.r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100.0.r)),
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
                            fontSize: 13.r,
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
    );
  }
}
