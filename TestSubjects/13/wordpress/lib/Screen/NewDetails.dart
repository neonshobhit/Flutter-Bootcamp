import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:share/share.dart';

class NewDetails extends StatefulWidget {
  final String title;
  final String desc;
  final String imgurl;
  NewDetails({
    Key key,
    @required this.title,
    this.desc,
    this.imgurl,
  }) : super(key: key);
  @override
  _NewDetailsState createState() => _NewDetailsState(
        title: this.title,
        desc: this.desc,
        imgurl: this.imgurl,
      );
}

class _NewDetailsState extends State<NewDetails> {
  String title;
  String desc;
  String imgurl;
  _NewDetailsState({
    Key key,
    @required this.title,
    this.desc,
    this.imgurl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              child: SliverAppBar(
                expandedHeight: 150.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(title,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black
                  ),
                  
                  ),
                  background: Image(
                    image: NetworkImage(imgurl),
                  ),
                ),
              ),
            )
          ];
        },
        body: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            child: Column(
              children: <Widget>[
                Html(
                  data: desc,
                
                ),
                MaterialButton(
                  onPressed: () =>
                    Share.share("check out my news $title"),
                  
                  child: Text(
                    "Share",
                  ),
            )
              ],
            ),
            
          ),
        ),
      ),
    );
  }
}
