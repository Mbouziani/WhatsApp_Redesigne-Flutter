import 'package:flutter/material.dart';

class LargeText extends StatelessWidget {
  final double Size;
  final Color color;
  final String data;

  const LargeText(
      {Key? key, required this.Size, required this.color, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: Size,
        color: color,
      ),
    );
  }
}
