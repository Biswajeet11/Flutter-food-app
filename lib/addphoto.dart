import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/services.dart';

class AddPhoto extends StatefulWidget {
  _AddPhotoState createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  File _imageFile;
  Color color;
  void _getImage(BuildContext context, ImageSource source) {
    ImagePicker.pickImage(source: source, maxHeight: 400.0).then((File image) {
      setState(() {
        _imageFile = image;
      });
      Navigator.pop(context);
    });
  }

  _close() {
    print('closedddddddd');
    return Navigator.of(context).pop();
  }

  _showModal(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: <Widget>[
              InkWell(
                splashColor: Colors.blueGrey,
                onTap: () {
                  _close();
                },
                child: Icon(Icons.clear),
              )
            ],
            title: Text(
              'Your Selfie',
            ),
            content: Container(
              color: Colors.black,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.file(_imageFile),
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('inirrrrrrrrr');
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  @override
  void dispose() {
    print('disposeeeeeeeeeeee');
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
    super.dispose();
  }

  void _openImagePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 150.0,
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  child: Text('Use camera'),
                  onPressed: () {
                    _getImage(context, ImageSource.camera);
                  },
                ),
                SizedBox(
                  height: 5.0,
                ),
                FlatButton(
                  child: Text('Use gallery'),
                  onPressed: () {
                    _getImage(context, ImageSource.gallery);
                  },
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Add Image'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/background.jpg'),
                  fit:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? BoxFit.fitHeight
                          : BoxFit.fitWidth),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(30),
                ),
                Center(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.camera_front,
                          size: 200.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                OutlineButton(
                  onPressed: () {
                    _openImagePicker(context);
                  },
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20),
                      ),
                      Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'Add Image',
                        style: TextStyle(color: Colors.white, fontSize: 40.0),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                _imageFile == null
                    ? Text(
                        'Please take a selfie',
                        style: TextStyle(color: Colors.white, fontSize: 30.0),
                      )
                    : InkWell(
                        onTap: () {
                          _showModal(context);
                        },
                        child: Image.file(
                          _imageFile,
                          fit: BoxFit.fitHeight,
                          height: 300.0,
                          width: MediaQuery.of(context).size.width * 0.7,
                          alignment: Alignment.topCenter,
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
