import 'package:flutter/material.dart';
import 'package:flutter_desafio_revenda_gas/app/model/revenda_model.dart';
import 'package:flutter_desafio_revenda_gas/app/pages/home/components/tag_melhor_preco.dart';
import 'package:flutter_desafio_revenda_gas/app/pages/my_colors.dart';
import 'package:flutter_desafio_revenda_gas/app/pages/shop/shop_page.dart';
import 'package:flutter_desafio_revenda_gas/app/repositories/revendas_repository.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListaRevenderes extends StatefulWidget {
  const ListaRevenderes({
    Key key,
  }) : super(key: key);

  @override
  _ListaRevenderesState createState() => _ListaRevenderesState();
}

class _ListaRevenderesState extends State<ListaRevenderes> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<RevendaModel>>(
        future: RevendasRepository().buscarTodasRevendas(),
        builder: (_, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Container();
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
            case ConnectionState.active:
              var data = snapshot.data;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (_, index) {
                    return _buildRevenda(data[index]);
                  });
            default:
              return Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }

  Widget _buildRevenda(RevendaModel revenda) {
    return Container(
      height: 90.r,
      width: ScreenUtil().screenWidth,
      margin: EdgeInsets.only(top: 15.w, left: 15.h, right: 15.h),
      child: InkWell(
        onTap: () {
          print('Navigator Shopping Page');
          Navigator.of(context).pushNamed(ShopPage.routerName, arguments: revenda);
        },
        child: Row(
          children: [
            _tipoGas(revenda),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(8.r), bottomRight: Radius.circular(8.r)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 12.r,
                          ),
                          child: Text(
                            revenda.nome,
                            style: TextStyle(
                              fontSize: 12.r,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Visibility(visible: revenda.melhorPreco, child: TagMelhorPreco()),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _nota(revenda),
                        _tempoMedio(revenda),
                        _preco(revenda),
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

  Widget _tipoGas(RevendaModel revenda) {
    return Column(
      children: [
        Container(
          height: 90.r,
          width: 30.r,
          decoration: BoxDecoration(
            color: Color(int.parse('0xFF' + revenda.cor)),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(8.r), bottomLeft: Radius.circular(8.r)),
          ),
          child: RotatedBox(
            quarterTurns: -1,
            child: Center(
              child: Text(
                revenda.tipo,
                style: TextStyle(fontSize: 11.r, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _nota(RevendaModel revenda) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Nota", style: TextStyle(fontSize: 11.r, color: Color(MyColors.cinza))),
        SizedBox(height: 3.h),
        Row(
          children: [
            Text(revenda.nota.toString(),
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
    );
  }

  Widget _tempoMedio(RevendaModel revenda) {
    return Column(
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
                text: revenda.tempoMedio,
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
    );
  }

  Widget _preco(RevendaModel revenda) {
    return Column(
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
          ('R\$ ' + revenda.preco.toStringAsFixed(2).replaceAll('.', ',')),
          style: TextStyle(fontSize: 18.r, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
