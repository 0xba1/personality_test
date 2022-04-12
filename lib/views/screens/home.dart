import 'package:flutter/material.dart';
import 'package:personality_test/keys.dart';
import 'package:personality_test/views/widgets/home_button.dart';

/// {@template home}
///
/// {@end_template}
class Home extends StatelessWidget {
  /// {@macro home}
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personality Test')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Take A Personality Test',
            style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(
            height: 10,
            width: double.infinity,
          ),
          const HomeButton(
            key: Keys.homeButtonKey,
          ),
        ],
      ),
    );
  }
}
