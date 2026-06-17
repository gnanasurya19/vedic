import 'package:flutter/material.dart';
import 'package:vedic/core/extentions/style_extention.dart';

class NameProfile extends StatelessWidget {
  final double size;
  final Color color;
  final Text text;
  const NameProfile({
    super.key, required this.size, required this.color, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.style.scale * size,
      height: context.style.scale * size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: text,
      ),
    );
  }
}
