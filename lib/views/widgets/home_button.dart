import 'package:flutter/material.dart';
import 'package:personality/personality.dart';
import 'package:personality_test/controllers/test_provider.dart';
import 'package:personality_test/keys.dart';
import 'package:personality_test/views/screens/test.dart';
import 'package:provider/provider.dart';

/// {@template home_button}
/// A circle
/// {@end_template}
class HomeButton extends StatefulWidget {
  /// {@macro home_button}
  const HomeButton({Key? key}) : super(key: key);

  @override
  State<HomeButton> createState() => _HomeButtonState();
}

class _HomeButtonState extends State<HomeButton> {
  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    if (clicked) {
      return SizedBox(
        height: 200,
        width: 200,
        child: Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      );
    }
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: () async {
            setState(() {
              clicked = true;
            });
            final test = await FakeBackend().fetchTest();

            // ignore: use_build_context_synchronously, unawaited_futures
            Navigator.push<void>(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => ChangeNotifierProvider(
                  create: (BuildContext context) => TestProvider(test: test),
                  child: const Test(
                    key: Keys.testScreenKey,
                  ),
                ),
              ),
            );
            setState(() {
              clicked = false;
            });
          },
          child: Icon(
            Icons.forward_rounded,
            size: 64,
            color: Colors.black.withOpacity(0.6),
          ),
        ),
      ),
    );
  }
}
