import 'package:flutter/material.dart';
import 'package:quiz_app/question_engine.dart';
import 'results_screen.dart'; // Import Results Screen

QuestionEngine questionEngine = QuestionEngine();

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int score = 0;
  List<Map<String, dynamic>> userAnswers = [];

  void checkAnswer(String userSelectedAnswer, int weightValue) {
    String correctAnswer = questionEngine.getCorrectAnswer();

    setState(() {

      userAnswers.add({
        'question': questionEngine.getQuestionTextForCurrentQuestion(),
        'userAnswer': userSelectedAnswer,
        'correctAnswer': correctAnswer,
        'isCorrect': userSelectedAnswer == correctAnswer,
      });

      if (userSelectedAnswer == correctAnswer) {
        score += weightValue;
      }

      if (questionEngine.didFinishQuiz()) {

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultsScreen(userAnswers: userAnswers, score: score),
          ),
        );
      } else {
        questionEngine.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Algebra Quiz"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  questionEngine.getQuestionTextForCurrentQuestion(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
          ),
          ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  onPressed: () {
                    checkAnswer(
                      questionEngine.getAnswers()[index],
                      questionEngine.getScoreFromAnswers()[index],
                    );
                  },
                  child: Text(
                    questionEngine.getAnswers()[index],
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
