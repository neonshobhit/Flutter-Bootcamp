import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  final databasereference = Firestore.instance;
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookAuthProvider facebookAuthProvider = FacebookAuthProvider();

  // Widget _buildBody(BuildContext context, ){
  //   return StreamBuilder<QuerySnapshot>(
  //     stream: Firestore.instance.collection('Voters').snapshots(),
  //     builder: (context, snapshot){
  //       if(!snapshot.hasData)
  //         return LinearProgressIndicator();
  //       return _buildList(context, snapshot.data.documents);

  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Online Voting",
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              StreamBuilder(
                stream: Firestore.instance.collection('Voters').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return LinearProgressIndicator();
                  return ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    //itemExtent: 80.0,
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onDoubleTap: (){
                          voteReset(snapshot.data.documents[index]);
                        },
                        child: Card(
                        child: GestureDetector(
                          onTap: () {
                            voteCount(snapshot.data.documents[index]);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: ListTile(
                              title: Text(snapshot.data.documents[index]['name']),
                              trailing: Text(
                                snapshot.data.documents[index]['votes']
                                    .toString(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      );
                    },
                  );
                },
              ),
              Container(
                child: Text(
                  "Hello",
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    RaisedButton(
                      child: Text(
                        "Authenticate(Google)",
                      ),
                      onPressed: (){
                        _handleSignIn()
                        .then((FirebaseUser user)=> print(user))
                        .catchError((e) => print(e));
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  voteReset(DocumentSnapshot doc){
    Firestore.instance.runTransaction((transaction) async{
      DocumentSnapshot freshSnap = await transaction.get(doc.reference);
      await transaction.update(freshSnap.reference, {
        'votes': 0,
      });
    });

  }

  voteCount(DocumentSnapshot doc) {
    Firestore.instance.runTransaction((transaction) async {
      DocumentSnapshot freshSnap = await transaction.get(doc.reference);
      await transaction.update(freshSnap.reference,{
        'votes' : freshSnap['votes'] + 1,
      });
    });
    // doc.reference.updateData({
    //   'votes' : doc['votes'] + 1,
    // });
  }

  Future<FirebaseUser> _handleSignIn() async{
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );

    final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    print("signed in" + user.displayName);
    return user;

  }
}
