

import 'package:flutter/widgets.dart';
import 'package:flutter_app/src/presentation/shared/style.dart';

class Body extends StatelessWidget {
  const Body({super.key, this.text, this.color});
final String? text;
final Color? color;
  @override
  Widget build(BuildContext context) {

    
    return Text(text ?? '',style: bodyStyle(color),);
  }
}