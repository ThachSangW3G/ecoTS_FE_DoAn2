import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final double size;
  final Color color;
  const Circle({super.key, required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)), color: color),
    );
  }
}
