import 'package:flutter_test/flutter_test.dart';
import 'package:personality/personality.dart';

void main() {
  group(
    'Using the `FakeBackend`, compute personality of different inputs. ',
    () {
      late PersonalityTest personalityTest;

      setUp(() async {
        personalityTest = await FakeBackend().fetchTest();
      });

      test('Testing with options [0, 1, 2, 3, 0]', () {
        final options = [0, 1, 2, 3, 0];
        const expectedResult =
            Result(percent: 55, type: PersonalityType.introvert);
        expect(
          personalityTest.computePersonality(answers: options),
          expectedResult,
        );
      });
      test('Testing with options [2, 3, 0, 0, 2]', () {
        final options = [2, 3, 0, 0, 2];
        const expectedResult =
            Result(percent: 55, type: PersonalityType.introvert);
        expect(
          personalityTest.computePersonality(answers: options),
          expectedResult,
        );
      });
      test('Testing with options [3, 1, 2, 3, 2]', () {
        final options = [3, 1, 2, 3, 2];
        const expectedResult =
            Result(percent: 70, type: PersonalityType.extrovert);
        expect(
          personalityTest.computePersonality(answers: options),
          expectedResult,
        );
      });
      test('Testing with options [2, 3, 1, 3, 2]', () {
        final options = [2, 3, 1, 3, 2];
        const expectedResult =
            Result(percent: 60, type: PersonalityType.extrovert);
        expect(
          personalityTest.computePersonality(answers: options),
          expectedResult,
        );
      });
      test('Testing with options [1, 3, 2, 0, 0]', () {
        final options = [1, 3, 2, 0, 0];
        const expectedResult =
            Result(percent: 55, type: PersonalityType.introvert);
        expect(
          personalityTest.computePersonality(answers: options),
          expectedResult,
        );
      });
      test('Testing with options [0, 0, 0, 0, 0]', () {
        final options = [0, 0, 0, 0, 0];
        const expectedResult =
            Result(percent: 95, type: PersonalityType.introvert);
        expect(
          personalityTest.computePersonality(answers: options),
          expectedResult,
        );
      });
      test('Testing with options [1, 1, 1, 1, 1]', () {
        final options = [1, 1, 1, 1, 1];
        const expectedResult =
            Result(percent: 70, type: PersonalityType.introvert);
        expect(
          personalityTest.computePersonality(answers: options),
          expectedResult,
        );
      });
      test('Testing with options [2, 2, 2, 2, 2]', () {
        final options = [2, 2, 2, 2, 2];
        const expectedResult =
            Result(percent: 70, type: PersonalityType.extrovert);
        expect(
          personalityTest.computePersonality(answers: options),
          expectedResult,
        );
      });
      test('Testing with options [3, 3, 3, 3, 3]', () {
        final options = [3, 3, 3, 3, 3];
        const expectedResult =
            Result(percent: 95, type: PersonalityType.extrovert);
        expect(
          personalityTest.computePersonality(answers: options),
          expectedResult,
        );
      });
    },
  );
}
