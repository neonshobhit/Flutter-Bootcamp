import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget buildButton(String number, int colorpallet) {
    //print(colorpallet);
    return Container(
      color: Color(colorpallet),
      height: 50.0,
      child: new OutlineButton(
        
        child: new Text(
          number,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
          ),
        ),
        onPressed: () => buttonPressed(number),
      ),
    );
  }

  static AudioCache player = new AudioCache();

  buttonPressed(String number) {
    print(number);
    
    setState(() {
      
        
      
      switch (number) {
      case 'ONE': player.play('one.wav');
                  break;
      case 'TWO': player.play('two.wav');
                  break;
      case 'THREE': player.play('three.wav');
                    break;
      case 'FOUR':  player.play('four.wav');
                    break;
      case 'FIVE':  player.play('five.wav');
                    break;
      case 'SIX':   player.play('six.wav');
                    break;  
      case 'SEVEN':player.play('seven.wav');
                    break;
      case 'EIGHT': player.play('eight.wav');
                    break;
      case 'NINE':  player.play('nine.wav');
                    break;
      case 'TEN': player.play('ten.wav');
                  break;
    }
    
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SpanishNumber'),
        backgroundColor: Colors.lightBlue[900],
      ),
      body: Column(
        children: <Widget>[
          Image.asset('assets/kaka.png'),
          Expanded(
            child: new Row(
              children: <Widget>[
                Expanded(child: buildButton('ONE', 0XFF218F76)),
                Expanded(child: buildButton('TWO', 0XFF6AB04C)),
              ],
            ),
          ),
          Expanded(
            child: new Row(
              children: <Widget>[
                Expanded(child: buildButton('THREE', 0xFFFBD28B)),
                Expanded(child: buildButton('FOUR', 0xFFF0DF87)),
              ],
            ),
          ),
          Expanded(
            child: new Row(
              children: <Widget>[
                Expanded(
                  child: buildButton('FIVE', 0xFFA3CB37),
                ),
                Expanded(
                  child: buildButton('SIX', 0xFFE74292),
                ),
              ],
            ),
          ),
          Expanded(
            child: new Row(
              children: <Widget>[
                Expanded(child: buildButton('SEVEN', 0XFF6AB04C)),
                Expanded(child: buildButton('EIGHT', 0xFF2B2B52)),
              ],
            ),
          ),
          Expanded(
            child: new Row(
              children: <Widget>[
                Expanded(child: buildButton('NINE', 0xFFE74292)),
                Expanded(child: buildButton('TEN', 0xFFF5BCBA)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
