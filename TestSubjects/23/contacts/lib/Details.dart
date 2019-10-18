import 'package:contacts/addcontacts.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatefulWidget {
  var contactkey;

  Details({
    Key key,
    @required this.contactkey,
  }) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState(
        contactkey: contactkey,
      );
}

class _DetailsState extends State<Details> {
  var contactkey;
  _DetailsState({
    Key key,
    @required this.contactkey,
  });

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readdata();
  }

  var _imageURL;
  var _name;
  var _number;
  var _email;
  bool isLoading = true;

  DatabaseReference ref = FirebaseDatabase.instance.reference();
  Future<Query> QueryUsers() async {
    return ref.child('contacts').child(contactkey);
  }

  readdata() async {
    await QueryUsers().then((query) async {
      await query.once().then((DataSnapshot snaps) {
        Map<dynamic, dynamic> value = snaps.value;
        _imageURL = value['url'];
        _name = value['name'];
        _number = value['number'];
        _email = value['email'];
        setState(() {
          isLoading = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
        title: Text(
          _name ?? " ",
          style: TextStyle(
            color: Colors.black,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
        ),
        actions: <Widget>[
          Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                _showBottomSheet(context);
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Icon(
          Icons.edit,
          color: Colors.black,
          size: 30,
        ),
        onPressed: () {
          _edit();
        },
      ),
      body: Builder(
        builder: (context) => SingleChildScrollView(
          primary: false,
          child: isLoading
              ? LinearProgressIndicator()
              : Column(
                  children: <Widget>[
                    SizedBox(
                      height: 300,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: MediaQuery.of(context).size.width / 3.4,
                            child: SizedBox(
                              height: 300,
                              child: Image.network(
                                _imageURL ??
                                    "https://image.freepik.com/free-photo/image-human-brain_99433-298.jpg",
                                // fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 40,
                            bottom: 5,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ListTile(
                                leading: Icon(
                                  Icons.supervisor_account,
                                  size: 40,
                                  color: Colors.black,
                                ),
                                title: Text(
                                  _name ?? " ",
                                  style: TextStyle(
                                    fontSize: 40,
                                    decorationColor: Colors.white,
                                    decorationStyle: TextDecorationStyle.wavy,
                                    decorationThickness: 30,
                                    letterSpacing: 2,

                                    //shadows: Colors.white
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    ListTile(
                      leading: IconButton(
                        icon: Icon(
                          Icons.message,
                        ),
                        onPressed: () {
                          _sendmsg();
                        },
                      ),
                      title: Text(
                        _number,
                        textAlign: TextAlign.center,
                      ),
                      subtitle: GestureDetector(
                        onTap: () {
                          _sendmail();
                        },
                        child: Text(
                          _email,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.phone,
                        ),
                        onPressed: () {
                          _dialnumber();
                        },
                      ),
                    ),
                    Divider(),
                  ],
                ),
        ),
      ),
    );
  }

  _showBottomSheet(context) {
    Scaffold.of(context).showBottomSheet(
      (cont) => Container(
        height: 250,
        child: ListTile(
          title: Text(
            "Delete?",
            textAlign: TextAlign.center,
          ),
          subtitle: IconButton(
            icon: Icon(
              Icons.delete,
            ),
            onPressed: () {
              _deletecontact().then((v) {
                Navigator.of(context).pop();
              });
            },
          ),
        ),
      ),
    );
  }

  _dialnumber() async {
    String url = "tel: +91 $_number";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "CouldN't launch";
    }
  }

  _sendmsg() async {
    String url = "sms: +91$_number";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "CouldN't launch";
    }
  }

  _deletecontact() async {
    await ref.child("contacts").child(contactkey).remove().then((_) async {
      StorageReference storageReference =
          FirebaseStorage.instance.ref().child("Profiles").child(contactkey);
      if (_imageURL != null) await storageReference.delete();
      Navigator.of(context).pop();
    });
  }

  _edit() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => AddNotes(
          innitialname: _name,
          initialnumber: _number,
          initialemail: _email,
          initialURL: _imageURL,
          updating: true,
          contactkey: contactkey,
        ),
      ),
    );
  }

  _sendmail() async {
    String url = "mailto: $_email";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "CouldN't launch";
    }
  }

  Widget buildsheet(BuildContext context) {
    return Container();
  }
}
