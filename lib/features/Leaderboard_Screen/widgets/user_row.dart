import 'package:aqua_trace/features/Leaderboard_Screen/models/user_lead_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
  @override
  Widget build(BuildContext context) {
    userList;
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.userRank,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: width * 0.01,
            )
          ],
        ),
        Expanded(
          child: Row(
            children: [
              const CircleAvatar(
                foregroundImage: AssetImage('assets/avatar.png'),
                foregroundColor: Colors.white,
              ),
              SizedBox(
                width: width * 0.03,
              ),
              Text(
                widget.userName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Row(
          children: [
            const CircleAvatar(
              foregroundImage: AssetImage('assets/medal.png'),
              backgroundColor: Colors.white,
            ),
            SizedBox(
              width: width * 0.001,
            ),
            Text(
              widget.userXP,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
