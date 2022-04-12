import 'package:flutter/material.dart';
import 'package:personality_test/controllers/test_provider.dart';
import 'package:provider/provider.dart';

/// {@template left}
///
/// {@end_template}
class LeftButton extends StatelessWidget {
  /// {@macro left}
  const LeftButton({Key? key, required this.callback}) : super(key: key);

  /// Fade transition call
  final void Function() callback;

  @override
  Widget build(BuildContext context) {
    final testProvider = Provider.of<TestProvider>(context);
    if (testProvider.currentQuestionIndex == 0) {
      return ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text(
          'Exit Test',
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: () {
          testProvider.prevQuestion();
          callback();
        },
        child: const Text(
          'Previous',
        ),
      );
    }
  }
}
