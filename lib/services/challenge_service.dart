// Do not modify this file.

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
final class ChallengeState {
  const ChallengeState({
    required this.counter,
  });

  final int counter;
}

final challengeService = NotifierProvider<IChallengeService, ChallengeState>(
  _ChallengeService.new,
);

abstract class IChallengeService extends Notifier<ChallengeState> {
  void incrementCounter();
}

class _ChallengeService extends IChallengeService {
  _ChallengeService();

  @override
  ChallengeState build() => const ChallengeState(counter: 0);

  @override
  void incrementCounter() {
    state = ChallengeState(counter: state.counter + 1);
  }
}
