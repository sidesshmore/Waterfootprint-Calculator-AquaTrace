import 'package:aqua_trace/models/addItem.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ActivityRepo {
  static Future<bool> addActivity(AddActivity items) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var client = http.Client();
    try {
      final dio = Dio();
      final response = await dio
          .post('https://long-pink-swallow-belt.cyclic.app/add', data: {
        "uid": prefs.getString('uid'),
        "item": items.activityName,
        "waterfootprint": "80",
        "measure": 'mins',
        "quantity": items.time
      });
      if (response.statusCode == 200) {
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
