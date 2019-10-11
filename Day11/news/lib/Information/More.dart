import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class More extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 60.0,
        width: 60.0,
        child: GestureDetector(
          onTap: (){
            launch(
              "www.facebook.com",
            );
          },
          child: Image.network(
            ""
          ),
        ),
      ),
    );
  }
}