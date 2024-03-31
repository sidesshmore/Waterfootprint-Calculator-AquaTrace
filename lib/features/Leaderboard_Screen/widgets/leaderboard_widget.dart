import 'package:aqua_trace/features/Leaderboard_Screen/models/user_lead_list.dart';
import 'package:aqua_trace/features/Leaderboard_Screen/widgets/user_row.dart';
import 'package:flutter/material.dart';

class LeaderBoards extends StatefulWidget {
  const LeaderBoards({super.key});

  @override
  State<LeaderBoards> createState() => _LeaderBoardsState();
}

class _LeaderBoardsState extends State<LeaderBoards> {
  @override
  Widget build(BuildContext context) {
    userList;
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
                userRank: (index + 1).toString(),
                userName: userList[index].userName,
                userXP: userList[index].userXP,
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: height * 0.02,
              );
            },
            itemCount: userList.length));
  }
}

// Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 '1',
//                 style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black),
//               ),
//               Row(
//                 children: [
//                   const CircleAvatar(
//                     foregroundImage: AssetImage('assets/AquaSoldier.png'),
//                   ),
//                   SizedBox(
//                     width: width * 0.02,
//                   ),
//                   const Text(
//                     'Sidessh More',
//                     style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black),
//                   )
//                 ],
//               ),
//               Row(
//                 children: [
//                   const CircleAvatar(
//                     foregroundImage: AssetImage('assets/medal.png'),
//                     backgroundColor: Colors.white,
//                   ),
//                   SizedBox(
//                     width: width * 0.01,
//                   ),
//                   const Text(
//                     '230',
//                     style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),