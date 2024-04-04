import 'dart:math';

import 'package:aqua_trace/features/Leaderboard_Screen/models/user_lead_list.dart';
import 'package:aqua_trace/features/Leaderboard_Screen/repos/leaderBoardItems.dart';
import 'package:aqua_trace/features/Leaderboard_Screen/widgets/leaderboard_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {

 

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Leaderboard',
          style: TextStyle(
              fontWeight: FontWeight.w600, color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 24, 94, 247),
      ),
      backgroundColor: const Color.fromARGB(255, 24, 94, 247),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            const LeaderBoards(),
          ],
        ),
      ),
    );
  }
}
