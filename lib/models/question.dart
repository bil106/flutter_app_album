//1 Создаем класс модели с двумя свойствами title-заголовок вопроса ,и список ответов(answer)



class Question {
  final String title; //список вопросов
  final List<Map> answers;//список ответов
//2 Создаем конструктор с именоваными и обязательными параметрами
  Question({
    required this.title,
    required this.answers,
  });
}

// 3 Создаем класс с данными c свойствами data где содержатся вопросы
class QuestionData {
  final _data = [

Question(title: 'Кем хочешь стать?',
answers: [
  {'answer':'Повар'},
  {'answer':'Рыбак'},
  {'answer':'Столяр','isCorrect':1},
  {'answer':'Бармен'},
  ]
),
Question(title: 'Кем  стал?', answers: [
      {'answer': 'Повар'},
      {'answer': 'Рыбак'},
      {'answer': 'Столяр', 'isCorrect': 1},
      {'answer': 'Бармен'},
    ]),
    Question(title: 'Кем быть?', answers: [
      {'answer': 'Повар'},
      {'answer': 'Рыбак'},
      {'answer': 'Столяр', 'isCorrect': 1},
      {'answer': 'Бармен'},
    ]),
    Question(title: 'Кто был?', answers: [
      {'answer': 'Повар'},
      {'answer': 'Рыбак'},
      {'answer': 'Столяр', 'isCorrect': 1},
      {'answer': 'Бармен'},
    ]),
    Question(title: 'Кто это?', answers: [
      {'answer': 'Повар'},
      {'answer': 'Рыбак'},
      {'answer': 'Столяр', 'isCorrect': 1},
      {'answer': 'Бармен'},
    ]),
  ];
  List<Question> get questions => [..._data];
}
