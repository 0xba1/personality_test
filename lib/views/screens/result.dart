import 'package:flutter/material.dart';
import 'package:personality/personality.dart';
import 'package:personality_test/keys.dart';

/// {@template result}
/// Shows the result of the personality test
/// {@end_template}
class ResultScreen extends StatelessWidget {
  /// {@macro result}
  const ResultScreen({Key? key, required Result result})
      : _result = result,
        super(key: key);

  final Result _result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personality Test')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            _result.type == PersonalityType.middle
                ? 'You are 50% introvert and 50% extrovert!'
                : 'You are ${_result.percent}% ${_result.type.name}!',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 32,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: Keys.fabKey,
        tooltip: 'Home',
        onPressed: () {
          Navigator.popUntil(context, (route) => route.isFirst);
        },
        child: const Icon(Icons.home_rounded),
      ),
    );
  }
}
