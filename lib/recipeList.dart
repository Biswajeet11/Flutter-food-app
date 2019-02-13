import 'package:flutter/material.dart';
import 'package:food_app/dataRecipe.dart';
import 'package:food_app/foodcard.dart';

class RecipeList extends StatelessWidget {
  final List<DataRecipe> recipes;

  RecipeList({Key key, this.recipes}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('recipt list $recipes');
    return ListView.builder(
      itemCount: recipes == null ? 0 : recipes.length,
      itemBuilder: (context, int index) {
        return Container(
            child: Column(
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => FoodCard(recipes[index].title,recipes[index].image)));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: Colors.white,
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: listmake(index),
                ),
              ),
            ),
          ],
        ));
      },
    );
  }

  Widget listmake(int index) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(),
        child: CircleAvatar(
          backgroundImage: AssetImage(recipes[index].image),
          maxRadius: 35,
        ),
      ),
      title: Text(
        recipes[index].title,
        style: TextStyle(color: Colors.grey[750]),
      ),
      subtitle: Row(
        children: <Widget>[Text(recipes[index].description)],
      ),
    );
  }
}
