import 'package:firebaseauth/HomePage.dart';
import 'package:firebaseauth/Welcome.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> _key1 = GlobalKey<FormState>();
  String email, pass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Signup"
        ),
      ),
      body: Form(
        key: _key1,
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
                  "SignUp",
                ),
                onPressed: (){
                  _signup();
                },
              )
          ],
        ),
      ),
      
    );
  }
  _signup() async{
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseUser user;
    if(_key1.currentState.validate()){
      _key1.currentState.save();
      try{
        user = (await _auth.createUserWithEmailAndPassword(
          email: email,
          password: pass,
        )).user;
        print(user.uid.toString());
        Navigator.pushReplacement(context,
        MaterialPageRoute(
          builder: (context) => Welcome(user: user)
        )
        );
      }catch(e){
        print(e);
      }
    
    }
  }

}