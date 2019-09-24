import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}
class LoginData{
  String email = "";
  String passw = "";
}
class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  LoginData _data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.blue,
      ),
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
              title: Text("About"),
              trailing: Icon(Icons.near_me),
            ),
            ListTile(
              title: Text("Profile"),
              trailing: Icon(Icons.near_me),
              onTap: () => Navigator.of(context).pushNamed("/Profile"),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text("Enter EmailId"),
          ),
          Container(
            child: Form(
              key: _formkey,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'xxx@yyyyy.com',
                      labelText: 'Email Address',
                    ),
                    validator: (value) {
                      //_data.email = value;
                      if (value.isEmpty) {
                        return 'Please Enter EmailId';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                  this._data.email = value;
                }
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Enter YOur Password!',
                    ),
                    validator: (value) {
                     // _data.passw = value;
                      if (value.length < 8) {
                        return 'Password is short';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                  this._data.passw = value;
                    },
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              color: Colors.blue,
              child: Text(
                "Login!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                if (_formkey.currentState.validate()) {
                  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Processing Data')));
                  print("Email: ${_data.email}");
                  print("Password: ${_data.passw}");
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
