import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauth/HomePage.dart';
import 'package:firebaseauth/Welcome.dart';
import 'package:flutter/material.dart';

class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isLoggedIn = false;
  var users;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.currentUser().then((user)=> 
    user !=null
    ?  setState((){
      isLoggedIn = true;
      users = user;
    })
    : null
    ) ;
  }
  @override
  Widget build(BuildContext context) {
    return isLoggedIn
    ? Welcome(
      user: users,
    )
    :HomePage();
  }
}