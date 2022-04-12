import 'package:flutter/material.dart';
import 'package:personality_test/controllers/test_provider.dart';
import 'package:provider/provider.dart';

/// {@template option}
/// An Option Widget
/// {@end_template}
class OptionWidget extends StatelessWidget {
  /// {@macro option}
  const OptionWidget({Key? key, required this.optionIndex}) : super(key: key);

  /// Index of option in question:
  /// Option A: 0, Option B: 1, Option C: 2, Option D: 3
  final int optionIndex;

  @override
  Widget build(BuildContext context) {
    final testProvider = Provider.of<TestProvider>(context);
    const listOfOptions = ['A', 'B', 'C', 'D'];

    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        testProvider.selectOption(optionIndex);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 2,
            color: testProvider.currentSelectedOption == optionIndex
                ? Theme.of(context).colorScheme.primary
                : Colors.grey,
          ),
        ),
        child: Text(
          '[${listOfOptions[optionIndex]}] ${testProvider.option(optionIndex)}',
        ),
      ),
    );
  }
}
