import 'package:flutter/material.dart';

class MyFlex extends StatelessWidget {
  const MyFlex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Albums')),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        BiggerColorBox(),
        Flexible(fit: FlexFit.loose, flex: 1, child: ColorBox()),
        Expanded(flex: 1, child: ColorBox()),
        Container(
          color: Colors.red[400],
          width: 150,
          child: const Text(
            'text',
            style: TextStyle(fontSize: 30, color: Colors.black54),
            softWrap: true,
            textAlign: TextAlign.center,
            overflow: TextOverflow.fade,
          ),
        ),
        const Icon(
          Icons.favorite,
          size: 80,
          color: Color.fromARGB(255, 99, 238, 71),
        )
      ]),
    );
  }
}

class ColorBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.redAccent[400],
        border: Border.all(),
      ),
      child: const Text('123'),
    );
  }
}

class BiggerColorBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 110,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.green[500],
          border: Border.all(),
        ));
  }
}
