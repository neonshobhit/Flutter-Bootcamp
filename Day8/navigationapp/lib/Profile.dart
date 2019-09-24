import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
//import 'package:webview_flutter/webview_flutter.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Shobhit"),
              accountEmail: Text("shobhitmaheshwari18@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.amber,
                child: Container(
                  child: Image.network(
                      "https://instagram.fudr1-1.fna.fbcdn.net/vp/0e0c826c335d34a6537c2cf75b802a9f/5E3C1280/t51.2885-19/s320x320/32178282_1846693452055722_2280604583086522368_n.jpg?_nc_ht=instagram.fudr1-1.fna.fbcdn.net"),
                ),
              ),
            ),
            ListTile(
              title: Text("Home"),
              trailing: Icon(Icons.home),
            ),
            ListTile(
              title: Text("Category"),
              trailing: Icon(Icons.search),
              onTap: () => Navigator.of(context).pushNamed("/a"),
            ),
            ListTile(
              title: Text("Profile"),
              trailing: Icon(Icons.near_me),
              onTap: () => Navigator.of(context).pushNamed("/Profile"),
            ),
            ListTile(
              title: Text("LogIn"),
              trailing: Icon(Icons.input),
              onTap: () => Navigator.of(context).pushNamed("/Login"),
            ),
            ListTile(
              title: Text("SignUp"),
              trailing: Icon(Icons.note_add),
              onTap: () => Navigator.of(context).pushNamed("/SignUp") ,
            ),
            ListTile(
              title: Text("Contact"),
              trailing: Icon(Icons.contact_mail),
            ),
            Divider(),
            ListTile(
              title: Text("Close"),
              trailing: Icon(Icons.exit_to_app),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: double.infinity,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            child: ClipPath(
              clipper:  Trapezium(),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.red,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.38,
            left: MediaQuery.of(context).size.width * 0.4,
            child: Container(
              alignment: Alignment.center,
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  image: new NetworkImage(
                    'https://instagram.fdel1-2.fna.fbcdn.net/vp/f7bedb8dbdc0bdc938fcc3c7d7268c79/5E3C1280/t51.2885-19/s320x320/32178282_1846693452055722_2280604583086522368_n.jpg?_nc_ht=instagram.fdel1-2.fna.fbcdn.net',
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.52,
            left: MediaQuery.of(context).size.width * 0.24,
            child: Text(
              'Shobhit Maheshwari',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.7,
            left: MediaQuery.of(context).size.width * 0.1,
            
            child: Row(
              /*crossAxisCount: 3,
              mainAxisSpacing: 0,
              crossAxisSpacing: 1,
              */
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    child: Text(
                      "12.5K",
                      style: TextStyle(
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    child: Text(
                      "360k",
                      style: TextStyle(
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    child: Text(
                      "650",
                      style: TextStyle(
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.73,
            left: MediaQuery.of(context).size.width * 0.1,
            
            child: Row(
              /*
              crossAxisCount: 3,
              mainAxisSpacing: 0,
              crossAxisSpacing: 1,*/
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Container(
                    child: Text(
                      "Projects",
                      style: TextStyle(
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(33.0),
                  child: Container(
                    child: Text(
                      "Applications",
                      style: TextStyle(
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    child: Text(
                      "Repo",
                      style: TextStyle(
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.86,
            left: MediaQuery.of(context).size.width * 0.38,
            child: RaisedButton(
              color: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Text('Follow me!'),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  
  }
}
  class Trapezium extends CustomClipper<Path> {
 // @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0,0.0);
    path.lineTo(0.0, 600.0);
    path.lineTo(size.width, 200.0);
    
    path.lineTo(size.width, 0.0);
    
    path.close();
    
    return path;
  }

  @override
  bool shouldReclip(Trapezium oldClipper){
    return oldClipper != this;
  } 

      
    
  
}