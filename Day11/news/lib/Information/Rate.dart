import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateMyApp extends StatefulWidget {
  @override
  _RateMyAppState createState() => _RateMyAppState();
}

class _RateMyAppState extends State<RateMyApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            Text(
              "Rate My App",
            ),
            RatingBar(
              initialRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 7,
              unratedColor: Colors.blue,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (BuildContext context, int index)=> Icon(
                Icons.tag_faces,
                color: Colors.green,
            
              ),
              onRatingUpdate: (rating){
                print(rating);
              },

            )
          ],
        ),
      ),
    );
  }
}
