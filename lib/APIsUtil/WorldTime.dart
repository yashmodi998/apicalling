import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
//simple api with get
class WorldTime {
  String time;
  String flag;
  String location;
  String url;

  WorldTime({this.flag, this.location, this.url});

  Future<void> getTime() async {
    try {
      http.Response res =
      await http.get('http://worldtimeapi.org/api/timezone/$url');
      // print(res.body);
      Map data = jsonDecode(res.body);
      String date = data['datetime'];
      String ofsethour = data['utc_offset'].substring(1, 3);
      String ofsetMinute = data['utc_offset'].substring(4, 6);
      DateTime now = DateTime.parse(date);

      now = now.add(Duration(hours: int.parse(ofsethour)));
      now = now.add(Duration(minutes: int.parse(ofsetMinute)));
      time = DateFormat.jm().format(now);
      //print(now);
    }
    catch(e)
    {
      // print('exceptionwss \t\t $e');
      time='could not get the data';
    }
  }
}
