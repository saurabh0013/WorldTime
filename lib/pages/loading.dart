import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime myTime =  WorldTime(location: 'Kolkata', flag: 'india.png', locationUrl: 'Asia/Kolkata');
    await myTime.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': myTime.location,
      'flag' : myTime.flag,
      'time' : myTime.time,
      'isDay' : myTime.isDay
    });

  }
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue[400],
      body: Center(
        child: SpinKitRotatingCircle(

          color: Colors.white,
          size: 50.0,

        ),
        ),
      );

  }
}
