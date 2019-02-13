import 'package:flutter/material.dart';
import 'package:food_app/dataRecipe.dart';

class Recipes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: DataSearch());
          },
        )
      ],
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final List<String> foodItems = ['Burger', 'Pizza', 'Roti', 'Dal', 'Panner'];
  final List<String> recentItems = ['Burger', 'Pizza', 'Roti', 'Dal', 'Panner'];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Card(
      child: Center(
        child: Container(
          child: Center(
            child: Text(query),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentItems
        : foodItems.where((ele) => ele.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
            onTap: () {
              showResults(context);
            },
            leading: Icon(
              Icons.fastfood,
              color: Colors.red,
            ),
            title: RichText(
              text: TextSpan(
                  text: suggestionList[index].substring(0, query.length),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  children: [
                    TextSpan(
                        text: suggestionList[index].substring(query.length),
                        style: TextStyle(color: Colors.grey))
                  ]),
            ),
          ),
      itemCount: suggestionList.length,
    );
  }
}
