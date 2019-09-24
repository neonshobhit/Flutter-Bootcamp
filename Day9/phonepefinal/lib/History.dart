import 'package:flutter/material.dart';
import 'package:phonepefinal/AppBar.dart';
import 'BottomNavBar.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    int count = 100;
    return Scaffold(
      appBar: MyCustomAppBarMade.getAppBar(),
      body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              primary: true,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 40.0,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    scrollDirection: Axis.vertical,
                    itemCount: 30,
                    itemBuilder: (BuildContext context, int index) =>Column(
                      children: <Widget>[
                        Card(
                          elevation: 5,
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                leading: Container(
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.purple,
                                    backgroundImage: AssetImage(""),
                                  ),
                                ),
                                title: Text("Paid To"),
                                subtitle: Text("Shobhit Maheshwari"),
                                trailing: Text("Rs ${count++}"),
                              ),
                              Row(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "$count days ago.",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300
                                      ),
                                      
                                    )
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      "                                                 Debited from: ",
                                    ),
                                  ),
                                  Icon(Icons.account_balance_wallet),
                                ],
                              )
                              
                            ],
                          ),
                        )
                      ],
                    ),
                  )
            
                ],
              ),
      ),
      bottomNavigationBar: MyMadeBottomBar(),
      
    );
  }
}