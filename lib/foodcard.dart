import 'package:flutter/material.dart';
import 'selctItem.dart';
import 'package:food_app/ItemBody.dart';
class FoodCard extends StatefulWidget {
  FoodCardState createState() => FoodCardState();
  final String userItem;
  final String userImage;
  FoodCard(this.userItem, this.userImage);
}

class FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 400.0,
              floating: false,
              pinned: true,
              backgroundColor: Colors.deepOrange,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(widget.userItem,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: Image.asset(
                    widget.userImage,
                    fit: BoxFit.cover,
                  )),
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 50),
                ),
                SelectItem()],
            ),
          ];
        },
        body: Center(
          child: Card(
            child: ListView(
              children: <Widget>[
                Text('Ingredients',style: TextStyle(
                  color: Colors.black,fontSize: 40.0,
                  fontWeight: FontWeight.bold
                ),),
                ItemBody()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
