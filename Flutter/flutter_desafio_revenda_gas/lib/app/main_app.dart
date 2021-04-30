import 'package:flutter/material.dart';
import 'package:flutter_desafio_revenda_gas/app/model/revenda_model.dart';
import 'package:flutter_desafio_revenda_gas/app/pages/my_colors.dart';
import 'package:flutter_desafio_revenda_gas/app/pages/home/home_page.dart';
import 'package:flutter_desafio_revenda_gas/app/pages/shop/shop_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(313, 663),
      builder: () => MaterialApp(
        title: 'Revenda Gás',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Color(MyColors.azul)),
        initialRoute: HomePage.routerName,
        routes: {
          HomePage.routerName: (_) => HomePage(),
          ShopPage.routerName: (_) {
            var revenda = ModalRoute.of(_).settings.arguments as RevendaModel;
            return ShopPage(
              revenda: revenda,
            );
          },
        },
      ),
    );
  }
}
