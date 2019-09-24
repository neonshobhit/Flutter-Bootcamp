import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var sidelength = 110.0;
  bool pressAttention = false;
  static AudioCache player = new AudioCache();

  playmusic(var mytune) {
    setState(() {
      pressAttention = !pressAttention;
      sidelength == 110 ? sidelength = 180 : sidelength = 110;
      Future.delayed(const Duration(milliseconds: 250), () {
        setState(() {
          sidelength = 110;
          pressAttention = !pressAttention;
        });
      });

      if (mytune == "1.mp3")
        player.play('1.mp3');
      else if (mytune == "2.mp3")
        player.play('2.mp3');
      else if (mytune == "3.mp3")
        player.play('3.mp3');
      else if (mytune == "4.mp3")
        player.play('4.mp3');
      else if (mytune == "5.mp3")
        player.play('5.mp3');
      else if (mytune == "6.mp3")
        player.play('6.mp3');
      else if (mytune == "7.mp3")
        player.play('7.mp3');
      else if (mytune == "8.mp3")
        player.play('8.mp3');
      else if (mytune == "1.mp3")
        player.play('1.mp3');
      else
        player.play('2.mp3');
    });
  }

  buildButton(var mycolor, var myfuturecolor, var mytune) {
    return Container(
      child: AnimatedContainer(
        margin: EdgeInsets.all(3.0),
        height: sidelength,
        width: sidelength,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInCubic,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
          hoverColor: Colors.black,
          color: pressAttention ? Color(mycolor) : Color(myfuturecolor),
          onPressed: () => playmusic(mytune),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        title: Text('DrumPad'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: buildButton(0xFFEAF0F1, 0xFF53E0BC, "1.mp3"),
                ),
                Expanded(
                  child: buildButton(0xFFFFF222, 0xFF8B78E6, "2.mp3"),
                ),
                Expanded(
                  child: buildButton(0xFF53E0BC, 0xFF019031, "3.mp3"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: buildButton(0xFFF0DF87, 0xFF2C3335, "4.mp3"),
                ),
                Expanded(
                  child: buildButton(0xFF53E0BC, 0xFF99AAAB, "5.mp3"),
                ),
                Expanded(
                  child: buildButton(0xFF019031, 0xFFF5BCBA, "6.mp3"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: buildButton(0xFF019031, 0xFF6A89CC, "7.mp3"),
                ),
                Expanded(
                  child: buildButton(0xFF2C3335, 0xFFF3B63A, "8.mp3"),
                ),
                Expanded(
                  child: buildButton(0xFF6A89CC, 0xFF6ab04c, "1.mp3"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
