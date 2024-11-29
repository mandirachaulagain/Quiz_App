class Question {
  final String questionText;
  final List<String> answersList;
  final String correctAnswer;
  final List<int> answerWeight;
  final String hint;

  Question(
      this.questionText,
      this.answersList,
      this.correctAnswer,
      this.answerWeight,
      this.hint,
      );
}
