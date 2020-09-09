import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {
  String location; // location name for the ui
  String time; // the time of that location
  String flag; //url asset to flag of that country
  String locationUrl; //url for fetching data
  bool isDay; //true or false

  WorldTime({this.location, this.flag, this.locationUrl});

  Future<void> getTime() async {
    try {
      Response response = await get(
          'http://worldtimeapi.org/api/timezone/$locationUrl');
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      DateTime now = DateTime.parse(datetime);
      String offsetHr = data['utc_offset'].substring(0, 3);
      String offsetMin = data['utc_offset'].substring(4, 6);

      now = now.add(
          Duration(hours: int.parse(offsetHr), minutes: int.parse(offsetMin)));
//    set the time property
      isDay = now.hour>6 && now.hour< 19 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch(error){
        time = "Error:404 Not Found! \nSomething went wrong.";
    }

  }

}
