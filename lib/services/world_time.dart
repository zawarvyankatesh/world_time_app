import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
// import 'package:projectofdream/services/globles.dart';

class WorldTime {
  String location;
  late String time;
  String flag;
  String url;
  int isDaytime = 1;

  WorldTime({required this.location, required this.url, required this.flag});

  Future<void> getTime() async {
    try {
      // await Future.delayed(Duration(seconds: 2), () {});




       Response responce = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));

      Map data =await jsonDecode(responce.body);

      String datetime = data['datetime'];
      String offseth = data['utc_offset'].substring(1, 3);
      String offsetm = data['utc_offset'].substring(4,);
      // print(offset);

      DateTime now = DateTime.parse(datetime);

      now = now.add(Duration(hours: int.parse(offseth), minutes: int.parse(offsetm)));

      time = DateFormat.jm().format(now);

      if ((now.hour) >= 5 && now.hour.toInt() <= 10) {
        isDaytime = 1;
      } else if (now.hour.toInt() >= 11 && now.hour.toInt() <= 18) {
        isDaytime = 2;
      } else if (now.hour.toInt() >= 19 && now.hour.toInt() <= 23) {
        isDaytime = 3;
      } else if ((now.hour.toInt()) >= 23 && (now.hour.toInt()) <= 4) {
        isDaytime = 4;
      } else {
        isDaytime = 5;
      }
    } catch (e) {
      print('caught an error $e');
      time = 'could not get time data';
    }
  }
}
