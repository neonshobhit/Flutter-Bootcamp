import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebasetodo/AddNotes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatabaseReference ref = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ToDo",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            StreamBuilder(
              stream: ref.onValue,
              builder: (context, snap) {
                if (snap.hasData && snap.data.snapshot.value != null) {
                  DataSnapshot snapshot = snap.data.snapshot;
                  List item = [];
                  var _list = [];

                   _list = snapshot.value['ffg'];
                   print(_list);

                //  _list.forEach((f) {
                //     if (f['title'].toString() != null) {
                //       item.add(f['title'].toString());
                //     }
                //   }); 
                  return snap.data.snapshot.value == null
                      ? SizedBox()
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: item.length,
                          itemBuilder: (context, index) {
                            return Text(
                              item[index]['title'],
                            );
                          },
                        );
                } else {
                  Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return SizedBox();
              },
            )

            // StreamBuilder(
            //   stream: ref.onValue,
            //   builder: (context, snapshot) {
            //     DataSnapshot snapshots = snapshot.data.snapshot;
            //     return Text(
            //       snapshots.value['title']['okay'],
            //     );

            // return ListView.builder(
            //   shrinkWrap: true,
            //   primary: false,
            //   itemCount: snapshots.value.length,
            //   itemBuilder: (context, index) {
            //     return ListTile(
            //       title: Text(
            //         snapshots.value['title']['title'],
            //       ),
            //       subtitle: Text(
            //         snapshots.value['title']['details'],
            //       ),
            //     );
            //   },
            // );
            //},
            //)
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onDoubleTap: (){
          ref.child('notes').child('fff').set(null);
          //DatabaseReference ref = DatabaseReference
        },
        child: FloatingActionButton(
          child: Icon(
            Icons.add,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddNotes(),
              ),
            );
          },
        ),
      ),
    );
  }
}
