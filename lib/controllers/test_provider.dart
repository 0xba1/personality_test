import 'package:flutter/foundation.dart';
import 'package:personality/personality.dart';

/// {@template test_provider}
/// Controller for personality test
/// {@end_template}
class TestProvider extends ChangeNotifier {
  /// {@macro test_provider}
  TestProvider({required PersonalityTest test}) : _test = test;

  /// Personality test including questions and options in each question
  /// ```dart
  /// PersonalityTest.questions -> List<Question>
  ///
  /// Question(
  ///   question: 'Dummy Question?',
  ///   options: [
  ///     ['Dummy Option A.', -1],
  ///     ['Dummy Option B.', -2],
  ///     ['Dummy Option C.', 1],
  ///     ['Dummy Option D.', 2],
  ///   ],
  /// )
  /// ```
  final PersonalityTest _test;

  /// Answers to the personality test set by user.
  List<int?> answers = List.filled(5, null);

  int _currentQuestionIndex = 0;

  /// The index of the current question of the test. Ranges from 0 - 4
  int get currentQuestionIndex => _currentQuestionIndex;

  /// Current selected option of current question, e of {0, 1, 2, 3, null}
  int? get currentSelectedOption => answers[_currentQuestionIndex];

  /// Current question being answered
  Question get currentQuestion => _test.questions[_currentQuestionIndex];

  /// An option in a [Question] based on the index argument
  String option(int index) => currentQuestion.options[index][0] as String;

  /// The question string of a [Question]
  String get questionStr => currentQuestion.question;

  /// A user selecting an option
  void selectOption(int option) {
    answers[_currentQuestionIndex] = option;
    notifyListeners();
  }

  /// Increment currentQuestionIndex by 1
  void nextQuestion() {
    _currentQuestionIndex = (_currentQuestionIndex + 1) % 5;
    notifyListeners();
  }

  /// Decrement currentQuestionIndex by 1
  void prevQuestion() {
    _currentQuestionIndex = (_currentQuestionIndex - 1) % 5;
    notifyListeners();
  }

  /// Computes user personality
  Result computePersonality() {
    return _test.computePersonality(answers: answers.map((e) => e!).toList());
  }
}
