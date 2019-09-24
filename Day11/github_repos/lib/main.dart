import 'package:flutter/material.dart';
import 'package:github_repos/HomePage.dart';

main() => runApp(GitHub_Repos());

class GitHub_Repos extends StatefulWidget {
  @override
  _GitHub_ReposState createState() => _GitHub_ReposState();
}

class _GitHub_ReposState extends State<GitHub_Repos> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: HomePage(
        changinglink: "https://api.github.com/users/neonshobhit/repos",
      )
      
      
      /*Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
            changinglink: "https://api.github.com/users/neonshobhit/repos",
          )
        )
        */

      
      
    );
  }
}