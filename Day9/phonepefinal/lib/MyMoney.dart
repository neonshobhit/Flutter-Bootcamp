import 'package:flutter/material.dart';
import 'package:phonepefinal/AppBar.dart';
import 'package:phonepefinal/BottomNavBar.dart';

class MyMoney extends StatefulWidget {
  @override
  _MyMoneyState createState() => _MyMoneyState();
}

class _MyMoneyState extends State<MyMoney> {
  var walletlist = [
    "PhonePe\nWallet",
    "PhonePe\nGift Card",
    "JioMoney",
    "freeCharge",
    "AirtelMoney"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBarMade.getAppBar(),
      body: Container(
        margin: EdgeInsets.only(left: 17.0),
        child: SingleChildScrollView(
          
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 150.0,
              ),
              Padding(
                padding: EdgeInsets.all(2.0),
                child: Text(
                  "Payment Methods",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 110,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.fast_forward,
                            size: 40.0,
                          ),
                          Text(
                            "Bank Accounts",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 10.0),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.credit_card,
                            size: 40.0,
                          ),
                          Text(
                            "Credit Cards",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 10.0),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.credit_card,
                            size: 40.0,
                          ),
                          Text(
                            "Debit Cards",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 10.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                child: Text(
                  "Wallets/ Gift Vouchers",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 110,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: walletlist.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) => Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.account_balance_wallet,
                          size: 40.0,
                        ),
                        Text(
                          walletlist[index],
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 10.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(),
              Container(
                  child: Text(
                "Payment Management",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )),
              SizedBox(
                height: 110,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.party_mode,
                            size: 40.0,
                          ),
                          Text(
                            "AutoPay",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 10.0),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.calendar_today,
                            size: 40.0,
                          ),
                          Text(
                            "Reminders",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 10.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                child: Text(
                  "Wealth Management",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 110.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  primary: false,
                  children: <Widget>[
                    Container(
                      /*height: 120.0,
                      width:  120.0,*/
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.add_circle,
                            size: 40.0,
                          ),
                          Text(
                            "Gold",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 10.0),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      /*height: 120.0,
                      width:  120.0,*/
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.report,
                            size: 40.0,
                          ),
                          Text(
                            "Tax Saving\n     Funds",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10.0,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyMadeBottomBar(),
    );
  }
}
