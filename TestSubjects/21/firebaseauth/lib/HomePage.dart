import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauth/Welcome.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> _key2 = GlobalKey<FormState>();
  String email;
  String pass;
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
        ),
      ),
      body: Form(
        key: _key2,
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.person,
              ),
              title: TextFormField(
                decoration: InputDecoration(
                  hintText: "Email",
                  labelText: "Email Address",
                ),
                onSaved: (String value){
                  email = value;

                },
                validator: (String value){
                  if(value.isEmpty)
                    return "Please enter your email address.";
                  return null;
                },
                
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.security,
              ),
              title: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  
                  hintText: "Password",
                  labelText: "Password:",
                ),
                onSaved: (String value){
                  pass = value;

                },
                validator: (String value){
                  if(value.isEmpty)
                    return "Please enter password.";
                  return null;
                },
                
              ),
            ),
            RaisedButton(
              child: Text(
                "LogIn",
              ),
              onPressed: (){
                signinaccount();
              },
            ),
            RaisedButton(
              child: Text(
                "SignUp",
              ),
              onPressed: (){
                Navigator.popAndPushNamed(context, '/signup');
              },
            )
          ],
        ),
      ),
      
    );
  }


  signinaccount() async {
    if(_key2.currentState.validate()){
      _key2.currentState.save();

      try{
      final FirebaseUser user = (await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: pass,
    )).user;
    setState(() {
     isLoading = false; 
    });
    if(user != null){
      Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => Welcome(
        user: user,
      )
    ));
    }
    }
    catch(e){
      print(e);
    }
    }    
  }
}