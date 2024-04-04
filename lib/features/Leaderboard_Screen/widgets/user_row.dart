import 'package:aqua_trace/features/Leaderboard_Screen/models/user_lead_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

class UserLeadRow extends StatefulWidget {
  const UserLeadRow(
      {super.key,
      required this.userRank,
      required this.userName,
      required this.userXP});

  final String userRank;
  final String userName;
  final String userXP;

  @override
  State<UserLeadRow> createState() => _UserLeadRowState();
}

class _UserLeadRowState extends State<UserLeadRow> {
  final List<String> avatarPaths = [
    'assets/leaderboard_avatar/avatar1.png',
    'assets/leaderboard_avatar/avatar2.png',
    'assets/leaderboard_avatar/avatar3.png',
    'assets/leaderboard_avatar/avatar4.png',
    'assets/leaderboard_avatar/avatar5.png',
    'assets/leaderboard_avatar/avatar6.png',
  ];

  int randomIndex = Random().nextInt(6);

  @override
  Widget build(BuildContext context) {
  
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: width * 0.07,
              alignment: Alignment.center,
              child: Text(
                widget.userRank,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              width: width * 0.01,
            )
          ],
        ),
        Expanded(
          child: Row(
            children: [
              CircleAvatar(
                foregroundImage: AssetImage(avatarPaths[randomIndex]),
                foregroundColor: Colors.white,
              ),
              SizedBox(
                width: width * 0.03,
              ),
              Text(
                widget.userName,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Row(
          children: [
            CircleAvatar(
              foregroundImage: AssetImage('assets/medal.png'),
              backgroundColor: Colors.white,
            ),
            SizedBox(
              width: width * 0.001,
            ),
            Text(
              widget.userXP,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
