import 'package:personality/src/_question.dart';
import 'package:personality/src/_test.dart';

///
// ignore: one_member_abstracts
abstract class Backend {
  ///
  Future<PersonalityTest> fetchTest();
}

/// A class to simulate fetching a personality test from the backend
class FakeBackend extends Backend {
  @override
  Future<PersonalityTest> fetchTest() async {
    await Future<void>.delayed(const Duration(milliseconds: 750));
    final sampleQuestions = [
      {
        'question':
            """You're really busy at work and a colleague is telling you their life story and personal woes. You:""",
        'options': [
          ["Don't dare to interrupt them", 2],
          [
            """Think it's more important to give them some of your time; work can wait""",
            1
          ],
          ['Listen, but with only half an ear', -1],
          ['Interrupt and explain that you are really busy at that moment', -2],
        ],
      },
      {
        'question':
            """You've been sitting in the doctor's waiting room for more than 25 minutes. You:""",
        'options': [
          ['Look at your watch every two minutes', 2],
          ['Bubble with inner anger, but keep quiet', 1],
          [
            '''Explain to other equally impatient people in the room that the doctor is always running late''',
            -1
          ],
          ['Complain in a loud voice, while tapping your foot impatiently', -2],
        ],
      },
      {
        'question':
            """You're having an animated discussion with a colleague regarding a project that you're in charge of. You:""",
        'options': [
          ["Don't dare contradict them", 1],
          ['Think that they are obviously right', 2],
          ['Defend your own point of view tooth and nail', -2],
          ['Continuously interrupt your colleague', -1],
        ],
      },
      {
        'question': 'You are taking part in a guided toure of a museum. You:',
        'options': [
          [
            """Are a bit too far towards the back so don't really hear what the guide is saying""",
            2
          ],
          ['Follow the group without question', 1],
          ['Make sure that everyone is able to hear properly', -1],
          [
            'Are right up the front, adding your own comments in a loud voice',
            -2
          ],
        ],
      },
      {
        'question':
            '''During dinner parties at your home, you have a hard time with people who:''',
        'options': [
          ['Ask you to tell a story in front of everyone else', 2],
          ['Talk privately between themselves', -1],
          ['Hang around you all evening', 1],
          ['Always drag the conversation back to themselves', -2],
        ],
      },
    ];

    final questions = sampleQuestions.map(Question.fromMap).toList();

    return PersonalityTest(questions: questions);
  }
}
