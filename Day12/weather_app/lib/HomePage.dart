import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_app/Searchnew.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
    @required this.mycountry,
    this.mycity,
  }) : super(key: key);
  String mycity, mycountry;

  @override
  _HomePageState createState() => _HomePageState(
    mycountry: this.mycountry,
    mycity: this.mycity,
    
  );
}

class _HomePageState extends State<HomePage> {
  _HomePageState({
    Key key,
    @required this.mycountry,
    this.mycity,
    
  });

  String mycity, mycountry;
  int index = 0;
  //String changinglink;
  String url ;//=
     // "http://openweathermap.org/data/2.5/weather?q=${mycity},${mycountry}&appid=b6907d289e10d714a6e88b30761fae22";
  var data;
  bool isLoading = true;
  int lengthdata = 0;

  @override
  void initState() {
    
    super.initState();
    getjsondata();
  }

  //Future<String>
  getjsondata() async {
    url = "http://openweathermap.org/data/2.5/weather?q=${mycity},${mycountry}&appid=b6907d289e10d714a6e88b30761fae22";
    var response = await http.get(
      Uri.encodeFull(url),
    );
    setState(() {
      index = 0;
      var convertDataToJson = json.decode(response.body);
      data = convertDataToJson;
      isLoading = false;
      lengthdata = data.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$mycity's Weather",
        ),
      ),
      drawer: SearchNewWeather(),
      body: Container(
        padding: EdgeInsets.all(15.0),
        color: Colors.amber,
        width: double.infinity,
        height: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            children: <Widget>[
              Image(
                image: NetworkImage(
                    "https://us.123rf.com/450wm/katedav/katedav1602/katedav160200011/54060370-stock-vector-happy-cartoon-kids-outdoors-on-a-green-meadow.jpg?ver=6"),
              ),
              Text(
                'Temperature: ${data["main"]["temp"]}',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.red,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Pressure: ${data["main"]["pressure"]}',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.red,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Humidity: ${data["main"]["humidity"]}',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.red,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Minimum Temperature: ${data["main"]["temp_min"]}',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.red,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Maximum Temperature: ${data["main"]["temp_max"]}',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.red,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
