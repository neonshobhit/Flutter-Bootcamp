import 'package:flutter/material.dart';
import 'package:linkedinfinal/AppBar.dart';
import 'package:linkedinfinal/BottomBar.dart';

class Connections extends StatefulWidget {
  @override
  _ConnectionsState createState() => _ConnectionsState();
}

class _ConnectionsState extends State<Connections> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBarMade.getAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Positioned(
                              child: Image(
                                height: 150.0,
                                width: 100.0,
                                image: AssetImage(""),
                              ),
                            ),
                            Positioned(
                              top: 100,
                              width: 100,
                              child: CircleAvatar(
                                child: Container(
                                  child: Image(
                                    image: AssetImage(""),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Aviral Chaudhary",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "DotNET developer",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100.0,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Mutual Connections",
                            style: TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: MaterialButton(
                              padding: EdgeInsets.all(8.0),
                              color: Colors.white,
                              minWidth: 155.0,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              child: Text(
                                "CONNECT",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {},
                            ))
                      ],
                    ),
                  ),
                ),
                /*

            copied

            */
                Expanded(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Positioned(
                              child: Image(
                                height: 150.0,
                                width: 100.0,
                                image: AssetImage(""),
                              ),
                            ),
                            Positioned(
                              top: 100,
                              width: 100,
                              child: CircleAvatar(
                                child: Container(
                                  child: Image(
                                    image: AssetImage(""),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Aviral Chaudhary",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "DotNET developer",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100.0,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Mutual Connections",
                            style: TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: MaterialButton(
                              padding: EdgeInsets.all(8.0),
                              color: Colors.white,
                              minWidth: 155.0,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              child: Text(
                                "CONNECT",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {},
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ), //
            Row(
              children: <Widget>[
                Expanded(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Positioned(
                              child: Image(
                                height: 150.0,
                                width: 100.0,
                                image: AssetImage(""),
                              ),
                            ),
                            Positioned(
                              top: 100,
                              width: 100,
                              child: CircleAvatar(
                                child: Container(
                                  child: Image(
                                    image: AssetImage(""),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Aviral Chaudhary",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "DotNET developer",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100.0,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Mutual Connections",
                            style: TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: MaterialButton(
                              padding: EdgeInsets.all(8.0),
                              color: Colors.white,
                              minWidth: 155.0,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              child: Text(
                                "CONNECT",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {},
                            ))
                      ],
                    ),
                  ),
                ),
                /*

            copied

            */
                Expanded(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Positioned(
                              
                              child: Image(
                                height: 150.0,
                                width: 100.0,
                                image: AssetImage(""),
                              ),
                            ),
                            Positioned(
                              top: 100,
                              width: 100,
                              child: CircleAvatar(
                                child: Container(
                                  child: Image(
                                    image: AssetImage(""),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Aviral Chaudhary",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "DotNET developer",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100.0,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Mutual Connections",
                            style: TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: MaterialButton(
                              padding: EdgeInsets.all(8.0),
                              color: Colors.white,
                              minWidth: 155.0,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              child: Text(
                                "CONNECT",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {},
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomnavBar(),
    );
  }
}
