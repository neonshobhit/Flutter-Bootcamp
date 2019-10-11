import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class AddNotes extends StatefulWidget {
  @override
  _AddNotesState createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  GlobalKey<FormState> _formkey = new GlobalKey<FormState>();
  bool autovalidate = false;
  String title, desc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Notes",
        ),
      ),
      body: Column(
        children: <Widget>[
          Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.data_usage),
                  title: TextFormField(
                    decoration:
                        InputDecoration(hintText: "Title", labelText: "Title"),
                    onSaved: (String value) {
                      title = value;
                    },
                    validator: (String value) {
                      if (value.isEmpty) return "Title can't be empty";
                      return null;
                    },
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.description,
                  ),
                  title: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Description",
                      labelText: "Description",
                    ),
                    onSaved: (String value) {
                      desc = value;
                    },
                    validator: (String value) {
                      if (value.isEmpty) return "Description can't be empty";
                      return null;
                    },
                  ),
                ),
                RaisedButton(
                  child: Text(
                    "Save",
                  ),
                  onPressed: (){
                    sendnotetofirebase();
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  sendnotetofirebase() async{
    if(_formkey.currentState.validate()){
      _formkey.currentState.save();

      DatabaseReference ref = FirebaseDatabase.instance.reference();
      

    }
  }
}
