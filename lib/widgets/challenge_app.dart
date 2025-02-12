// Do not modify this file.

import 'package:blitz_flutter_challenge/challenges/challenge_1.dart';
import 'package:blitz_flutter_challenge/challenges/challenge_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChallengeApp extends StatelessWidget {
  const ChallengeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Challenge',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ChallengePage(),
    );
  }
}

class ChallengePage extends StatefulWidget {
  const ChallengePage({super.key});

  @override
  State<ChallengePage> createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> with TickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Do not modify this build method in any way
    return ProviderScope(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Flutter Challenge"),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.topLeft,
                fit: StackFit.passthrough,
                children: [
                  Positioned(
                    top: 35,
                    left: 50,
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) => SizedBox(
                        width: 500,
                        height: _controller.value * 500 + 10,
                        child: child,
                      ),
                      child: const Challenge1Widget(),
                    ),
                  ),
                ],
              ),
            ),
            const Challenge2Widget(),
          ],
        ),
      ),
    );
  }
}
