import 'package:flutter/material.dart';
import 'package:personality_test/keys.dart';
import 'package:personality_test/views/widgets/left_button.dart';
import 'package:personality_test/views/widgets/question.dart';
import 'package:personality_test/views/widgets/right_button.dart';

/// {@template test}
/// A personality test view
/// {@end_template}
class Test extends StatelessWidget {
  /// {@macro test}
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personality Test')),
      body: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          const Expanded(child: QuestionWidget()),
          SizedBox(
            height: 64,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: LeftButton(),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: RightButton(
                    key: Keys.rightButtonKey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
