import 'package:flutter/material.dart';

class MyCustomAppBarMade {
  static getAppBar() {
    return AppBar(
      backgroundColor: Colors.purple,
      leading: Container(
        height: 10.0,
        width: 10.0,
        child: CircleAvatar(
          radius: 10,
          backgroundColor: Colors.purple,
          backgroundImage: NetworkImage("https://instagram.fjai1-2.fna.fbcdn.net/vp/e167df514c69d23a26fbb31ea1660735/5E3C1280/t51.2885-19/s320x320/32178282_1846693452055722_2280604583086522368_n.jpg?_nc_ht=instagram.fjai1-2.fna.fbcdn.net"),
        ),
      ),
      actions: <Widget>[
        Icon(Icons.scanner),
        Icon(Icons.notifications),
        Icon(Icons.blur_circular),
      ],
    );
  }
}
