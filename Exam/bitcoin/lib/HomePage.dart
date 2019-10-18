import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController amount = TextEditingController();
  TextEditingController fin = TextEditingController();
  
  var data;
  bool isLoading = true;
  String url;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    amount.text = "100";
    senddata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bitcoin",
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            width: 200,
            height: 200,
            child: Image.asset(
              "assets/1.jpg"
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: amount,
              decoration: InputDecoration(
                hintText: "Enter Amount."
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              enabled: false,
              controller: fin,
            ),
          ),
          RaisedButton(
            child: Text(
              "Calculate",
            ),
            onPressed: (){
              senddata();
            },
          ),
        ],
      ),
      
    );
  }

  void senddata() async{
    var response = await http.get(
      Uri.encodeFull(
        "https://blockchain.info/tobtc?currency=INR&value=${amount.text}"
      )
    );
    var getjsondata = json.decode(response.body);
    data = getjsondata;
    fin.text = data.toString();
  }
}