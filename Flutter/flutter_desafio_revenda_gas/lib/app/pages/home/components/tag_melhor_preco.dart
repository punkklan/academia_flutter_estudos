import 'package:flutter/material.dart';
import 'package:flutter_desafio_revenda_gas/app/pages/my_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TagMelhorPreco extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height,
        ),
        //! informe aqui o tamanho da tela e orientação que foi utilizada para o desenvolvimento
        designSize: Size(313, 663),
        orientation: Orientation.portrait);
    return Container(
      decoration: BoxDecoration(
        color: Color(MyColors.laranja),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5.r),
          bottomLeft: Radius.circular(5.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(5.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.label,
              size: 15.r,
              color: Colors.white,
            ),
            SizedBox(width: 5.w),
            Text(
              'Melhor Preço',
              style: TextStyle(fontSize: 8.5.r, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
