import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class AddNotes extends StatefulWidget {
  String innitialname, initialnumber, initialemail, initialURL;
  bool updating;
  var contactkey;
  AddNotes({
    Key key,
    @required this.innitialname,
    this.initialnumber,
    this.initialemail,
    this.initialURL,
    this.updating,
    this.contactkey,
  }) : super(key: key);
  @override
  _AddNotesState createState() => _AddNotesState(
        innitialname: innitialname,
        initialnumber: initialnumber,
        initialemail: initialemail,
        initialURL: initialURL,
        updating: updating,
        contactkey: contactkey,
      );
}

class _AddNotesState extends State<AddNotes> {
  String innitialname, initialnumber, initialemail, initialURL;
  bool updating;
  var contactkey;
  _AddNotesState({
    Key key,
    @required this.innitialname,
    this.initialnumber,
    this.initialemail,
    this.initialURL,
    this.updating,
    this.contactkey,
  });

  GlobalKey<FormState> _formkey = new GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  bool autovalidate = false;
  String name, number, email;
  bool loaddone = false;
  File _image;
  String _uploadedFileURL = null;
  var __key;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    __key = contactkey;
    _uploadedFileURL = initialURL;
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Future uploadFile() async {
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child("Profiles");

    final StorageUploadTask task =
        storageReference.child(__key).putFile(_image);

    StorageTaskSnapshot taskSnapshot = await task.onComplete;
    _uploadedFileURL = await taskSnapshot.ref.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        //toolbarOpacity: 0.5,
        //backgroundColor: Colors.transparent,
        title: Text(
          "Add Contacts",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: GestureDetector(
                        onTap: () {
                          getImage();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.5,
                              )),
                          child: ClipOval(
                            child: _image == null
                                ? _uploadedFileURL == null
                                    ? Container(
                                        color: Colors.black,
                                      )
                                    : Image.network(
                                        _uploadedFileURL,
                                      )
                                : Image.file(
                                    _image,
                                    fit: BoxFit.cover,
                                  ),

                            // _image == null && _uploadedFileURL == null
                            //     ? Container(
                            //         color: Colors.black,
                            //       )
                            //     : _uploadedFileURL == null
                            //         ? Image.file(
                            //             _image,
                            //             fit: BoxFit.cover,
                            //           )
                            //         : Image.network(
                            //             _uploadedFileURL,
                            //           ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.data_usage),
                    title: TextFormField(
                      initialValue: innitialname,
                      decoration: InputDecoration(
                        hintText: "Name",
                        labelText: "Name",
                      ),
                      onSaved: (String value) {
                        setState(() {
                          innitialname = "";
                        });
                        name = value;
                      },
                      validator: (String value) {
                        if (value.isEmpty) return "Name can't be empty";
                        return null;
                      },
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.phone,
                    ),
                    title: TextFormField(
                      initialValue: initialnumber,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Number",
                        labelText: "Number",
                      ),
                      onSaved: (String value) {
                        setState(() {
                          initialnumber = "";
                        });
                        number = value;
                      },
                      validator: (String value) {
                        if (value.isEmpty) return "Number can't be empty";
                        return null;
                      },
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.email,
                    ),
                    title: TextFormField(
                      initialValue: initialemail,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Email",
                        labelText: "Email",
                      ),
                      onSaved: (String value) {
                        setState(() {
                          initialemail = "";
                        });

                        email = value;
                      },
                      validator: (String value) {
                        if (value.isEmpty) return "Email can't be empty";
                        String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
                            "\\@" +
                            "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
                            "(" +
                            "\\." +
                            "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
                            ")+";
                        RegExp regExp = new RegExp(p);

                        if (!regExp.hasMatch(value)) {
                          // So, the email is valid
                          return "Enter proper email address";
                        }

                        return null;
                      },
                    ),
                  ),
                  RaisedButton(
                    child: Text(
                      "Save",
                    ),
                    onPressed: () {
                      sendnotetofirebase();
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  sendnotetofirebase() async {
    if (_formkey.currentState.validate()) {
      showsnackforsaving();

      _formkey.currentState.save();

      FirebaseDatabase database = FirebaseDatabase();
      database.setPersistenceEnabled(true);
      database.setPersistenceCacheSizeBytes(1000000);

      DatabaseReference ref = FirebaseDatabase.instance.reference();
      var enteredwithkey;
      var majorkey;
      if (updating == true) {
        enteredwithkey = ref.child("contacts").child(contactkey);
        majorkey = contactkey;
      } else {
        enteredwithkey = ref.child("contacts").push();
        majorkey = enteredwithkey.key;
      }

      __key = majorkey;
      if (_image != null) await uploadFile();

      var data = {
        "name": name,
        "number": number,
        "email": email,
        "url": _uploadedFileURL,
      };

      enteredwithkey.set(data).then((v) {
        setState(() {
          _uploadedFileURL = null;
          _image = null;
        });
        _formkey.currentState.reset();
        Navigator.of(context).pop();
      });

      // ref.child("notes").child(ref.push().key).set(data).then((v) async {
      //   await showsnack();

      //   _formkey.currentState.reset();
      //   //print(ref.child(name).push().key);
      //   //if(loaddone == true)
      //   // Navigator.pop(context);
      // });
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
    try {
      _scaffoldkey.currentState.removeCurrentSnackBar();
    } catch (e) {
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
