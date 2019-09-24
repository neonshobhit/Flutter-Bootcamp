import 'package:flutter/material.dart';

class MyMoney extends StatefulWidget {
  @override
  _MyMoneyState createState() => _MyMoneyState();
}

class _MyMoneyState extends State<MyMoney> {
  var _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            image: DecorationImage(
              image: NetworkImage(
                  "https://instagram.fudr1-1.fna.fbcdn.net/vp/0e0c826c335d34a6537c2cf75b802a9f/5E3C1280/t51.2885-19/s320x320/32178282_1846693452055722_2280604583086522368_n.jpg?_nc_ht=instagram.fudr1-1.fna.fbcdn.net"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        actions: <Widget>[
          Icon(Icons.scanner),
          Icon(Icons.notifications),
          Icon(Icons.blur_circular),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Text(
              "Payment Methods:",
            ),
          ),
          Container(
            child: GridView.count(
                shrinkWrap: true,
                primary: true,
                crossAxisCount: 3,
                children: <Widget>[
                  Container(
                    child: Icon(Icons.play_arrow),
                  ),
                  Container(
                    child: Icon(Icons.credit_card),
                  ),
                  Container(
                    child: Icon(Icons.credit_card),
                  ),
                  Container(
                    child: Text("Bank Accounts"),
                  ),
                  Container(
                    child: Text("Debit Cards"),
                  ),
                  Container(
                    child: Text("Credit Cards"),
                  ),
                ]),
          ),
          Divider(),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Text("Wallets/ Gift Vouchers"),
          ),
          Container(
            child: GridView.count(
              shrinkWrap: true,
              primary: true,
              crossAxisCount: 5,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  child: Icon(Icons.payment),
                ),
                Container(
                  child: Icon(Icons.payment),
                ),
                Container(
                  child: Icon(Icons.account_balance_wallet),
                ),
                Container(
                  child: Icon(Icons.account_balance_wallet),
                ),
                Container(
                  child: Icon(Icons.account_balance_wallet),
                ),
                Container(
                  child: Text("PhonePe Wallets"),
                ),
                Container(
                  child: Text("PhonePe Gift Card"),
                ),
                Container(
                  child: Text("JioMoney"),
                ),
                Container(
                  child: Text("Freecharge"),
                ),
                Container(
                  child: Text("Airtel Money"),
                ),
              ],
            ),
          ),
          Divider(),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Text("Payment Management"),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10.0,
        items: const<BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            title: Text("Stores"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            title: Text("Apps"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            title: Text("MyMoney"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text("History"),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.black,
        onTap: (int index){
          setState(() {
           _selectedIndex = index;

          if(index == 0)
            Navigator.of(context).pushNamed("/Home");
          else if(index == 3)
            Navigator.of(context).pushNamed("/MyMoney");
          });
        },
      ),
    );
  }
}
