
import 'dart:developer';

import 'package:aqua_trace/features/Leaderboard_Screen/models/user_lead_list.dart';
import 'package:aqua_trace/models/list.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LeaderBoardItems{
  static  Future<List<UserLeadList>> getList()async{
  List<UserLeadList> lists = [];
  final dio=Dio();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final uid=prefs.getString('uid');
  final response=await dio.get('${dotenv.env["URL"]}/leaderboard');
   if (response.statusCode == 200) {
  print(response.data.toString());
  final data=response.data["results"];
  List dataList=data;
  lists.clear();
  for(int i=0;i<dataList.length;i++){
    UserLeadList list=UserLeadList.fromMap(dataList[i] as Map<String,dynamic>);
    lists.add(list);
  }
  return lists;
   }
   else{
    return [];
   }
}

}