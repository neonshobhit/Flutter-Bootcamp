import 'package:contacts/Details.dart';
import 'package:contacts/addcontacts.dart';
import 'package:contacts/myData.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatabaseReference ref = FirebaseDatabase.instance.reference();
  var data = [];
  List keylist = [];
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  bool isLoading = true;
  List<myData> allData= [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialise();
  }

  initialise() async {
    await readdata();
  }

  void _onRefresh() async {
    data = [];
    keylist = [];
    readdata();
    await Future.delayed(Duration(milliseconds: 1000));

    _refreshController.refreshCompleted();
  }

  void onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));

    // _HomePageState();
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contacts",
        ),
      ),
      body: SmartRefresher(
        //enablePullUp: true,
        enablePullDown: true,
        header: WaterDropHeader(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: onLoading,
        child: isLoading == true
            ? LinearProgressIndicator()
            : SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) =>
                          Buildlist(
                        name: data[index]['name'],
                        email: data[index]['email'],
                        number: data[index]['number'],
                        imageURL: data[index]['url'],
                        majorkey: keylist[index],
                      ),
                    ),
                    // StreamBuilder(
                    //   stream: ref.onValue,
                    //   builder: (context, snap) {
                    //     if (snap.hasData && snap.data.snapshot.value != null) {
                    //       DataSnapshot snapshot = snap.data.snapshot;
                    //       List item = [];
                    //       var _list = [];

                    //        _list = snapshot.value['ffg'];
                    //        //print(_list);
                    //        //readdata();

                    //     //  _list.forEach((f) {
                    //     //     if (f['title'].toString() != null) {
                    //     //       item.add(f['title'].toString());
                    //     //     }
                    //     //   });
                    //       return snap.data.snapshot.value == null
                    //           ? SizedBox()
                    //           : ListView.builder(
                    //               shrinkWrap: true,
                    //               itemCount: item.length,
                    //               itemBuilder: (context, index) {
                    //                 return Text(
                    //                   item[index]['title'],
                    //                 );
                    //               },
                    //             );
                    //     } else {
                    //       Center(
                    //         child: CircularProgressIndicator(),
                    //       );
                    //     }
                    //     return SizedBox();
                    //   },
                    // )

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
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNotes(
                innitialname: "",
                initialnumber: "",
                initialemail: "",
                updating: false,
                

              ),
            ),
          );
        },
      ),
    );
  }

  Future<Query> QueryUsers() async {
    return FirebaseDatabase.instance.reference().child('contacts')
        //.orderByKey()
        //.orderByValue()
        ;
    //.orderByChild("name");
  }

  readdata() async {
    await QueryUsers().then((query) {
      query.once().then((DataSnapshot snapshots) {
        Map<dynamic, dynamic> value = snapshots.value;
        if (value != null) {
          value.forEach((key, value) {
            data.add(value);
            keylist.add(key);
            //print(key);

            // Buildlist(
            //   name: value['name'],
            //   email: value['email'],
            //   number: value['number'],
            // );
          });
          // for (var i = 0; i < data.length; i++) {
          //   print(data[i]);
          // }
          setState(() {
            isLoading = false;
          });
        }
      });
    });

    // DatabaseReference ref = FirebaseDatabase.instance.reference();
    // ref.child("contacts").once().then((DataSnapshot snap){
    //   var keys = snap.value.keys;
    //   var data = snap.value;
    //   allData.clear();
    //   for(var key in keys){
    //     myData d = new myData(
    //       data[key]['name'],
    //       data[key]['phone'],
    //       data[key]['email'],
    //       data[key]['imageURL'],
    //     );
    //     allData.add(d);
    //   }
    // });



  }
}

class Buildlist extends StatelessWidget {
  String name, email, number;
  var majorkey;
  Buildlist({Key key, @required this.name, this.email, this.number, this.imageURL, this.majorkey})
      : super(key: key);

  var imageURL;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: (){
                detailpage(context);
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.black,
                  backgroundImage: NetworkImage(
                    imageURL ?? "https://image.freepik.com/free-photo/image-human-brain_99433-298.jpg",
                  ),
                ),
                title: Text(
                  name,
                ),
                subtitle: Text(
                  number + '\n' + email,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  detailpage(context){
    Navigator.push( context, MaterialPageRoute(
      builder: (context) => Details(
        contactkey: majorkey,
      )
    ));
  }
}
