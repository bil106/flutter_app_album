import 'package:flutter/material.dart';

import 'answer.dart';

class Scool extends StatelessWidget {
  final index;
  final questionData;
  final onChangeAnswer;
  const Scool({super.key, this.index, this.questionData, this.onChangeAnswer});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
        Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            questionData.questions[index].title,
            style: Theme.of(context).textTheme.caption,
          ),
        ),
        ...questionData.questions[index].answers
            .map(
              (value) => Answer(
                title: value['answer'],
                isCorrect: value.containsKey('isCorrect') ? true : false,
                onChangeAnswer: onChangeAnswer,
              ),
            )
            .toList(),
      ],);
  }
}
