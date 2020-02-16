import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data ={};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    String bg_image = data['time'].isDaytime ? "day.png" : "night.png";
    print(data['time'].time);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bg_image'),
            fit: BoxFit.cover
          )
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120,0,0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: (){
                        Navigator.pushNamed(context, '/location');
                      },
                      icon: Icon(Icons.edit_location,
                      color: Colors.white,),
                      label: Text(
                          "Edit Location",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    data['time'].location,
                    style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 2,
                        color: Colors.white
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    data['time'].time,
                    style: TextStyle(
                      fontSize: 66.0,
                      color: Colors.white
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
