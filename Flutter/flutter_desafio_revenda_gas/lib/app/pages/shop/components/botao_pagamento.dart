import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BotaoPagamento extends StatelessWidget {
  const BotaoPagamento({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 61.r,
      width: 190.r,
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Colors.lightBlue[400], Colors.blue[800]],
        ),
      ),
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: StadiumBorder(),
        child: Text(
          'IR PARA O PAGAMENTO',
          style: TextStyle(
            fontSize: 13.r,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () => print('Botão \'IR PARAMENTO\'  pressionado'),
      ),
    );
  }
}
