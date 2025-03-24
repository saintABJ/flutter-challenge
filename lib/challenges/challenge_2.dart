import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/challenge_service.dart';

/// This widget is not currently taking up the correct amount of space. It is inside of a `Row`
/// inside the `ChallengePage` widget: make it take up half of the available space (without
/// modifying `ChallengePage`).
///
/// Then, refactor this stateful widget to using Riverpod and the `ChallengeService` instead of
/// tracking the counter state locally. This widget should display the current `ChallengeState.counter`
/// value, and increment the value when the button is pressed.
///
/// Requirements:
/// - This widget should take up half of the available space
/// - Do not use a stateful widget
/// - Do not modify the `ChallengeService` in any way
/// - The button should increment the `ChallengeState.counter` when pressed
/// - The up-to-date value of `ChallengeState.counter` should be displayed in a Text widget

// Convert to ConsumerWidget of Riverpod instead of a stateful widget
class Challenge2Widget extends ConsumerWidget {
  const Challenge2Widget({super.key});

/// - Not needed anymore
  /*@override
  State<Challenge2Widget> createState() => _Challenge2WidgetState();*/

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final counter = ref.watch(challengeService).counter;
    final counterNotifier = ref.read(challengeService.notifier);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('You\'ve pressed the button: $counter times'),
        MaterialButton(
          onPressed: counterNotifier.incrementCounter,
          child: const Text('Press me!'),
        )
      ],
    );
  }
}

/// - Also not needed any more
/*class _Challenge2WidgetState extends State<Challenge2Widget> {
  int _counter = 0;

  void _onPressed() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column();
    ...
  }
}*/
