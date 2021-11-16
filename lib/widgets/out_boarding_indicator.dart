import 'package:flutter/material.dart';

class out_boarding_indicator extends StatelessWidget {
  final double marginEnd;
  final bool selected;

  out_boarding_indicator({this.marginEnd = 0, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: selected ? Color(0xFF4A5CD0) : Colors.grey,
        borderRadius: BorderRadius.circular(10)
      ),
      margin: EdgeInsetsDirectional.only(end: marginEnd),
      height: 5,
      width: 23,
    );
  }
}
