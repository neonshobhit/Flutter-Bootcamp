import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:secyour/BottomtabPages.dart/Reports.dart';
import 'package:sqflite/sqflite.dart';

var crimecompletedata;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> _key = new GlobalKey();
  var data = ['Jagatpura', 'MalviyaNagar', 'Gopalbari'];
  var crime = {
    "Robbery": 00,
    "Rape": 00,
    "Murder": 00,
  };
  var crimeslist = ["Robbery", "Rape", "Murder"];
  var selectedloc = "Jagatpura";
  bool wait = true;
  var mapasset = "assets/1.png";
  int colorscheme = 0XFF6AB04C;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    managing_database(selectedloc);
    initialisemap();
  }

  initialisemap() {
    setState(() {
      if (selectedloc == "Jagatpura")
        mapasset = "assets/4.png";
      else if (selectedloc == "Gopalbari")
        mapasset = "assets/2.png";
      else if (selectedloc == "Citypalace")
        mapasset = "assets/3.png";
      else
        mapasset = "assets/4.jpg";
    });
  }

  crimecalc() {
    for (int k = 0; k < crime.length; k++) {
      crime[crimeslist[k]] = 0;
    }
    for (int i = 0; i < crimecompletedata.length; i++) {
      crime[crimecompletedata[i]['crime']]++;
    }
  }

  Widget buildsummary(int index) {
    int colorscheme = 0XFF6AB04C;
    if (crimecompletedata.length > index) {
      if (index == 0)
        colorscheme = 0xFF3498DB;
      else if (index == 1)
        colorscheme = 0xFFEC4849;
      else if (index == 2)
        colorscheme = 0XFF6AB04C;
      else
        colorscheme = 0XFF218F76;
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
      child: Card(
        color: Color(colorscheme),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
              child: ListTile(
                leading: Text(
                  crimeslist[index],
                ),
                title: Text(
                  crime[crimeslist[index]].toString(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: wait
          ? CircularProgressIndicator()
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Divider(),
                  Text(
                    selectedloc,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w900
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _key,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 50,
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                hintText: "Search for locations.",
                              ),
                              onSaved: (String value) {
                                setState(() {
                                  if (value.isEmpty)
                                    selectedloc = "Jagatpura";
                                  else
                                    selectedloc = value;
                                  managing_database(selectedloc);
                                  wait == true
                                      ? CircularProgressIndicator()
                                      : initialisemap();
                                });
                              },
                              validator: (String input) {
                                return null;
                              },
                            ),
                          ),
                          RaisedButton(
                            child: Text("Search"),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            onPressed: onpress,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Image.asset(
                      mapasset,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Reports(
                              selectedloc: selectedloc,
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: <Widget>[
                          ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: crime.length,
                            itemBuilder: (BuildContext context, int index) =>
                                buildsummary(index),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  void onpress() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
    }
  }

  managing_database(String fetcher) async {
    final Future<Database> database = openDatabase(
      join(
        await getDatabasesPath(),
        'crimes.db',
      ),
    );

    getcrime(String fetcher) async {
      final db = await database;
      var res = await db.query('Reports', where: "location = '$fetcher'");
      crimecompletedata = res;
      setState(() {
        wait = false;
      });
      crimecalc();
    }

    getcrime(fetcher);
  }
}
