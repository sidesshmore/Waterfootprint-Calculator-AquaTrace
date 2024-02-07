import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:aqua_trace/features/Share_Screen/ui/shareCard.dart';

class ShareScreen extends StatelessWidget {
  ShareScreen({super.key});

  final _screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share Card'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: ShareCard(),
        ),
      ),
    );
  }
}
