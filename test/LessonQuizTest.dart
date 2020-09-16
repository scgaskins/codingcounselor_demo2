import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:codingcounselor/LessonData.dart';
import 'package:codingcounselor/LessonQuiz.dart';

void main() {
  test('Current question should update', () {
    LessonQuiz quiz = LessonQuiz(pythonBasicSyntaxLesson, Random(4));
    String lastQuestion = quiz.currentQuestion().question;
    quiz.inputAnswer(0);
    String newQuestion = quiz.currentQuestion().question;
    expect(newQuestion != lastQuestion, true);
  });
  test('should pass', (){
    testQuiz([0, 3, 1, 0, 1], [Outcome.correct, Outcome.correct, Outcome.correct, Outcome.correct, Outcome.correct], TestStatus.passed);
  });
  test('should still be ongoing', () {
    testQuiz([0, 3, 1, 0, 0], [Outcome.correct, Outcome.correct, Outcome.correct, Outcome.correct, Outcome.incorrect], TestStatus.ongoing);
  });
  test('should fail', () {
    testQuiz([0, 0, 1, 1, 1, 1, 2, 0, 0, 0, 3, 1], [Outcome.correct, Outcome.incorrect, Outcome.correct, Outcome.incorrect, Outcome.correct, Outcome.incorrect, Outcome.correct, Outcome.incorrect, Outcome.correct, Outcome.incorrect, Outcome.correct, Outcome.incorrect], TestStatus.failed);
  });
  test('score should decrease to 0 and not go below', () {
    testQuizScore([0, 1, 0], [1, 0, 0], TestStatus.ongoing);
  });
}

void testQuiz(List<int> answers, List<Outcome> expectedOutcomes, TestStatus expectedFinalStatus) {
  LessonQuiz quiz = LessonQuiz(pythonBasicSyntaxLesson, Random(4));
  for (int i=0; i<answers.length; i++) {
    print("${quiz.currentQuestion().question} given answer ${quiz.currentQuestion().answers[answers[i]]}"
        " expected to return ${expectedOutcomes[i]}");
    expect(quiz.inputAnswer(answers[i]), expectedOutcomes[i]);
  }
  print("expect final status to be $expectedFinalStatus");
  expect(quiz.testStatus(), expectedFinalStatus);
}

void testQuizScore(List<int> answers, List<int> expectedScores, TestStatus expectedFinalStatus) {
  LessonQuiz quiz = LessonQuiz(pythonBasicSyntaxLesson, Random(4));
  for (int i=0; i<answers.length; i++) {
    quiz.inputAnswer(answers[i]);
    expect(quiz.score, expectedScores[i]);
  }
  expect(quiz.testStatus(), expectedFinalStatus);
}