import 'package:flutter/material.dart';
import 'package:personality_test/app_theme.dart';
import 'package:personality_test/keys.dart';
import 'package:personality_test/views/screens/home.dart';

void main() {
  runApp(const MyApp());
}

/// {@template app}
/// Main material app
/// {@end_template}
class MyApp extends StatelessWidget {
  /// {@macro app}
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: const Home(
        key: Keys.homeKey,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
