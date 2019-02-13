import 'package:flutter/material.dart';
import 'package:food_app/recipes.dart';
import 'package:food_app/addphoto.dart';
import 'recipesjson.dart';

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() {
    return new MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  final List<String> foodItems = ['muffin', 'cake', 'egg'];
  List<DropdownMenuItem<String>> listDrop = [];
  String searchText;
  final searchController = new TextEditingController();

  String dropName;
  bool showBar = false;

  List<DropdownMenuItem<String>> _loadData() {
    return foodItems
        .map((ele) => DropdownMenuItem(
              value: ele,
              child: Text(ele),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        appBar: AppBar(
          title: Recipes(),
          backgroundColor: Colors.deepOrange,
          actions: <Widget>[
            DropdownButton(
              value: dropName,
              items: _loadData(),
              onChanged: (String value) {
                setState(() {
                  dropName = value;
                  print('new value object $dropName');
                });
              },
              hint: Text('Select one Item'),
            ),
          ],
          flexibleSpace: Padding(
            padding: EdgeInsets.only(right: 100.0),
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: 40.0,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1),
                height: MediaQuery.of(context).size.height * 0.28,
                width: MediaQuery.of(context).size.width,
                color: Colors.green,
                child: Text(
                  'All Recipes free',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              ListBody(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Recipes'),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (BuildContext context) => MyHomePage()));
                    },
                  ),
                    ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text('Favourites'),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (BuildContext context) => MyHomePage()));
                    },
                  ),
                    ListTile(
                    leading: Icon(Icons.camera_enhance),
                    title: Text('Add Image'),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (BuildContext context) => AddPhoto()));
                    },
                  )
                ],
              ),
            ],
          ),
        ),
        body: ReciepeJson());
  }
}
