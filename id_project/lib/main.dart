import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Test(),
));


class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}


String setCurrentJob(List lst){
  String first = lst[0];
  lst.removeAt(0);
  lst.add(first);
  return lst[0];
}

class _TestState extends State<Test> {
  List current_jop_list = ["Develop for myself","Develop for us", "Develop for everyone"];
  String current_job = "There'nt any job";
  int job_counter = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("Card Project",style: TextStyle(
            color: Colors.red
        ),),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
        elevation: 0.0,// Nedir bu elevation
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            job_counter +=1;
            current_job = setCurrentJob(current_jop_list);
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/pp.jpg"),
                radius: 60,
              ),
            ),

            Divider(
              height: 40,
              color: Colors.red[300],
            ),
            Text(
              "Name",
              style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Yasin",
              style: TextStyle(
                color: Colors.red,
                letterSpacing: 2.0,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Current Job",
              style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "$current_job",
              style: TextStyle(
                color: Colors.red,
                letterSpacing: 2.0,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Finished Jops Last 30 Day",
              style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "$job_counter",
              style: TextStyle(
                color: Colors.red,
                letterSpacing: 2.0,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "yasinerduran@yandex.com",
                    style: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 2,
                        fontSize: 15
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}


