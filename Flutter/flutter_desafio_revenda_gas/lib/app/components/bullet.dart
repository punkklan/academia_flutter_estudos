import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_desafio_revenda_gas/app/pages/my_colors.dart';

class Bullet extends StatelessWidget {
  final String label;
  final bool enabled;

  const Bullet({
    this.label,
    this.enabled,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height,
        ),
        //! informa aqui o tamanho da tela e orientação que foi utilizada para o desenvolvimento
        designSize: Size(313, 663),
        orientation: Orientation.portrait);
    return Column(
      children: [
        Container(
          width: 16.w,
          height: 16.h,
          margin: EdgeInsets.only(bottom: 10.r),
          decoration: BoxDecoration(
            color: enabled ? Color(MyColors.azul) : Colors.white,
            shape: BoxShape.circle,
            border: !enabled ? Border.all(color: Colors.grey) : null,
            boxShadow: enabled
                ? [
                    BoxShadow(
                      color: enabled ? Colors.grey[300] : Color(MyColors.azul),
                      blurRadius: 3,
                      spreadRadius: 8.r,
                    ),
                  ]
                : null,
          ),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 12.r),
        ),
      ],
    );
  }
}
