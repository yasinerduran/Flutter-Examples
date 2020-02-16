
import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

void main() => runApp(MaterialApp(
  home:quotes()
));

class quotes extends StatefulWidget {
  @override
  _quetesState createState() => _quetesState();
}




class _quetesState extends State<quotes> {
  List quotes = [
    Quote(author: "Yasin Erduran",text: "Yaşamadan ölünmüyor!"),
    Quote(author: "Neşet Ertaş", text: "Seni İlelebet benimsin sandım!"),
    Quote(author: "Cem Karaca", text: "Nem kaldı!"),
    Quote(author: "Barış Manço", text: "İki kol dügmesi, ayrı kollarda!")
  ];
  final author_controler = TextEditingController();
  final quote_controler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.speaker_notes
            ),
            SizedBox(
              width: 6,
            ),
            Text("Awsome Quote")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Colors.redAccent,
        onPressed: (){
          showDialog(
            context: context,
            builder: (context){
              return Dialog(
                shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 16,
                child: Container(
                  height: 225,
                  width: 200,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        TextField(

                          controller: author_controler,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Author'
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: quote_controler,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Quote'
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.add,
                                color: Colors.redAccent,
                              ),
                              onPressed: (){
                                setState(() {
                                  quotes.add(Quote(author: author_controler.text,text: quote_controler.text));
                                  Navigator.pop(context);
                                });
                              },
                            )
                          ],
                        )

                      ],
                    ),
                  ),
                ),
              );
            }
          );
        },
      ),
      body: Container(
        child: new SingleChildScrollView(
          child: Column(
              children: quotes.map((quote) => QuoteCard(
                quote:quote,
                delete:(){
                  setState(() {
                    quotes.remove(quote);
                  });
                },
              )).toList(),
          ),
        ),
      ),

    );
  }
}




