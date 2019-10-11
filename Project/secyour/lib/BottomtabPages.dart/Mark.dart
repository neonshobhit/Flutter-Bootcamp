import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;

class Mark extends StatefulWidget {
  @override
  _MarkState createState() => _MarkState();
}

class _MarkState extends State<Mark> {
  GlobalKey<FormState> _key = new GlobalKey();
  GlobalKey<FormState> formkeynew = new GlobalKey();
  GlobalKey<FormState> _formkeynew2 = new GlobalKey();
  var dropdownvaluecrimelist = "Rape";
  var crimeslist = [
    "Rape",
    "Robbery",
    "Murder",
  ];
  var selectedloc = "Jagatpura";
  var markername = "MarkerUnknown";
  var evidencechoice = "Yes";
  var suspectname = "SuspectUnknown";
  var helpneed = "No";
  var suggestions = "Stay Safe!";
  var selectedDate = DateTime.now();
  var onlydate;
  var mmm;
  int id = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onlydate = selectedDate.toLocal().toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView(
        children: <Widget>[
          Form(
            key: _key,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.home,
                    size: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 80,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        hintText: "Search for locations.",
                      ),
                      onSaved: (String value) {
                        setState(() {
                          if (value.isEmpty)
                            selectedloc = "Jagatpura";
                          else
                            selectedloc = value;
                        });
                      },
                      validator: (String input) {
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(4),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left:15),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Icon(
                          Icons.calendar_today,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _updateDate(context),
                        child: Text(
                          "${onlydate}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 300,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Your Name (You'll always be anonymous)",
                      ),
                      onSaved: (String value) {
                        setState(() {
                          markername = value;
                        });
                      },
                      validator: (String input) {
                        if (input.isEmpty) return "Enter your name first";
                        return null;
                      },
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                      flex: 4,
                      fit: FlexFit.tight,
                      child: Text(
                        "Crime",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      fit: FlexFit.tight,
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: dropdownvaluecrimelist,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 20.0,
                        elevation: 20,
                        style: TextStyle(
                          color: Colors.deepPurple,
                        ),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newvalue) {
                          setState(() {
                            dropdownvaluecrimelist = newvalue;
                            print(dropdownvaluecrimelist);
                          });
                        },
                        items: crimeslist
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                      flex: 4,
                      fit: FlexFit.tight,
                      child: Text(
                        "Evidence",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      fit: FlexFit.tight,
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: evidencechoice,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 20.0,
                        elevation: 20,
                        style: TextStyle(
                          color: Colors.deepPurple,
                        ),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newvalue) {
                          setState(() {
                            evidencechoice = newvalue;
                            print(evidencechoice);
                          });
                        },
                        items: ['Yes', 'No']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerRight,
                      child: Form(
                        key: formkeynew,
                        child: SizedBox(
                          width: 200,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Suspect Name (if known)",
                            ),
                            onSaved: (String value) {
                              setState(() {
                                if (value.isEmpty) {
                                } else
                                  suspectname = value;
                              });
                            },
                            validator: (String input) {
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                      flex: 4,
                      fit: FlexFit.tight,
                      child: Text(
                        "Need Help\nright Now?",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 3,
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: helpneed,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 20.0,
                        elevation: 20,
                        style: TextStyle(
                          color: Colors.deepPurple,
                        ),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newvalue) {
                          setState(() {
                            helpneed = newvalue;
                            print(helpneed);
                          });
                        },
                        items: ['Yes', 'No']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                Form(
                  key: _formkeynew2,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 150,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Your Suggestions",
                        ),
                        onSaved: (String value) {
                          setState(() {
                            if (value.isEmpty) {
                            } else
                              suggestions = value;
                            print(suggestions);
                          });
                        },
                        validator: (String input) {
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Align(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                      child: Text(
                        "Mark!",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                    onPressed: () {
                      final snackBar = SnackBar(
                        content: Text("Marked your report!"),
                      );
                      Scaffold.of(context).showSnackBar(snackBar);
                      onpress();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }

  void onpress() {
    if (_key.currentState.validate() &&
        formkeynew.currentState.validate() &&
        _formkeynew2.currentState.validate()) {
      _key.currentState.save();
      formkeynew.currentState.save();
      _formkeynew2.currentState.save();
    }
    openingdatabase(
      markername,
      dropdownvaluecrimelist,
      evidencechoice,
      selectedloc,
      helpneed,
      suspectname,
      onlydate,
      suggestions,
    );
    post();
  }

  void post() async {
    var result = await http.post("http://userapi.tk/shobhit/insertdata", body: {
      "location": selectedloc,
      "name": markername,
      "crime": dropdownvaluecrimelist,
      "evidence": evidencechoice,
      "suggestion": suggestions,
      "suspect": suspectname,
      "help": helpneed,
      "date": onlydate,
    });
    print(result.body);
  }

  Future<Null> _updateDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000, 1),
      lastDate: DateTime.now().toLocal(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        mmm = onlydate.split(' ').toList();
        onlydate = mmm[0];
      });
    }
  }
}

class Dog {
  String markername;
  String crime;
  String evidenceask;
  String location;
  String helpneeded;
  String suspectname;
  String date;
  String suggestions;

  Dog({
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

openingdatabase(
  String markername,
  String crime,
  String evidenceask,
  String location,
  String helpneeded,
  String suspectname,
  String date,
  String suggestions,
) async {
  final Future<Database> database = openDatabase(
    join(await getDatabasesPath(), 'crimes.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE Reports(id INTEGER PRIMARY KEY AUTOINCREMENT, markername TEXT, crime TEXT, evidenceask TEXT, location TEXT, helpneeded TEXT, suspectname TEXT, date TEXT, suggestions TEXT )",
      );
    },
    version: 1,
  );

  Future<void> insertData(Dog dog) async {
    final Database db = await database;
    await db.insert(
      'Reports',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  final insertingfirst = Dog(
    markername: markername,
    crime: crime,
    evidenceask: evidenceask,
    location: location,
    helpneeded: helpneeded,
    suspectname: suspectname,
    date: date,
    suggestions: suggestions,
  );
  await insertData(insertingfirst);
  print("Filled database");
}
