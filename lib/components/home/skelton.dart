import 'package:flutter/material.dart';

class Skelton extends StatelessWidget {
  final double? height, widget;
  const Skelton({super.key, this.height, this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: widget,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius: const BorderRadius.all(Radius.circular(16))),
    );
  }
}
