import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var _selectedIndex = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
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
        primary: true,
        shrinkWrap: true,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Text("Money Transfers"),
          ),
          Container(
            child: GridView.count(
              shrinkWrap: true,
              primary: true,
              crossAxisCount: 4,
              children: <Widget>[
                Container(
                  child: Icon(Icons.arrow_upward),
                ),
                Container(
                  child: Icon(Icons.account_balance),
                ),
                Container(
                  child: Icon(Icons.person_add),
                ),
                Container(
                  child: Icon(Icons.account_balance_wallet),
                ),
                Container(
                  child: Text("To Contact"),
                ),
                Container(
                  child: Text("To Account"),
                ),
                Container(
                  child: Text("To Self"),
                ),
                Container(
                  child: Text("Bank Balance"),
                ),
              ],
            ),
          ),
          Divider(),
          Container(
            child: GridView.count(
              shrinkWrap: true,
              primary: true,
              crossAxisCount: 4,
              children: <Widget>[
                ClipOval(
                  child: Image.network(
                    "https://instagram.fudr1-1.fna.fbcdn.net/vp/0e0c826c335d34a6537c2cf75b802a9f/5E3C1280/t51.2885-19/s320x320/32178282_1846693452055722_2280604583086522368_n.jpg?_nc_ht=instagram.fudr1-1.fna.fbcdn.net",
                    width: 50.0,
                    height: 50.0,
                    fit: BoxFit.cover,
                  ),
                ),
                ClipOval(
                  child: Image.network(
                    "https://instagram.fudr1-1.fna.fbcdn.net/vp/0e0c826c335d34a6537c2cf75b802a9f/5E3C1280/t51.2885-19/s320x320/32178282_1846693452055722_2280604583086522368_n.jpg?_nc_ht=instagram.fudr1-1.fna.fbcdn.net",
                    width: 50.0,
                    height: 50.0,
                    fit: BoxFit.cover,
                  ),
                ),
                ClipOval(
                  child: Image.network(
                    "https://instagram.fudr1-1.fna.fbcdn.net/vp/0e0c826c335d34a6537c2cf75b802a9f/5E3C1280/t51.2885-19/s320x320/32178282_1846693452055722_2280604583086522368_n.jpg?_nc_ht=instagram.fudr1-1.fna.fbcdn.net",
                    width: 50.0,
                    height: 50.0,
                    fit: BoxFit.cover,
                  ),
                ),
                ClipOval(
                  child: Image.network(
                    "https://instagram.fudr1-1.fna.fbcdn.net/vp/0e0c826c335d34a6537c2cf75b802a9f/5E3C1280/t51.2885-19/s320x320/32178282_1846693452055722_2280604583086522368_n.jpg?_nc_ht=instagram.fudr1-1.fna.fbcdn.net",
                    width: 50.0,
                    height: 50.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  child: Text("Shobhit"),
                ),
                Container(
                  child: Text("Shobhit"),
                ),
                Container(
                  child: Text("Shobhit"),
                ),
                Container(
                  child: Text("Shobhit"),
                ),
              ],
            ),
          ),
          Container(
            height: 80.0,
            width: 80.0,
            color: Colors.grey[400],
            child: GridView.count(
              shrinkWrap: true,
              primary: true,
              crossAxisCount: 5,
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.local_offer,
                    color: Colors.pink,
                  ),
                ),
                VerticalDivider(),
                Container(
                  child: Icon(
                    Icons.card_giftcard,
                    color: Colors.orange,
                  ),
                ),
                VerticalDivider(),
                Container(
                  child: Icon(
                    Icons.mail,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Text(
              "Recharge & Pay Bills"
            ),
          ),
          Container(
            child: GridView.count(
              shrinkWrap: true,
              primary: true,
              crossAxisCount: 4,
              mainAxisSpacing: 0.1,
              children: <Widget>[
                Icon(
                  Icons.mobile_screen_share,
                ),
                Icon(
                  Icons.satellite,
                ),
                Icon(
                  Icons.lightbulb_outline,
                ),
                Icon(
                  Icons.credit_card,
                ),
                Text(
                  "Recharge",
                ),
                Text(
                  "DTH",
                ),
                Text(
                  "Electricity",
                ),
                Text(
                  "Credit Card",
                ),
                Icon(
                  Icons.mobile_screen_share,
                ),
                Icon(
                  Icons.phonelink,
                ),
                Icon(
                  Icons.indeterminate_check_box,
                ),
                Icon(
                  Icons.local_gas_station,
                ),
                Text(
                  "Postpaid",
                ),
                Text(
                  "LandLine",
                ),
                Text(
                  "BroadBand",
                ),
                Text(
                  "Gas",
                ),
                Icon(
                  Icons.info_outline,
                ),
                Icon(
                  Icons.usb,
                ),
                Icon(
                  Icons.security,
                ),
                Icon(
                  Icons.home,
                ),
                Text(
                  "Water",
                ),
                Text(
                  "DataCard",
                ),
                Text(
                  "Insurance",
                ),
                Text(
                  "Municipal Tax",
                ),
              ],
            ),
          ),
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
