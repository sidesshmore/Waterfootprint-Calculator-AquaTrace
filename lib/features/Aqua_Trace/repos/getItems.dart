import 'package:aqua_trace/models/list.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class getItemsRepo{
  static  Future<List<IncomingList>> getList()async{
  List<IncomingList> lists = [];
  final dio=Dio();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final uid=prefs.getString('uid');
  final response=await dio.get('https://long-pink-swallow-belt.cyclic.app/user/today/${uid}');
   if (response.statusCode == 200) {
  final data=response.data["result"];
  List dataList=data;
  for(int i=0;i<dataList.length;i++){
    IncomingList list=IncomingList.fromMap(dataList[i] as Map<String,dynamic>);
    lists.add(list);
  }
  return lists;
   }
   else{
    return [];
   }
}

 static Future<double> getTotal()async{
  final dio=Dio();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final uid=prefs.getString('uid');
  final response=await dio.get('https://long-pink-swallow-belt.cyclic.app/user/today/${uid}');
  if (response.statusCode == 200) {
  return double.parse(response.data["total"]);
  }
  else{
    return 0;
  }
 } 
}