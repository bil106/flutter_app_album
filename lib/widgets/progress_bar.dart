import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final icons;
  final count;
  final total;

  ProgressBar({super.key, this.icons, this.count, this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          FittedBox(
            fit: BoxFit.contain,
            child: Text('$count - $total ',style:const TextStyle(fontSize: 18,color: Colors.yellowAccent),),
            
          ),
        const  SizedBox(width: 10),

        ...icons,
        ],
      ),
    );
  }
}
