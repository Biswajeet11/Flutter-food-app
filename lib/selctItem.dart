import 'package:flutter/material.dart';

class SelectItem extends StatefulWidget {
  @override
  SelectItemState createState() {
    return new SelectItemState();
  }
}

class SelectItemState extends State<SelectItem> {
  bool favSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 50.0,
        child: IconButton(
          icon: (favSelected
              ? Icon(
                  Icons.favorite,
                )
              : Icon(
                  Icons.favorite_border,
                )),
          color: Colors.red,
          onPressed: () {
            _toggleFav();
          },
        ),
      ),
    );
  }

  _toggleFav() {
    setState(() {
      if (favSelected) {
        favSelected = false;
      } else {
        favSelected = true;
      }
    });
  }
}
