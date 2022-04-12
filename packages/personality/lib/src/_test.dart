import 'package:personality/src/_question.dart';
import 'package:personality/src/_result.dart';
import 'package:personality/src/_type.dart';

/// {@template test}
/// A personality test
/// ```dart
/// PersonalityTest.questions -> List<Question>
/// ```
/// {@end_template}
class PersonalityTest {
  /// {@macro test}
  const PersonalityTest({required this.questions});

  /// A personal test's questions
  final List<Question> questions;

  /// Used to compute the the user's personality after the questions
  /// been answered. Takes in a list of [int] and returns a [Result] e.g
  ///
  /// ```dart
  /// PersonalityTest(questions: ...)
  ///   .computePersonality([0, 2, 1, 3, 1])
  ///
  ///   -> Result(percent: 50, type: Personality.middle)
  /// ```
  /// 0: Option A,
  /// 1: Option B,
  /// 2: Option C,
  /// 3: Option D
  // This method adds the scores from 5 questions (assigned to total),
  // total ranges from from -10 to +10
  // -10: Very extroverted
  // +10: Very introverted
  // 0: Half introvert, half extrovert
  Result computePersonality({required List<int> answers}) {
    var total = 0;
    for (var i = 0; i < questions.length; i++) {
      final question = questions[i];
      final score = question.options[answers[i]][1] as int;
      total += score;
    }
    if (total > 0) {
      return Result(percent: (total * 5) + 50, type: PersonalityType.introvert);
    } else if (total < 0) {
      return Result(
        percent: (total * -5) + 50,
        type: PersonalityType.extrovert,
      );
    }
    return const Result(percent: 50, type: PersonalityType.middle);
  }
}
