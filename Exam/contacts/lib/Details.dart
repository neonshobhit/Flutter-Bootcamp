import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatefulWidget {
  var data;
  Details({Key key, @required this.data}) : super(key: key);
  @override
  _DetailsState createState() => _DetailsState(
        data: data,
      );
}

class _DetailsState extends State<Details> {
  var data;
  _DetailsState({
    Key key,
    @required this.data,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data["Name"] ?? "NoName",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 300,
              height: 300,
              child: ClipOval(
                child: Image.network(
                  data["ImageURL"] ??
                      "https://www.anime-planet.com/images/characters/hinata-hyuuga-626.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Divider(),
            Card(
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      _call();
                    },
                    child: Text(
                      data["Mobile"] ?? "NoNumber",
                    ),
                  ),
                ),
                trailing: GestureDetector(
                  onTap: () {
                    _message();
                  },
                  child: Icon(
                    Icons.message,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    data["EmailID"] ?? "NoEmail",
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    data["Gender"] ?? "GenderNotKnown",
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    data["Birthday"] ?? "NoDOB",
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _call() async {
    if (await canLaunch("tel: ${data["Mobile"]}")) {
      await launch("tel: ${data["Mobile"]}");
    }
  }

  _message() async {
    if (await canLaunch("sms: ${data["Mobile"]}")) {
      await launch("sms: ${data["Mobile"]}");
    }
    else{
      await launch("sms: 9413460572");
    }
  }
}
