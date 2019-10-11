import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_app/HomePage.dart';

class SearchNewWeather extends StatefulWidget {
  @override
  _SearchNewWeatherState createState() => _SearchNewWeatherState();
}

class _SearchNewWeatherState extends State<SearchNewWeather> {
  String url = "https://restcountries.eu/rest/v2/all";
  var countriesdata;
  bool isLoading = true;
  List<String> cdata = [];
  List<String> sdata = [
    "States",
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Rajasthan"
  ];
  List<String> cidata = ["Cities", "Jaipur", "Bhilwara", "Ajmer"];
  String mycountry, mystate, mycity;

  @override
  void initState() {
    super.initState();
    getjsondata();
  }

  Future<String> getjsondata() async {
    var response = await http.get(
      Uri.encodeFull(url),
    );
    setState(() {
      var convertDataToJSON = json.decode(response.body);
      countriesdata = convertDataToJSON;
      isLoading = false;
      onlylist();
    });
  }

  onlylist() {
    cdata.add("Countries");
    for (int i = 0; i < countriesdata.length; i++) {
      if (countriesdata[i]["name"] != null) cdata.add(countriesdata[i]["name"]);
    }
    print(cdata);
    /*
    print(cdata.length);
    //print(i);
    */
    //cdata.add()
  }

  String dropdownvalue = "Countries";
  String dropdownvalue1 = "States";
  String dropdownvalue2 = "Cities";

  tosubmit() {
    
    Navigator.of(context).pop();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(
          mycountry: "India",
          mycity: dropdownvalue2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Search Your City",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: isLoading
          ? CircularProgressIndicator()
          : Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Countries",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    //height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: DropdownButton<String>(
                      // hint: Text("Countnries..."),
                      isExpanded: true,
                      isDense: true,
                      value: dropdownvalue,
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
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownvalue = newValue;
                          mycountry = dropdownvalue;
                        });
                      },
                      items: cdata.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "States",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: DropdownButton<String>(
                      value: dropdownvalue1,
                      isDense: true,
                      isExpanded: true,
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
                          dropdownvalue1 = newvalue;
                          mystate = dropdownvalue1;
                        });
                      },
                      items: sdata.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "City",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: DropdownButton<String>(
                      value: dropdownvalue2,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 20.0,
                      isDense: true,
                      isExpanded: true,
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
                          dropdownvalue2 = newvalue;
                          mycity = dropdownvalue2;
                        });
                      },
                      items:
                          cidata.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                RaisedButton(
                  child: Text(
                    "Submit!",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    tosubmit();
                  },
                )
              ],
            ),
    );
  }
}
