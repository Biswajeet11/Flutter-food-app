import 'package:flutter/material.dart';
import 'package:food_app/dataRecipe.dart';
import 'dart:convert';
import 'package:food_app/recipeList.dart';
class ReciepeJson extends StatefulWidget {
  _ReciepeJsonState createState() => _ReciepeJsonState();
}

class _ReciepeJsonState extends State<ReciepeJson> {
  List<DataRecipe> parseJson(String response) {
    if (response == null) {
      print('nulllllllllllllllllllllllll');
      return [];
    } else {
      final parse =
          json.decode(response.toString()).cast<Map<String, dynamic>>();
          print('parsssssssssss$parse');
          print('data food.json:  ${parse[0]}');
      return parse
          .map<DataRecipe>((json) => new DataRecipe.fromJson(json))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    print('futureeeee');
    return Container(
      child: FutureBuilder(
        
          future: DefaultAssetBundle.of(context).loadString('assets/food.json'),
          builder: (context, snapshot) {
              print('the new data$snapshot');
           List<DataRecipe>listbody =parseJson(snapshot.data.toString());
             parseJson(snapshot.data.toString());
          print('listbodyyyyyyy$listbody');
            return(
              listbody.isNotEmpty
                ? RecipeList(
                  recipes: listbody,
                )
               : 
                new Center(
                    child: CircularProgressIndicator(),
                  )
            );
          }),
    );
  }
}
