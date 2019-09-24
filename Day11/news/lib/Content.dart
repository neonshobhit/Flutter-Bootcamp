import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';

class Content extends StatelessWidget {
  Content({
    Key key,
    @required this.URLpage,
    this.data,
    this.index,
  }) : super(key: key);
  final String URLpage;
  int index;
  var data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Content",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Hero(
          tag: 'contenthero',
          child: GestureDetector(
            child: Text(
              data["articles"][index]["content"],
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15.0,
              ),
            ),
            onTap: () {
              /*if(await canLaunch(URLpage)){
                  await launch(yourURL, forceWebView: true);
                 } 
              */
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Icon(
            Icons.exit_to_app,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }
}
