import 'package:flutter/material.dart';
//import '';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final List<String> enteries = <String> ['A', 'B', 'C','A', 'B', 'C','A', 'B', 'C','A', 'B', 'C','A', 'B', 'C','A', 'B', 'C'];
    final List<int> colorCodes = <int>[400,500,600,400,500,600,400,500,600,400,500,600,400,500,600,400,500,600];
    return MaterialApp(
      title: 'HelloWOrld',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello World"),
          backgroundColor: Colors.blueAccent,
        ),
        body: ListView.separated(
          addAutomaticKeepAlives: false,
          addRepaintBoundaries: false,
          padding: const EdgeInsets.all(8.0),
          itemCount: enteries.length,
          itemBuilder: (BuildContext context, int index){
            return Container(
              height: 80,
              color: Colors.amber[colorCodes[index]],
              child: Center(child: Text('Entry ${enteries[index]}'),),
            );
          },
          
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          /*
          children: <Widget>[
            Container(
              height: 50.0,
              color: Colors.amber[600],
              child: const Center(child: Text('Entry A'),),
            ),
            Container(
              height: 50.0,
              color: Colors.amber[500],
              child: const Center(child: Text('Entry B'),),
            ),
            Container(
              height: 50.0,
              color: Colors.amber[400],
              child: const Center(child: Text('Entry C'),),
            )
          ],
          */
        ),
      ),

      );
  }
}