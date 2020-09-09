import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty? data:  ModalRoute.of(context).settings.arguments;
    print(data);
    // set background
    String bgImage = data['isDay'] ? 'day1.jpg' : 'night.png';
    Color navBarColor = data['isDay'] ? Colors.lightBlueAccent : Colors.deepPurple[900];

    return Scaffold(
      backgroundColor: navBarColor,
      body:SafeArea(
        child:Container(
        decoration: BoxDecoration(
          image:  DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          )
        ),

          child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
              child: Column(
              children: <Widget>[
                FlatButton.icon(
                onPressed: () async {
                 dynamic  result  = await  Navigator.pushNamed(context, '/location');
                 setState(() {
                   data = {
                     'location' : result['location'],
                     'time' : result['time'],
                     'isDay' : result['isDay'],
                     'flag' : result ['flag']
                   };
                 });
                },
                icon: Icon(Icons.edit_location,
                  color: Colors.white),
                label: Text('Change Location',
                      style: TextStyle(
                          color: Colors.white,
                        fontSize: 15.0
                      ),),


              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(data['location'],
                  style: TextStyle(
                    fontSize: 30.0,
                    letterSpacing: 2.0,
                    color: Colors.white
                  ),
                  ),

                ],
              ),
              SizedBox(height: 20.0),
              Text(data['time'],
                style: TextStyle(
                  fontSize: 60.0,
                  letterSpacing: 2.0,
                    color: Colors.white
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}


