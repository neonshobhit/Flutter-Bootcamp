import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final scratchkey = GlobalKey<ScratcherState>();
  var rewards = 0;
  var total = 0;
  var listwin = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  int i = 0;
  int j =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[350],
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  "Total Rewards: $total",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                  ),
                ),
                background: Image.network(
                  'https://www.m1.com.sg/-/media/Images/Personal/My-Account/Rewards/ImageBanner/Rewards.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                'Scratch And Win',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
              backgroundColor: Colors.grey[350],
              expandedHeight: 250.0,
              pinned: false,
              snap: true,
              floating: true,
              centerTitle: true,
            ),
            SliverPadding(
              padding: EdgeInsets.all(10.0),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Scratcher(
                    //key: scratchkey,
                    brushSize: 50,
                    threshold: 30,
                    imagePath: 'assets/images.png',
                    color: Colors.blue,
                    onThreshold: () {
                      print("Better Luck Next Time!");
                      setState(() {
                        rewards = Random().nextInt(20);
                        listwin[i] = rewards;
                        total += rewards;
                        i++;
                      });
                    },
                    child: Container(
                        alignment: Alignment.center,
                        color: Colors.amber,
                        child: Stack(
                          children: <Widget>[
                            Image.network(
                                'https://cdn.dribbble.com/users/234969/screenshots/5414177/burst_trophy_dribbble.gif'),
                            Positioned(
                              top: MediaQuery.of(context).size.height * 0.14,
                              left: MediaQuery.of(context).size.width * 0.05,
                              child: Text(
                                "You won: ${listwin[j++]} ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        )),
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        ));
  }
}
