import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';

void main() => runApp(Loginpage());

class Loginpage extends StatelessWidget {
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
                onPressed: (){},
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
