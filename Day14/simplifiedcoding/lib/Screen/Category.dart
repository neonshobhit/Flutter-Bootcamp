import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Categorydetails.dart';
import 'dart:convert';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

  final String url = "https://www.simplifiedcoding.net/wp-json/wp/v2/categories";
  var data;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    this.getjsondata();
  }

  Future<String> getjsondata() async{
    var response = await http.get(
      Uri.encodeFull(url),
    );
    setState(() {
     var convertdatatojson = json.decode(response.body) ;
     data = convertdatatojson;
     isLoading = false;
     print(data);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: isLoading ? CircularProgressIndicator()
        :ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) =>Card(
            child: ListTile(
              onTap: (){Categoryde(data[index]['id'],data[index]['name']);},
              trailing: Text(data[index]['count'].toString()),
              title: Text(data[index]['name']),
              leading: Icon(
                Icons.category,
                
              ),
              subtitle: Visibility(
                visible: true,
                child: Text(data[index]['id'].toString()
                ),
              ),

            ),
          ),
        ),
      ),

    );
  }
  Categoryde(int id, String name){
    Navigator.push(context, MaterialPageRoute(
      builder: (context) =>CategoryDetails(
        id: id,
        name: name,
      )
    ));

  }
}