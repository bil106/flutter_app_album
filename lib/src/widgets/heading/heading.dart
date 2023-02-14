import 'package:flutter/material.dart';
import 'package:flutter_app/src/presentation/shared/style.dart';

class Heading extends StatelessWidget {
  const Heading({
    super.key,
    required this.text,
    this.color,
  });
  
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: headingStyle(color),
      overflow: TextOverflow.clip,
    );
  }
}
