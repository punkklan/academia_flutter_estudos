import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ValueAnimation extends ImplicitlyAnimatedWidget {
  final double value;
  ValueAnimation({Key key, this.value})
      : super(
          key: key,
          duration: Duration(milliseconds: 250),
          curve: Curves.linear,
        );

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() => _ValueAnimation();
}

class _ValueAnimation extends AnimatedWidgetBaseState<ValueAnimation> {
  Tween _count;

  @override
  Widget build(BuildContext context) {
    double value = _count.evaluate(animation);
    return RichText(
      text: TextSpan(
        style: TextStyle(color: Colors.black),
        children: [
          TextSpan(
            text: 'R\$ ',
            style: TextStyle(
              fontSize: 10.r,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: value.toStringAsFixed(2).replaceAll('.', ','),
            style: TextStyle(
              fontSize: 16.r,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void forEachTween(TweenVisitor visitor) {
    _count = visitor(_count, widget.value, (dynamic value) => Tween(begin: value));
  }
}
