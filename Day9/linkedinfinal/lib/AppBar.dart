import 'package:flutter/material.dart';

class MyCustomAppBarMade{
  static getAppBar(){
    return AppBar(
      leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://instagram.fudr1-1.fna.fbcdn.net/vp/0e0c826c335d34a6537c2cf75b802a9f/5E3C1280/t51.2885-19/s320x320/32178282_1846693452055722_2280604583086522368_n.jpg?_nc_ht=instagram.fudr1-1.fna.fbcdn.net"),
                  fit: BoxFit.cover,
                )),
          ),
        ),
        actions: <Widget>[
          Container(
            width: 310.0,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.all(8.0),
            child: TextField(
              //textAlign: TextAlign.center,
              decoration: InputDecoration(
                fillColor: Colors.white12.withOpacity(1.0),
                filled: true,
                prefixIcon: Icon(Icons.search),
                hintText: "Search",
  
                suffixIcon: Icon(Icons.select_all),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
          Icon(Icons.chat),
        ],
    );
  }
}