import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:english_words/english_words.dart';

main() => runApp(SignUp());

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordpair = WordPair.random();
    return MaterialApp(
      //theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: "Sign-Up Page",
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Sign-Up Page"),
          backgroundColor: Colors.redAccent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: new Text(
                "New here?",
                style: TextStyle(
                  //backgroundColor: Colors.yellow,
                  fontSize: 25.0,
                  color: Colors.redAccent[700],
                ),
              ),
            ),
            Text(
              "Lets' fill details",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
            Container(
              child: Align(
                alignment: Alignment.topLeft,
                child: new Text(
                  "    Name",
                  style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Name",
                prefixIcon: const Icon(Icons.person, color: Colors.blueGrey),
              ),
              textAlign: TextAlign.right,
            ),
            Container(
              child: Align(
                alignment: Alignment.topLeft,
                child: new Text(
                  "    Email Id",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Email-Id",
                prefixIcon: const Icon(Icons.email, color: Colors.blueGrey),
              ),
              textAlign: TextAlign.right,
              keyboardType: TextInputType.emailAddress,
            ),
            Container(
              child: Align(
                alignment: Alignment.topLeft,
                child: new Text(
                  "    Date Of Birth",
                  style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "DD/MM/YYYY",
                prefixIcon:
                    const Icon(Icons.calendar_today, color: Colors.blueGrey),
              ),
              textAlign: TextAlign.right,
            ),
            Container(
              child: Align(
                alignment: Alignment.topLeft,
                child: new Text(
                  "    Mobile Number",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Mobile Number",
                prefixIcon: const Icon(Icons.mobile_screen_share,
                    color: Colors.blueGrey),
              ),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.right,
              maxLength: 10,
              maxLengthEnforced: false,
            ),
            Container(
              child: Align(
                alignment: Alignment.topLeft,
                child: new Text(
                  "    Password",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter Password",
                prefixIcon: const Icon(Icons.security, color: Colors.blueGrey),
              ),
              textAlign: TextAlign.right,
              obscureText: true,
            ),
            RaisedButton(
              child: Text(
                wordpair.asPascalCase,
                style: TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 15.0,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () {main();},
            ),
            Text("*It will not sign up Now."),
          ],
        ),
        resizeToAvoidBottomPadding: false,
      ),
    );
  }
}
