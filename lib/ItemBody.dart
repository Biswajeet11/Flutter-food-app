import 'package:flutter/material.dart';
import 'package:food_app/listJson.dart';
import 'package:food_app/dataItem.dart';
import 'package:food_app/homePage.dart';
import 'package:food_app/savedShop.dart';

class ItemBody extends StatefulWidget {
  final Function dataChange;
  final List<DataItem> itemList;
  ItemBody({Key key, this.itemList, this.dataChange}) : super(key: key);
  @override
  ItemBodyState createState() {
    return new ItemBodyState();
  }
}

class ItemBodyState extends State<ItemBody> {
  List<String> checklist = [
    "burger",
    "chicken",
    "leaves",
    "sauce",
    "pizza",
    "mutton",
    "tomato",
    "dough",
  ];
  List<String> _selectedItems = [];
  List<String> recipeBook = [
    "Preheat oven to 425°F.",
    "Cut off the woody bottom part of the asparagus spears and discard.",
    "With a vegetable peeler, peel off the skin on the bottom 2-3 inches of the spears (this keeps the asparagus from being all, and if you eat asparagus you know what I mean by that).",
    "Place asparagus on foil-lined baking sheet and drizzle with olive oil.",
    "Sprinkle with salt.",
    "With your hands, roll the asparagus around until they are evenly coated with oil and salt.",
  ];
  bool check = false;
  List<int> _compareIndex = [];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < checklist.length; i++) _compareIndex.add(0);
  }

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return Column(
      children: <Widget>[
        Card(
          child: Column(
            children: <Widget>[
              ListBody(
                  children: checklist
                      .map((ele) => checkBox(ele, index++))
                      .toList(growable: false)),
            ],
          ),
        ),
        Center(
            child: Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(40.0),
                child: CircleAvatar(
                  child: IconButton(
                    icon: Icon(Icons.check),
                    onPressed: () {
                      selectAll();
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(40.0),
                child: CircleAvatar(
                  child: IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      clear();
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(40.0),
                child: CircleAvatar(
                  child: IconButton(
                    icon: Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      if (!_compareIndex.contains(1)) {
                        viewdialog();
                      } else {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Added to shopping List'),
                          duration: Duration(seconds: 2),
                          action: SnackBarAction(
                            label: 'view cart',
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      FavouriteList(checklist)));
                            },
                          ),
                        ));
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        )),
        Text(
          'Recipe',
          style: TextStyle(fontSize: 40),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: recipeData(),
        )
      ],
    );
  }

  Widget checkBox(String text, int index) {
    print('checkkboxbbbbbb$text');
    return CheckboxListTile(
      activeColor: Colors.blueGrey,
      title: Text(text),
      value: _compareIndex[index] != 0 ? true : false,
      onChanged: (bool check) {
        onchange(index);
      },
    );
  }

  Widget recipeData() {
    return Card(
      color: Colors.blueGrey[50],
      child: Column(
          children: recipeBook
              .map((f) => Text(
                    f,
                    style: TextStyle(
                        color: Colors.black, fontSize: 20.0, debugLabel: f),
                  ))
              .toList()),
    );
  }

  void clear() {
    setState(() {
      for (int i = 0; i < checklist.length; i++) {
        _compareIndex[i] = 0;
      }
    });
  }

  void selectAll() {
    setState(() {
      // check = true;
      for (int i = 0; i < checklist.length; i++) {
        _compareIndex[i] = 1;
      }
    });
  }

  void onchange(int value) {
    setState(() {
      // check = value;
      if (_compareIndex[value] == 0) {
        _compareIndex[value] = 1;
      } else {
        _compareIndex[value] = 0;
      }
    });
    widget.dataChange();
  }

  viewdialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add some Items'),
            content: Row(
              children: <Widget>[
                FlatButton(
                    color: Colors.black54,
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    })
              ],
            ),
          );
        });
  }
}
