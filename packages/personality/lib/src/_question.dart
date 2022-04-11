/// {@template question}
/// A single question in a personality test
/// ```dart
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
/// [Question]s should have a question with a list of four options only,
/// options having scores of -2, -1, 1, 2, as example above
///
/// -2 : Very extroverted,
/// -1 : Extroverted,
/// 1 : Introverted,
/// 2 : Very introverted
/// {@end_template}
class Question {
  /// {@macro question}
  const Question({
    required this.question,
    required this.options,
  });

  /// Creating a question from a [Map<String, dynamic>] e.g.
  /// ```dart
  ///   Question.fromMap({
  ///      'question': 'Dummy Question?',
  ///      'options': [
  ///        ['Dummy Option A.', -1],
  ///        ['Dummy Option B.', -2],
  ///        ['Dummy Option C.', 1],
  ///        ['Dummy Option D.', 2],
  ///      ],
  ///    });
  /// ```
  /// -2 : Very extroverted,
  /// -1 : Extroverted,
  /// 1 : Introverted,
  /// 2 : Very introverted,
  Question.fromMap(Map<String, dynamic> map)
      : question = map['question'] as String,
        options = map['options'] as List<List<dynamic>>;

  /// A question (only)
  final String question;

  /// The options of the question e.g.
  /// ```dart
  /// [
  ///   ['Dummy Option A.', -1],
  ///   ['Dummy Option B.', -2],
  ///   ['Dummy Option C.', 1],
  ///   ['Dummy Option D.', 2],
  /// ]
  /// ```
  final List<List<dynamic>> options;
}
