import 'package:flutter/material.dart';

Widget exceptionStub(BuildContext context, Exception exception) {
  return Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
    Text(
      'Ooops! Error is ${exception.toString()}',
      style: Theme.of(context).textTheme.headlineMedium,
    ),
  ]);
}
