import 'package:flutter/material.dart';
import 'package:quiz_app/question_engine.dart';
import 'quiz_screen.dart'; // Import the Quiz Screen

class ResultsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> userAnswers;
  final int score;

  const ResultsScreen({super.key, required this.userAnswers, required this.score});

  @override
  Widget build(BuildContext context) {

    const buttonColor = Color.fromRGBO(51, 204, 0, 1.0);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Results"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Your Score: $score",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: userAnswers.length,
                itemBuilder: (context, index) {
                  final result = userAnswers[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(result['question']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Your Answer: ${result['userAnswer']}"),
                          Text("Correct Answer: ${result['correctAnswer']}"),
                        ],
                      ),
                      trailing: Icon(
                        result['isCorrect'] ? Icons.check_circle : Icons.cancel,
                        color: result['isCorrect'] ? Colors.green : Colors.red,
                      ),
                    ),
                  );
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        questionEngine.reset();
                        return const QuizScreen();
                      },
                    ),
                    ModalRoute.withName('/'),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: buttonColor,
                ),
                child: const Text(
                  "Restart Quiz",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
