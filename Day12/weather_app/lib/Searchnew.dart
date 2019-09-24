import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Rajasthan"
  ];
  List<String> cidata = ["Jaipur", "Bhilwara", "Ajmer"];
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
      if(countriesdata[i]["name"] != null)
        cdata.add(countriesdata[i]["name"]);

    }
    print(cdata);
    /*
    print(cdata.length);
    //print(i);
    */
    //cdata.add()
  }

  String dropdownvalue = "Countries";
  String dropdownvalue1 = "Andhra Pradesh";
  String dropdownvalue2 = "Jaipur";

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
      body: isLoading ? CircularProgressIndicator() :
      Column(
        children: <Widget>[
          
          DropdownButton<String>(
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
            items: cdata
            .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              },
            ).toList(),
          ),
          
          DropdownButton<String>(
            value: dropdownvalue1,
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
            items: sdata
            .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              },
            ).toList(),
          ),
          
          DropdownButton<String>(
            value: dropdownvalue2,
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
                dropdownvalue2 = newvalue;
                mycity = dropdownvalue2;
              });
            },
            items: cidata
            .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }
            ).toList(),
          ),
          
        ],
      ),
    );
  }
}
