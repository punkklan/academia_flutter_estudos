import 'package:flutter/material.dart';
import 'package:flutter_desafio_revenda_gas/app/pages/my_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnderecoUsuario extends StatelessWidget {
  const EnderecoUsuario({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
