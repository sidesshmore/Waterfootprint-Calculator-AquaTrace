import 'package:aqua_trace/models/addItem.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ActivityRepo{
  static Future<bool> addActivity(AddActivity items) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
        var client = http.Client();
    try {
      Map<String,dynamic> data=
      {
      "uid":prefs.getString('uid'),
      "item":items.activityName,
      "waterfootprint":80,
      "measure":items.time
    };
    // print(data);
    var response = await client
          .post(Uri.parse('https://long-pink-swallow-belt.cyclic.app/add'), body: {'uid': 'mmZkZXmB7cSrlBcPHK1i6BBC1O63', 'item': 'test2', 'waterfootprint': '80', 'measure':'gram'});
    print(response.body);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          print(response.body);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
    
  }
}