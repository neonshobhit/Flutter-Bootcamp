import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  buildButtons(){
      return Container(
        width: 45.0,
        height: double.infinity,
        margin: EdgeInsets.all(1.0),
        child: MaterialButton(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF0D47A1),
                Color(0xFF1976D2),
                Color(0xFF42A5F5),
              ]
            )
          ),
            
          ),
          elevation: 100.0,
          height: 80.0,
          color: Colors.white70,
          onPressed: (){},
        )
        
      );

  }
  @override
  Widget build(BuildContext context) {
    int i=0;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Piano'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Row(
        children: <Widget>[
          Expanded(child:  buildButtons(),),
          Expanded(child:  buildButtons(),),
          Expanded(child:  buildButtons(),),
          Expanded(child:  buildButtons(),),
          Expanded(child:  buildButtons(),),
          Expanded(child:  buildButtons(),),
          Expanded(child:  buildButtons(),),
          Expanded(child:  buildButtons(),),
          Expanded(child:  buildButtons(),),
          Expanded(child:  buildButtons(),),
          Expanded(child:  buildButtons(),),
          Expanded(child:  buildButtons(),),
          Expanded(child:  buildButtons(),),
          Expanded(child:  buildButtons(),),
          Expanded(child:  buildButtons(),),
          Expanded(child:  buildButtons(),),
      ],),
    );
  }
}
