import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

var crimecompletedata;

class Reports extends StatefulWidget {
  var selectedloc;
  Reports({
    Key key,
    @required this.selectedloc,
  }) : super(key: key);
  @override
  _ReportsState createState() => _ReportsState(
        selectedloc: selectedloc,
      );
}

class _ReportsState extends State<Reports> {
  var selectedloc;
  _ReportsState({
    Key key,
    @required this.selectedloc,
  });

  var fetched = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    managing_database(selectedloc);
  }

  Widget buildreport(int index) {
    int colorscheme = 0xFF3498DB;
    if (crimecompletedata[index]['crime'] == "Rape")
      colorscheme = 0xFFEC4849;
    else if (crimecompletedata[index]['crime'] == "Robbery")
      colorscheme = 0xFF3498DB;
    else if (crimecompletedata[index]['crime'] == "Murder")
      colorscheme = 0XFF6AB04C;
    else
      colorscheme = 0XFF218F76;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Container(
          color: Color(colorscheme),
          child: ListTile(
            leading: Icon(
              Icons.supervised_user_circle,
              size: 40,
              color: Colors.black,
            ),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  crimecompletedata[index]['suggestions'],
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  crimecompletedata[index]['crime'],
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    
                  ),
                ),
              ],
            ),
            subtitle: Text(
              "Suspect:" + crimecompletedata[index]['suspectname'],
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
            trailing: Column(
              children: <Widget>[
                Text(
                  crimecompletedata[index]['date'],
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  "Evidence?\n      " + crimecompletedata[index]['evidenceask'],
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: !fetched
              ? CircularProgressIndicator()
              : Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(9),
                      child: Divider(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14.0),
                      child: Text(
                        "All about $selectedloc, for now.",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Divider(),
                    ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      scrollDirection: Axis.vertical,
                      itemCount: crimecompletedata.length,
                      itemBuilder: (BuildContext context, int index) =>
                          Container(
                        child: buildreport(index),
                      ),
                    ),

                    /*


                    Text("Welcome"),
                    if (fetched)
                      ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: crimecompletedata.length,
                        itemBuilder: (BuildContext context, int index) => Card(
                          child: Column(
                            children: <Widget>[
                              Text(
                                crimecompletedata[index]["crime"],
                              ),
                              Text(
                                crimecompletedata[index]["id"].toString(),
                              ),
                              Text(
                                crimecompletedata[index]["evidenceask"],
                              ),
                              Text(
                                crimecompletedata[index]["suspectname"],
                              ),
                              Text(
                                crimecompletedata[index]["location"],
                              ),
                              Text(
                                crimecompletedata[index]["helpneeded"],
                              ),
                            ],
                          ),
                        ),
                      )
                    else
                      CircularProgressIndicator()
                    /*
              RaisedButton(
                child: Text("ghj"),
                onPressed: () => managing_database("Rape"),
              ),
              RaisedButton(
                child: Text("Material"),
                onPressed: () {
                  print(crimecompletedata);
                  setState(() {
                    fetched = true;  
                  });
                  
                },
              ),
              */
              */
                  ],
                ),
        ),
      ),
    );
  }

  managing_database(String fetcher) async {
    print("object");
    final Future<Database> database = openDatabase(
      join(
        await getDatabasesPath(),
        'crimes.db',
      ),
    );

    getclient() async {
      final db = await database;
      var res = await db.query('Reports', where: "location = '$fetcher'");
      if (res == null) {
        res = await db.query('Reports', where: "location = 'Jagatpura'");
      }

      crimecompletedata = res;
      setState(() {
        fetched = true;
      });
    }

    getclient();
  }
}
/*

class Dog {
  int id;
  String markername;
  String crime;
  String evidenceask;
  String location;
  String helpneeded;
  String suspectname;
  String date;
  String suggestions;

  Dog({
    this.id,
    this.markername,
    this.crime,
    this.evidenceask,
    this.location,
    this.helpneeded,
    this.suspectname,
    this.date,
    this.suggestions,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'markername': markername,
      'crime': crime,
      'evidenceask': evidenceask,
      'location': location,
      'helpneeded': helpneeded,
      'suspectname': suspectname,
      'date': date,
      'suggestions': suggestions,
    };
  }
}
*/
/*
managing_database(String fetcher) async {
  final Future<Database> database = openDatabase(
    join(
      await getDatabasesPath(),
      'crimes.db',
    ),

  );
  
  getclient() async {
    final db = await database;
    var res = await db.query('Reports', where: "location = '$fetcher'");
    if(res == null){
      res = await db.query('Reports', where: "location = 'Jagatpura'");
    }
    print(res);
    crimecompletedata = res;
    return res;
  }

  getclient();
}
*/
