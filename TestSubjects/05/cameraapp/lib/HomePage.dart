import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camera App"),
      ),
      body: Container(
        child: _image == null ? Text("No Image Selected") : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo),
        onPressed: () => opendialogue(),
      ),
    );
  }

  Future<void> opendialogue() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          //Stadium
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(150.0),
          ),
          title: Text('Choose Options'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text("Open Camera", style: TextStyle(color: Colors.white)),
                  onTap: opencamera,
                ),
                GestureDetector(
                  child: Text("Open Gallery", style: TextStyle(color: Colors.white)),
                  onTap: opengallery,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future opencamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  Future opengallery() async {
    var galleryimage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = galleryimage;
    });
  }
}
