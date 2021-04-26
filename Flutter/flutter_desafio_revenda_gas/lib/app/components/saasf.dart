import 'package:flutter/material.dart';

class Texto extends StatelessWidget {
  final String data;
  const Texto({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: Text(data),
    );
  }
}
