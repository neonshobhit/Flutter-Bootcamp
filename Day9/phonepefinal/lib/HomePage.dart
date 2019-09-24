import 'package:flutter/material.dart';
import 'package:phonepefinal/AppBar.dart';
import 'BottomNavBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count =0;
  var list = [
    Icon(
      Icons.send,
      size: 50,
    ),
    Icon(Icons.account_balance, size: 50,),
    Icon(Icons.person_pin,size: 50,),
    Icon(Icons.account_balance_wallet,size: 50,),
    Icon(Icons.call_split,size: 50,),
    Icon(Icons.call_received,size: 50,)
  ];
  var textList = [
    "To Contact",
    "To Account",
    "To Self",
    "Bank Balance",
    "Split Bill",
    "Request",
  ];
  var peoplelist = [
    "Ayush",
    "Harshit",
    "Sanskriti",
    "Divanshu",
    "Tarun",
    "Saurav",
    "Mayank"
  ];
  var billslist = [
    "Recharge",
    "DTH",
    "Electricity",
    "Credit Card",
    "PostPaid",
    "LandLine",
    "Broadband",
    "Gas",
    "Water",
    "DataCard",
    "Insurance",
    "MunicipalTax",
    "Google Play",
    "PhonePe Gift",
    "Other Gift Card",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBarMade.getAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Money Transfer",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (BuildContext context, index) => Column(
                  children: <Widget>[
                    Container(
                      height: 55.0,
                      //padding: EdgeInsets.all(20.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10.0,20.0,10.0,20.0),
                          child: list[index],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 20.0),),
                    Text(
                      textList[index],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Divider(),
            ),
            SizedBox(
              height: 110,
              child: ListView.builder(
                semanticChildCount: 3,
                scrollDirection: Axis.horizontal,
                itemCount: peoplelist.length,
                itemBuilder: (BuildContext context, int index) => Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: GestureDetector(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 70.0,
                              width: 70.0,
                              child: CircleAvatar(
                                radius: 50.0,
                                backgroundColor: Colors.black,
                                backgroundImage: AssetImage(""),
                              ),
                            ),
                            Text(peoplelist[index]),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
              child: Container(
                color: Colors.grey[300],
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 150,
                      //width: MediaQuery.of(context).size.width ,
                      color: Colors.grey[300],
                      child: GestureDetector(
                        onTap: () {},
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(15.0, 20.0, 30.0, 0.0),
                              child: Container(
                                height: 80.0,
                                width: 80.0,
                                child: CircleAvatar(
                                  radius: 50.0,
                                  backgroundColor: Colors.pink,
                                  backgroundImage: AssetImage(""),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(15.0, 3.0, 30.0, 0.0),
                              child: Text("View All\nOffers"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    VerticalDivider(),
                    Container(
                       height: 150,
                      //width: MediaQuery.of(context).size.width ,
                      color: Colors.grey[300],
                      child: GestureDetector(
                        onTap: () {},
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(10.0, 20.0, 30.0, 0.0),
                              child: Container(
                                height: 80.0,
                                width: 80.0,
                                child: CircleAvatar(
                                  radius: 50.0,
                                  backgroundColor: Colors.orange,
                                  backgroundImage: AssetImage(""),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10.0, 3.0, 30.0, 0.0),
                              child: Text("View My\nRewards"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    VerticalDivider(color: Colors.black),
                    Container(
                       height: 150,
                      //width: MediaQuery.of(context).size.width ,
                      color: Colors.grey[300],
                      child: GestureDetector(
                        onTap: () {},
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(10.0, 20.0, 25.0, 0.0),
                              child: Container(
                                height: 80.0,
                                width: 80.0,
                                child: CircleAvatar(
                                  radius: 50.0,
                                  backgroundColor: Colors.pink,
                                  backgroundImage: AssetImage(""),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10.0, 3.0, 25.0, 0.0),
                              child: Text("Refer&Earn\nMinRs. 100"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Text("Recharge AND Pay Bills.",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            ),
            SizedBox(
              
            //height: ,
            child: GridView.builder(
              //scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              primary: false,
              itemCount: billslist.length,
              semanticChildCount: 4,
              
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (BuildContext ctx, memory)=>
                  Column(
                    children: <Widget>[
                      IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.check),
                        iconSize: 35,
                        padding: EdgeInsets.fromLTRB(35,20,30,9),
                      ),
                      Text(billslist[memory]),
                    ],
                  ),
                ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 30),
          )
          ],
        ),
      
      ),
      bottomNavigationBar: MyMadeBottomBar(),
    );
  }
}
