import 'package:flutter/material.dart';
import 'package:personality_test/controllers/test_provider.dart';
import 'package:personality_test/keys.dart';
import 'package:personality_test/views/screens/result.dart';
import 'package:provider/provider.dart';

/// {@template right}
/// Test screen button
/// {@end_template}
class RightButton extends StatelessWidget {
  /// {@macro right}
  const RightButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final testProvider = Provider.of<TestProvider>(context);
    if (testProvider.currentQuestionIndex == 4) {
      return ElevatedButton(
        onPressed: () {
          if (testProvider.currentSelectedOption == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Please choose an option'),
              ),
            );
            return;
          }
          final result = testProvider.computePersonality();
          Navigator.pushReplacement<void, void>(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => ResultScreen(
                result: result,
                key: Keys.resultKey,
              ),
            ),
          );
        },
        child: const Text(
          'Finish Test',
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: () {
          if (testProvider.currentSelectedOption == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Please choose an option'),
              ),
            );
            return;
          }
          testProvider.nextQuestion();
        },
        child: const Text(
          'Next',
        ),
      );
    }
  }
}
