import 'package:flutter/material.dart';
import 'package:personality_test/keys.dart';
import 'package:personality_test/views/widgets/left_button.dart';
import 'package:personality_test/views/widgets/question.dart';
import 'package:personality_test/views/widgets/right_button.dart';

/// {@template test}
/// A personality test view
/// {@end_template}
class Test extends StatefulWidget {
  /// {@macro test}
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(controller);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return Scaffold(
      appBar: AppBar(title: const Text('Personality Test')),
      body: FadeTransition(
        opacity: animation,
        child: Column(
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
                    child: LeftButton(
                      callback: () {
                        controller.forward();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: RightButton(
                      key: Keys.rightButtonKey,
                      callback: () {
                        controller.forward();
                      },
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
      ),
    );
  }
}
