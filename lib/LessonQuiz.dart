import 'dart:math';

import 'package:codingcounselor/LessonData.dart';

class LessonQuiz {
  String name;
  Random _random;
  List<QuizQuestion> _questions;
  List<QuizQuestion> _incorrect;
  int score;
  final int scoreNeededToPass = 5;

  LessonQuiz(var lessonData, Random _random) {
    _questions = List();
    _incorrect = List();
    name = lessonData[LessonPart.name];
    for (Map question in lessonData[LessonPart.questions]) {
      _questions.add(QuizQuestion(question));
    }
    _questions.shuffle(_random);
    score = 0;
  }

  QuizQuestion currentQuestion() => _questions.last;

  TestStatus testStatus() {
    if (score == scoreNeededToPass) {
      return TestStatus.passed;
    } else if (_unableToFinish()) {
      return TestStatus.failed;
    }
    return TestStatus.ongoing;
  }

  bool _unableToFinish() {
    int remainingQuestions = _questions.length + _incorrect.length;
    int highestScoreStillPossible = remainingQuestions + score;
    return highestScoreStillPossible < scoreNeededToPass;
  }

  Outcome inputAnswer(int answerIndex) {
    Outcome outcome = currentQuestion().checkResponse(answerIndex);
    _adjustScore(outcome);
    if (outcome == Outcome.incorrect) {
      _incorrect.insert(0, currentQuestion());
    }
    _updateCurrentQuestion();
    return outcome;
  }

  void _updateCurrentQuestion() {
    _questions.removeLast();
    if (_questions.isEmpty) {
      _questions = _incorrect;
      _incorrect = List();
    }
  }

  void _adjustScore(Outcome outcomeOfResponse) {
    if (outcomeOfResponse == Outcome.correct) {
      score++;
    } else if (score > 0) {
      score--;
    }
  }
}

enum Outcome {
  correct,
  incorrect
}

enum TestStatus {
  ongoing,
  passed,
  failed
}

class QuizQuestion {
  String question;
  List<String> answers;
  int _indexOfCorrectAnswer;

  QuizQuestion(Map questionData) {
    question = questionData[QuestionPart.question];
    answers = questionData[QuestionPart.answers];
    _indexOfCorrectAnswer = questionData[QuestionPart.correctAnswer];
  }

  Outcome checkResponse(int responseIndex) {
    if(responseIndex == _indexOfCorrectAnswer) {
      return Outcome.correct;
    }
    return Outcome.incorrect;
  }
}