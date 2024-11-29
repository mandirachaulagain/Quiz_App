import 'question.dart';

class QuestionEngine {
  int _questionNumber = 0;

  final List<Question> _questionList = [
    Question(
      'What is the value of x in the equation 2x + 3 = 7?',
      ['1', '2', '3', '4'],
      '2',
      [-1, 1, -1, -1],
      'Isolate x by subtracting 3 from both sides and then divide by 2.',
    ),
    Question(
      'Simplify: 3x + 5x',
      ['5x', '6x', '7x', '8x'],
      '8x',
      [-1, -1, -1, 1],
      'Combine like terms. 3x + 5x = 8x.',
    ),
    Question(
      'If y = 2x and x = 3, what is the value of y?',
      ['3', '6', '9', '12'],
      '6',
      [-1, 1, -1, -1],
      'Substitute x = 3 into the equation y = 2x.',
    ),
    Question(
      'Solve for x: x/2 = 4',
      ['2', '4', '6', '8'],
      '8',
      [-1, -1, -1, 1],
      'Multiply both sides by 2 to get x.',
    ),
    Question(
      'Expand: (x + 2)(x + 3)',
      ['x² + 5x + 6', 'x² + 6x + 5', 'x² + 4x + 6', 'x² + 4x + 5'],
      'x² + 5x + 6',
      [1, -1, -1, -1],
      'Use the distributive property (FOIL method).',
    ),
  ];

  int getQuestionsCount() => _questionList.length;

  void nextQuestion() {
    if (_questionNumber < _questionList.length - 1) _questionNumber++;
  }

  String getQuestionTextForCurrentQuestion() => _questionList[_questionNumber].questionText;

  List<String> getAnswers() => _questionList[_questionNumber].answersList;

  List<int> getScoreFromAnswers() => _questionList[_questionNumber].answerWeight;

  String getCorrectAnswer() => _questionList[_questionNumber].correctAnswer;

  bool didFinishQuiz() => _questionNumber >= _questionList.length - 1;

  String getHint() => _questionList[_questionNumber].hint;

  void reset() => _questionNumber = 0;
}
