import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class AddNotes extends StatefulWidget {
  @override
  _AddNotesState createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  GlobalKey<FormState> _formkey = new GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  bool autovalidate = false;
  String title, desc;
  bool loaddone = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
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
                  onPressed: () {
                    showsnackforsaving();
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

  sendnotetofirebase() async {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();

      FirebaseDatabase database = FirebaseDatabase();
      database.setPersistenceEnabled(true);
      database.setPersistenceCacheSizeBytes(1000000);

      DatabaseReference ref = FirebaseDatabase.instance.reference();

      var data = {
        "title": title,
        "details": desc,
      };
      ref.child("notes").child(title).set(data).then((v) async {
        await showsnack();

        _formkey.currentState.reset();
        //if(loaddone == true)
         // Navigator.pop(context);
      });
    } else {
      setState(() {
        autovalidate = true;
      });
    }
  }

  showsnackforsaving() {
    _scaffoldkey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          "Saving Note",
        ),
      ),
    );
  }

  showsnack() async {

    //why is this code throwing exception still when the net if off.
    try{
      _scaffoldkey.currentState.removeCurrentSnackBar();
    }catch(e){
      print(e);
    }
    
    _scaffoldkey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          "Note saved successfully!",
        ),
      ),
    );
  }
}
