import 'package:flutter/material.dart';
import 'package:flutter_app/theme/colors.dart';

Widget loader(
  BuildContext context,
) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[CircularProgressIndicator(color: primary)]);
}
