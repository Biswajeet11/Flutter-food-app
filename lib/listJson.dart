import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:food_app/ItemBody.dart';
import 'package:food_app/dataItem.dart';
class ListJson extends StatefulWidget {
  _ListJsonState createState() => _ListJsonState();
}

class _ListJsonState extends State<ListJson> {
    List<DataItem> parseJson(String response) {
    if (response == null) {
      print('nullllllllllllllllllllllll2222');
      return [];
    } else {
      int i=0;
      List<String> words=new List<String>();
      final parse =
          json.decode(response.toString()).cast<Map<String, dynamic>>();
          print('parssssssssss2s$parse');
          print('data ingredients iss:  ${parse[0]["ingredients"]}');
          for (var word in parse[0]['ingredients']) {
            words.add(word);
    //print('word to string  ${word.toString()}');
    print('$words');
  }
 
      return parse
          .map<DataItem>((json) => new DataItem.fromJson(json))
          .toList();
    }
  }
  @override
  Widget build(BuildContext context) {
    print('jsondatacomingggggg');
         return Container(
      child: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString('assets/direction.json'),
          builder: (context, snapshot) {
            print('the new data$snapshot');
           List<DataItem>listbody =parseJson(snapshot.data.toString());
             parseJson(snapshot.data.toString());
          print('listbodyyyyyyy$listbody');
            return(
              // listbody.isNotEmpty
              //   ? ItemBody(
              //     itemList: listbody,
              //   )
              //  : 
                new Center(
                    child: CircularProgressIndicator(),
                  )
            );
          }),
    );
  }
}