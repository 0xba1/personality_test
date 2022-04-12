import 'package:flutter/material.dart';
import 'package:personality_test/controllers/test_provider.dart';
import 'package:personality_test/keys.dart';
import 'package:personality_test/views/widgets/option.dart';
import 'package:provider/provider.dart';

/// {@template question}
/// A single question view
/// {@end_template}
class QuestionWidget extends StatelessWidget {
  /// {@macro question}
  const QuestionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final testProvider = Provider.of<TestProvider>(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            testProvider.questionStr,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        const OptionWidget(
          optionIndex: 0,
          key: Keys.optionAKey,
        ),
        const OptionWidget(
          optionIndex: 1,
          key: Keys.optionBKey,
        ),
        const OptionWidget(
          optionIndex: 2,
          key: Keys.optionCKey,
        ),
        const OptionWidget(
          optionIndex: 3,
          key: Keys.optionDKey,
        ),
      ],
    );
  }
}
