import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VideoApp extends StatefulWidget {
  final String url;
  var content;
  VideoApp({Key key, @required this.url, this.content}) : super(key: key);
  @override
  _VideoAppState createState() => _VideoAppState(
        url: url,
        content: content,
      );
}

class _VideoAppState extends State<VideoApp> {
  final String url;
  var content;
  _VideoAppState({Key key, @required this.url, this.content});
  VideoPlayerController _controller;
  final String link = "http://userapi.tk/youtube/";
  bool isLoading = true;
  var data;
  bool isSwitched = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getjsondata();
    _controller = VideoPlayerController.network(
      url,
    )..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.play();
        });
      });
  }

  Future<String> getjsondata() async {
    var response = await http.get(
      Uri.encodeFull(url),
    );
    setState(() {
      var convertdatatojson = json.decode(response.body);
      data = convertdatatojson;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _controller.value.initialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : SizedBox(
                    height: 300,
                  ),
            ListTile(
              title: Text(
                content['Title'],
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25
                ),
              ),
              subtitle: Text(
                content['Views'] + "Views",
              ),
              trailing: Icon(
                Icons.arrow_drop_down,
              ),
            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.thumb_up,
                        color: Colors.grey,
                      ),
                      Text(
                        "28K",
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.thumb_down,
                        color: Colors.grey,
                      ),
                      Text(
                        "2.3K",
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.share,
                        color: Colors.grey,
                      ),
                      Text(
                        "Share",
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.save_alt,
                        color: Colors.grey,
                      ),
                      Text(
                        "Download",
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.playlist_add,
                        color: Colors.grey,
                      ),
                      Text(
                        "Save",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(),
            SizedBox(
              height: 60,
              child: ListTile(
                leading: CircleAvatar(
                  maxRadius: 20,
                  child: Image.network(
                    
                    content['ProfileiconURL'],
                  ),
                ),
                title: Text(
                  content['Title'],
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600
                  ),
                ),
                subtitle: Text("12M subscribers",
                style: TextStyle(
                  fontSize: 12,
                ),
                ),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.youtube_searched_for,
                        color: Colors.red,
                      ),
                      Text(
                        "SUBSCRIBE",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(),
            ListTile(
              leading: Text(
                "Up Next",
              ),
              trailing: SizedBox(
                width: 115,
                child: Row(
                  children: <Widget>[
                    Text("Autoplay"),
                    Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      },
                      activeColor: Colors.blue,
                      activeTrackColor: Colors.blueAccent,
                      inactiveThumbColor: Colors.grey,
                      inactiveTrackColor: Colors.grey[200],
                    )
                  ],
                ),
              ),
            ),
            isLoading
                ? CircularProgressIndicator()
                : ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: content.length,
                    itemBuilder: (BuildContext context, int index) => Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 16.0),
                      child: ListTile(
                        leading: SizedBox(
                          height: 100,
                          width: 150,
                          child: Image.network(
                            data[index]['ThumbmnilURL'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(data[index]['Title']),
                        subtitle: Text(
                          data[index]['Name'] + "\n" + data[index]['Views'],
                        ),
                        trailing: Icon(
                          Icons.more_vert,
                        ),
                      ),
                    ),
                  ),
            Divider(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
