import 'package:equatable/equatable.dart';
import 'package:personality/src/_type.dart';

/// {@template result}
/// This is a result of computing the user's personality.
/// {@end_template}
class Result extends Equatable {
  /// {@macro template}
  const Result({required this.percent, required this.type});

  /// A percent score indicating the level of a [PersonalityType].
  final int percent;

  /// Computed [PersonalityType]
  final PersonalityType type;

  @override
  String toString() {
    return '''
Result {
  percent: $percent,
  type: $type
}
''';
  }

  @override
  List<Object?> get props => [percent, type];
}
