import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int counter = 0;
  List locations = [
    WorldTime(location: "Istanbul",flag: "tr.jpg", url: "Europe/Istanbul"),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'en.webp'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'ger.webp'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'car.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'nair.gif'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.webp'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.webp'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'sok.jpg'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'in.png')
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      "time":instance
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Build!");
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Edit Location"),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              onTap: (){
                updateTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),

            ),
          );
        }
      ),
    );
  }
}
