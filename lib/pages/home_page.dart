import 'package:flutter/material.dart';
import 'package:flutter_app/models/question.dart';
import 'package:flutter_app/widgets/answer.dart';
import 'package:flutter_app/widgets/progress_bar.dart';
import 'package:flutter_app/widgets/result.dart';
import 'package:flutter_app/widgets/scool.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final QuestionData data = QuestionData();
  int _countResult = 0;
  int _questionIndex = 0;

  List<Icon> _icons = []; //Icons for progressBar

  void _clearState() => setState(() {
        // Metod obnulenija State
        _questionIndex = 0;
        _countResult = 0;
        _icons = [];
      });

//Made function update state answer and progressBar
  void _onChangeAnswer(bool isCorrect) => setState(() {
        if (isCorrect) {
          _icons.add(const Icon(
            Icons.brightness_1,
            color: Colors.greenAccent,
          ));
          _countResult++;
        } else {
          _icons.add(const Icon(
            Icons.brightness_1,
            color: Colors.grey,
          ));
          _questionIndex++;
        }
      });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('New app')),
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
              color: Color(0xff2a375a),
              image: DecorationImage(
                image: AssetImage('assets/images/lake-5848868_960_720.jpg'),
                fit: BoxFit.cover,
              )),
          child: Column(
            children: <Widget>[

              ProgressBar(
                icons: _icons,
                count: _questionIndex,
                total: data.questions.length,
              ),
              
              _questionIndex < data.questions.length
                  ? Scool(
                      index: _questionIndex,
                      questionData: data,
                      onChangeAnswer: _onChangeAnswer,
                    )
                  : Result(
                      count: _countResult,
                      total: data.questions.length,
                      onClearState: _clearState,
                    )
            ],
          ),
        ));
  }
}
