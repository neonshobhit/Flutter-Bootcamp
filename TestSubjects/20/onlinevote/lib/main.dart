import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  final databasereference = Firestore.instance;
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String useremail = " ";
  String username = " ";
  String photourl =
      "https://vignette.wikia.nocookie.net/naruto/images/9/97/Hinata.png/revision/latest?cb=20141010104729";

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationid;
  //final FacebookAuthProvider _facebookAuthProvider = FacebookAuthProvider();
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
  final TwitterLogin twitterLogin = new TwitterLogin(
    consumerKey: "qHh5ztJdyFSUTUHaFLaThhSAy",
    consumerSecret: "6IiUkQ4gJXxvNvsyY87XwGzN6yeSo5nipymZBhmL2Pba46yFsz",
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Online Vote",
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
                        onDoubleTap: () {
                          voteReset(snapshot.data.documents[index]);
                          voteerase(snapshot.data.documents);
                        },
                        child: Card(
                          child: GestureDetector(
                            onTap: () {
                              voteCount(snapshot.data.documents[index]);
                            },
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: ListTile(
                                title: Text(
                                    snapshot.data.documents[index]['name']),
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
                child: Column(
                  children: <Widget>[
                    RaisedButton(
                      child: Text(
                        "Authenticate(Google)",
                      ),
                      onPressed: () {
                        _handleSignIn()
                            .then((FirebaseUser user) => print(user))
                            .catchError((e) => print(e));
                      },
                    ),
                    RaisedButton(
                      child: Text(
                        "Authenticate(Twitter)",
                      ),
                      onPressed: () {
                        twitterlogin();
                      },
                    ),
                    RaisedButton(
                      child: Text(
                        "PhoneAuth",
                      ),
                      onPressed: () {
                        //phonenumauth();
                      },
                    ),
                    RaisedButton(
                      child: Text(
                        "Anonymous Signup",
                      ),
                      onPressed: () {
                        signupanonymously();
                      },
                    ),
                    RaisedButton(
                      child: Text(
                        "Sign-Out",
                      ),
                      onPressed: () {
                        _signout();
                      },
                    ),
                  ],
                ),
              ),
              Container(
                child: Text(
                  "Hello " + username,
                ),
              ),
              Container(
                  child: Text(
                useremail,
              )),
              Container(
                child: Image.network(
                  photourl,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  String phoneNo = "+919413460572";
  String smsCode;
  /*
  Future<void> phonenumauth() async {

    final PhoneCodeSent smsCodeSent = (String verId, [int forcecodeRedend]) {
      this.verificationid = verId;
      smsCodeDialog(context).then((value){
        print('Signed In!');
      });
    };



    final PhoneCodeAutoRetrievalTimeout autoretrieve = (String verId) {
      this.verificationid = verId;
    };

    
    final PhoneVerificationCompleted verifiedSuccess =(FirebaseUser user){
      print("Verified");
    };
    final PhoneVerificationFailed veriFailed = (AuthException exception){
      print("${exception.message}");
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: this.phoneNo,
      codeAutoRetrievalTimeout: autoretrieve,
      codeSent: smsCodeSent,
      timeout: const Duration(seconds: 10),
      //verificationCompleted: verifiedSuccess,
      verificationFailed: veriFailed,
    );

  }

  Future<bool> smsCodeDialog(BuildContext context){
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return new AlertDialog(
          title: Text("enter Sms Code"),
          content: TextField(
            onChanged: (value){
              this.smsCode = value;
            },
          ),
          contentPadding: EdgeInsets.all(10),
          actions: <Widget>[
            new FlatButton(
              child: Text("Done"),
              onPressed: (){
                FirebaseAuth.instance.currentUser().then((user){
                  if(user != null){
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacementNamed('/homePage');

                  }else{
                    Navigator.of(context).pop();
                    signIn();
                  }
                });
              },
            )
          ],
        );
      }
    );
  }

  signIn() async {
    try{
      AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verificationid,
        smsCode: smsCode,
      );

      FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
      print(user.uid);
    }catch(e){
      print(e);
    }
  }

  */
  voteerase(var erasingvotes) {
    for (int i = 0; i < erasingvotes.length; i++) {
      Firestore.instance.runTransaction((transaction) async {
        DocumentSnapshot freshSnap =
            await transaction.get(erasingvotes[i].reference);
        await transaction.update(freshSnap.reference, {
          'votes': 0,
        });
      });
    }
  }

  voteReset(DocumentSnapshot doc) {
    Firestore.instance.runTransaction((transaction) async {
      DocumentSnapshot freshSnap = await transaction.get(doc.reference);
      await transaction.update(freshSnap.reference, {
        'votes': 0,
      });
    });
  }

  voteCount(DocumentSnapshot doc) {
    Firestore.instance.runTransaction((transaction) async {
      DocumentSnapshot freshSnap = await transaction.get(doc.reference);
      await transaction.update(freshSnap.reference, {
        'votes': freshSnap['votes'] + 1,
      });
    });
    // doc.reference.updateData({
    //   'votes' : doc['votes'] + 1,
    // });
  }

  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print("signed in" + user.displayName + "EMAIL:" + user.email);
    setState(() {
      username = user.displayName;
      useremail = user.email;
      photourl = user.photoUrl;
    });

    return user;
  }

  _signout() async {
    await FirebaseAuth.instance.signOut();
    await _googleSignIn.signOut();
    await twitterLogin.logOut();
    setState(() {
      useremail = " ";
      username = " ";
      photourl =
          "https://vignette.wikia.nocookie.net/naruto/images/9/97/Hinata.png/revision/latest?cb=20141010104729";
    });
  }

  twitterlogin() async {
    final TwitterLoginResult result = await twitterLogin.authorize();
    AuthCredential credential;
    setState(() {
      switch (result.status) {
        case TwitterLoginStatus.loggedIn:
          useremail = result.session.username;
          print(result.session.toMap());
          break;
        case TwitterLoginStatus.cancelledByUser:
          useremail = " ";
          break;
        case TwitterLoginStatus.error:
          useremail = "Error happened";
          break;
      }
    });

    credential = TwitterAuthProvider.getCredential(
      authToken: result.session.token,
      authTokenSecret: result.session.secret,
    );
    try{
      FirebaseUser firebaseUser =
        (await _auth.signInWithCredential(credential)).user;
    print(firebaseUser.toString());

    }catch(e){
      print(e);
    }
  }

  signupanonymously() async{
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser user = (await firebaseAuth.signInAnonymously()).user;
    print(user.uid);
    print("SignedIn");
  }
}
