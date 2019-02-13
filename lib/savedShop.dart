import 'package:flutter/material.dart';

class FavouriteList extends StatefulWidget {
  final List<String> text;
  FavouriteList(this.text);

  @override
  FavouriteListState createState() {
    return new FavouriteListState();
  }
}

class FavouriteListState extends State<FavouriteList> {
  bool textItem = false;
  String textAdd = "";
  TextEditingController textcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Added Items'),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView(children: <Widget>[
        Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Center(
                child: Column(
              children: <Widget>[
                ListBody(
                  children: widget.text
                      .map((ele) => Container(
                            child: Text(
                              ele,
                              style: TextStyle(fontSize: 30),
                            ),
                          ))
                      .toList(),
                ),
                Divider(),
                ListTile(
                 title:  Text('Added List') ,
                 subtitle: Text('$textAdd',style: TextStyle(fontSize: 30),),
                )
              
              ],
            )),
          ),
        ]),
      ]),
      bottomSheet: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: TextField(
                    controller: textcontroller,
                    decoration: InputDecoration(
                        hintText: 'Enter name of the ingredient'),
                    onChanged: (String text) {
                      setState(() {
                        textItem = text.trim().isNotEmpty;
                        print('text  $text');
                      });
                    },
                    onSubmitted: (String text) {
                      print('ttttttttt$text');
                      submit(text);
                      textcontroller.text = ' ';
                    },
                  ),
                  actions: <Widget>[
                    Container(
                      child: RaisedButton(
                          color: Colors.blueGrey,
                          child: Text(
                            'Add',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            submit(textcontroller.text);
                            textcontroller.text = '';
                          }),
                    ),
                    Container(
                      child: RaisedButton(
                        color: Colors.blueGrey,
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          cancel();
                        },
                      ),
                    )
                  ],
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void cancel() {
    Navigator.of(context).pop();
  }

  void submit(String str) {
    setState(() {
      if (textcontroller.text.isEmpty) {
        print('enter text');
      } else {
        textAdd = textAdd + str;
        print('text enters${textcontroller.toString()}');
      }
    });
  }
}
