import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:personality_test/keys.dart';
import 'package:personality_test/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('end-to-end test', () {
    testWidgets(
        'Home screen -> Personality test -> Results screen -> Home Screen',
        (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();

      expect(find.byKey(Keys.homeKey), findsOneWidget);

      final homeButton = find.byKey(Keys.homeButtonKey);
      await tester.tap(homeButton);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.byKey(Keys.testScreenKey), findsOneWidget);

      // Five questions to answer
      for (var i = 0; i < 5; i++) {
        final option = find.byKey(Keys.optionAKey);
        await tester.tap(option);
        await tester.pumpAndSettle();
        final rightButton = find.byKey(Keys.rightButtonKey);
        await tester.tap(rightButton);
        await tester.pumpAndSettle();
      }

      expect(find.byKey(Keys.resultKey), findsOneWidget);

      final fab = find.byKey(Keys.fabKey);
      await tester.tap(fab);
      await tester.pumpAndSettle();

      expect(find.byKey(Keys.homeKey), findsOneWidget);
    });
  });
}
