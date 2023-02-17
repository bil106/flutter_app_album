import 'package:flutter/material.dart';

const Widget verticalSpaceSmall = SizedBox(
  height: 8,
);

const Widget verticalSpaceRegular = SizedBox(
  height: 16,
);

const Widget verticalSpaceMedium = SizedBox(
  height: 32,
);

const Widget verticalSpaceLarge = SizedBox(
  height: 48,
);

const EdgeInsets kHorizonalInsets = EdgeInsets.symmetric(horizontal: 12,vertical: 5);
const EdgeInsets kHorizonalLeftInsets = EdgeInsets.only(left: 10);
const NetworkImage image= NetworkImage(
                      'https://source.unsplash.com/random?');
const EdgeInsets kVerticalInsets =
    EdgeInsets.symmetric(horizontal: 0, vertical: 12);
const BorderRadius borderRadiusCircular = BorderRadius.all(Radius.circular(60/2));
// animation constants

const defaultAnimationDuration = Duration(milliseconds: 150);

showSnackBar(BuildContext context, String? message) {
  final snackBar =
      SnackBar(key: const Key('snack_bar_key'), content: Text(message ?? ''));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
