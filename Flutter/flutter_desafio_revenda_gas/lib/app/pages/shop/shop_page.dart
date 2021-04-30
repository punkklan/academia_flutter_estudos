import 'package:flutter/material.dart';
import 'package:flutter_desafio_revenda_gas/app/model/revenda_model.dart';
import 'package:flutter_desafio_revenda_gas/app/pages/shop/components/bullet.dart';
import 'package:flutter_desafio_revenda_gas/app/pages/my_colors.dart';
import 'package:flutter_desafio_revenda_gas/app/pages/shop/components/botao_pagamento.dart';
import 'package:flutter_desafio_revenda_gas/app/pages/shop/components/value_animation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopPage extends StatefulWidget {
  final RevendaModel revenda;

  static String routerName = '/shopping_page';

  const ShopPage({
    Key key,
    @required this.revenda,
  }) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState(revenda: revenda);
}

class _ShopPageState extends State<ShopPage> {
  final RevendaModel revenda;
  int _totalProduto = 1;
  double _valorTotal;

  _ShopPageState({@required this.revenda}) : this._valorTotal = revenda.preco;
  void adicionarProduto() {
    setState(() {
      _totalProduto++;
      _valorTotal = _totalProduto * revenda.preco;
    });
  }

  void removerProduto() {
    if (_totalProduto > 0) {
      setState(() {
        _totalProduto--;
        _valorTotal = _totalProduto * revenda.preco;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

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
                _buildStepShop(),
                _buildBoxRevenda(),
                _buildProdutoDaRevenda(),
                Expanded(child: SizedBox()),
                Padding(
                  padding: EdgeInsets.only(bottom: 15.r),
                  child: BotaoPagamento(),
                ),
              ],
            ),
    );
  }

  Widget _buildProdutoDaRevenda() {
    return Container(
      margin: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.w, top: 15.h, bottom: 15.h),
                child: Icon(Icons.home, size: 32.r, color: Color(MyColors.cinza)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: Text(
                      revenda.nome,
                      style: TextStyle(fontSize: 12.r),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        revenda.nota.toString().replaceAll('.', ','),
                        style: TextStyle(fontSize: 12.r),
                      ),
                      Icon(Icons.star, size: 9.r, color: Color(MyColors.laranja)),
                      SizedBox(width: 20.w),
                      Text(revenda.tempoMedio + ' min'),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5.r),
                child: Container(
                  color: Color(int.parse('0xFF' + revenda.cor)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    child: Text(revenda.tipo, style: TextStyle(color: Colors.white, fontSize: 10.r)),
                  ),
                ),
              ),
            ],
          ),
          Container(height: 2.h, color: Color(MyColors.cinzaFundo)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0.h),
                child: Column(
                  children: [
                    Text('Botijão de 13kg', style: TextStyle(fontSize: 12.r)),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 3.h),
                        child: Text(
                          revenda.nome,
                          style: TextStyle(fontSize: 12.r),
                        )),
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
                          revenda.preco.toStringAsFixed(2).replaceAll('.', ','),
                          style: TextStyle(fontSize: 16.r, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () => this.removerProduto(),
                    child: _botaoCinza('-'),
                  ),
                  _botijaoWidget(_totalProduto),
                  InkWell(
                    onTap: () => this.adicionarProduto(),
                    child: _botaoCinza('+'),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _botaoCinza(String textInteno) {
    return Stack(
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
            textInteno,
            style: TextStyle(color: Colors.black, fontSize: 20.r),
          ),
        ),
      ],
    );
  }

  Widget _botijaoWidget(int unidades) {
    return Stack(
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
                  '$unidades',
                  style: TextStyle(color: Colors.black, fontSize: 15.r),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStepShop() {
    return Container(
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
    );
  }

  Widget _buildBoxRevenda() {
    return Container(
      margin: EdgeInsets.only(top: 2.h),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(11.5.r),
                child: Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(int.parse('0xFF' + revenda.cor)),
                  ),
                  child: Center(
                    child: Text(
                      _totalProduto.toString(),
                      style: TextStyle(
                        fontSize: 12.r,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                '${revenda.nome} - Botijão 13kg',
                style: TextStyle(fontSize: 12.r),
              ),
            ],
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(right: 11.5.w),
              child: ValueAnimation(value: _valorTotal),
            ),
          ),
        ],
      ),
    );
  }
}
