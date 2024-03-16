import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:aqua_trace/features/Share_Screen/ui/shareCard.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';

class ShareScreen extends StatefulWidget {
  const ShareScreen({super.key});

  @override
  State<ShareScreen> createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  final _screenshotController = ScreenshotController();
  late ConfettiController _controllerTopCenter;

  @override
  void initState() {
    super.initState();
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 1));
    _controllerTopCenter.play();
  }

  @override
  void dispose() {
    _controllerTopCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share Card'),
      ),
      body: Stack(
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: ShareCard(),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _controllerTopCenter,
              blastDirection: 90,
              maxBlastForce: 5,
              minBlastForce: 4,
              emissionFrequency: 0.05,
              numberOfParticles: 23,
              gravity: 0.2,
            ),
          ),
        ],
      ),
    );
  }
}
