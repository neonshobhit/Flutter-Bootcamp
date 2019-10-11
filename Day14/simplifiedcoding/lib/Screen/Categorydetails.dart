import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_html/flutter_html.dart';
import 'NewDetails.dart';

class CategoryDetails extends StatefulWidget {
  final int id;
  final String name;
  CategoryDetails({Key key, @required this.id, this.name}) : super(key: key);

  @override
  _CategoryDetailsState createState() => _CategoryDetailsState(
        id: id,
        name: name,
      );
}

class _CategoryDetailsState extends State<CategoryDetails> {
  int id;
  String name;
  _CategoryDetailsState({
    Key key,
    @required this.id,
    this.name,
  });

  var data;

  bool isLoading = true;

  String url;

  @override
  initState() {
    this.url =
        "https://www.simplifiedcoding.net/wp-json/wp/v2/posts?categories=$id";
    super.initState();
    getjsondata();
  }

  Future<String> getjsondata() async {
    var response = await http.get(
      Uri.encodeFull(url),
    );
    setState(() {
      var convertdatatojson = json.decode(response.body);
      data = convertdatatojson;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) => GestureDetector(
                    onTap: ()=>_viewnews(
                      data[index]['title']['rendered'],
                      data[index]['excerpt']['rendered'],
                      data[index]['jetpack_featured_media_url']),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.network(
                              data[index]['jetpack_featured_media_url']),
                          Text(
                            data[index]['title']["rendered"],
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Html(
                            data: data[index]['excerpt']['rendered'],
                          ),
                          /*
                          Text(
                            data[index]['excerpt']['rendered'],
                          ),*/
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  _viewnews(String title, String desc, String imgURL) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewDetails(
          title: title,
          desc: desc,
          imgurl: imgURL,
        ),
      ),
    );
  }
}
