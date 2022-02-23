import 'package:flutter/material.dart';

class RegularText extends StatelessWidget {
  final double Size;
  final Color color;
  final String data;

  const RegularText(
      {Key? key, required this.Size, required this.color, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontFamily: 'Gilroy',
        overflow: TextOverflow.ellipsis,
        fontSize: Size,
        color: color,
      ),
    );
  }
}
