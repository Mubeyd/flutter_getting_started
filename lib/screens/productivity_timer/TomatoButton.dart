import 'package:flutter/material.dart';

class TomatoButton extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final VoidCallback onPressed;

  const TomatoButton(this.color, this.text, this.onPressed, this.size);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(text, style: const TextStyle(color: Colors.white)),
      onPressed: onPressed,
      color: color,
      minWidth: size,
    );
  }
}
