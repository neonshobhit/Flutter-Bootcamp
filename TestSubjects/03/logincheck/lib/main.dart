import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';

void main() => runApp(Loginpage());

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  var output = new TextEditingController();
  var input1 = new TextEditingController();
  var input2 = new TextEditingController();
  buttonPressed(var email, var pass){
    setState(() {
      if(email.text == "shobhitmaheshwari18@gmail.com" && pass.text =="qwerty"){
        output.text = "Successfully Logged In" ;
      }
      else{
        output.text = "";
      } 
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        title: "helloThere",
        home: Scaffold(
          appBar: AppBar(
            title: Text("Login to my app."),
            backgroundColor: Colors.blue[400],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: new Text(
                  "Wanna Login Here?",
                  style: new TextStyle(
                    fontSize: 30.0,
                   color: Colors.white,
                  ),
                ),
              ),
              Text(
                "Let's get started!",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white24,
                ),
              ),
              Container(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: new Text(
                    "    Email",
                    style: new TextStyle(
                      fontSize: 20.0,
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter email",
                  prefixIcon: Icon(Icons.email, color: Colors.white30),
                ),
                textAlign: TextAlign.right,
                controller: input1,
              ),
              Container(
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "    Password",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.yellow,
                        ),
                      ))),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  prefixIcon: const Icon(Icons.security, color: Colors.white30),
                ),
                controller: input2,
                textAlign: TextAlign.right,
                obscureText: true,
              ),
              RaisedButton(
                child: Text(
                  "LogIn",
                  style: TextStyle(
                    color: Colors.orangeAccent,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                onPressed: (){buttonPressed(input1,input2);},
              ),
              Container(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Incorrect",
                      enabled: false,
                    ),
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                    controller: output,
                  ),
                ),
              ),
              Container(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text("*It Won't LogIn now."),
                ),
              ),
                
            ],
          ),
        )
      );
  }
}
