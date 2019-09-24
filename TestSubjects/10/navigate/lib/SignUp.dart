import 'package:flutter/material.dart';
import 'HomePage.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> _key = new GlobalKey();
   String name, email, mobile, collegename;
  
  bool _autovalidate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp"),
      ),
      body: Form(
        key: _key,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Image(
                image: AssetImage(""),
                width: 100.0,
                height: 100.0,
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: TextFormField(
                  validator: (input){
                    if(input.isEmpty){
                      return "Enter Name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: "Name"),
                  onSaved: (input) => name = input,
                )
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (input){
                    if(input.isEmpty){
                      return "Enter email";
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: "Email"),
                  onSaved: (input) => email = input,
                )
              ),
              ListTile(
                leading: Icon(Icons.mobile_screen_share),
                title: TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (input){
                    if(input.isEmpty){
                      return "Enter mobile";
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: "Mobile"),
                  onSaved: (input) => mobile = input,
                )
              ),
              ListTile(
                leading: Icon(Icons.school),
                title: TextFormField(
                  validator: (input){
                    if(input.isEmpty){
                      return "Enter CollegeName";
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: "CollegeName"),
                  onSaved: (input) => collegename = input,
                )
              ),
              RaisedButton(
                child: Text("SUBMIT"),
                onPressed: _sendToNextScreen,
              )

            ],
          ),

        ),
      ),
      
    );
    
  }
  _sendToNextScreen(){
    if(_key.currentState.validate()){
      _key.currentState.save();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
            name: name,
            mobile: mobile,
            email: email,
            collegename: collegename,
          ),
          ),
        );
      
    }
    else{
      setState(() {
       _autovalidate = true; 
      });
    }
      
    }
}