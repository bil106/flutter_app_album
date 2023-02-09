import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int count;
  final int total;
  final Function onClearState;
  const Result(
      {super.key,
      required this.count,
      required this.total,
      required this.onClearState});

  @override
  Widget build(BuildContext context) {
    String msg = '';
    Widget img;
    if (0 <= count && count <= 3) {
      msg = 'Text for first message';
      img = Image.asset('assets/images/cat-1424748_960_720.png');
    } else if (4 <= count && count <= 7) {
      msg = 'Text for second message';
      img = Image.asset('assets/images/cat-3386220__340.png');
    } else {
      msg = 'Text for three message';
      img = Image.asset('assets/images/tiger-160601_960_720.png');
    }
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 15.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 5.0),
            )
          ],
          borderRadius: BorderRadius.circular(30.0),
          gradient: const LinearGradient(colors: <Color>[
            Color(0xFF5337ff),
            Color(0xFF8131ff),
            Color(0xFFbd27ff),
          ])),
      child: Column(
        children: <Widget>[
          SizedBox(
            width: 120,
            height: 120,
            child: FittedBox(
              fit: BoxFit.contain,
              child: img,
            ),
          ),
          Container(
            child: Text(
              msg,
              textAlign: TextAlign.center,
            ),
          ),
          const Divider(
            color: Colors.white,
          ),
          Text(
            'Riht to answer on $count from $total',
          ),
          const Divider(
            color: Colors.white,
          ),
        TextButton(onPressed: onClearState(),child: const Text('Repeat test'),),
        ],
      ),
    );
  }
}
