import 'package:aqua_trace/features/Leaderboard_Screen/models/user_lead_list.dart';
import 'package:aqua_trace/features/Leaderboard_Screen/repos/leaderBoardItems.dart';
import 'package:aqua_trace/features/Leaderboard_Screen/widgets/user_row.dart';
import 'package:flutter/material.dart';

class LeaderBoards extends StatefulWidget {
  const LeaderBoards({super.key});

  @override
  State<LeaderBoards> createState() => _LeaderBoardsState();
}

class _LeaderBoardsState extends State<LeaderBoards> {

   List<UserLeadList> userList=[];

  void getLeaderBoard()async{
    List<UserLeadList> Lists=await LeaderBoardItems.getList();
    setState(() {
      userList=Lists;
    });
  }

  @override
  void initState() {
    getLeaderBoard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Container(
        padding: const EdgeInsets.only(top: 10, right: 10, left: 15),
        height: height * 0.95,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return UserLeadRow(
                userRank: (index+1).toString(),
                userName: userList[index].name,
                userXP: userList[index].totalxp,
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: height * 0.03,
                child: Divider(
                  color: Colors.grey,
                ),
              );
            },
            itemCount: userList.length));
  }
}
