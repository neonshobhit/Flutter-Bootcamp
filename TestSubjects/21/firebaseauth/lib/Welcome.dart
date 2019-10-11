import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  final user;
  Welcome({
    Key key,
    @required this.user,
  }) : super(key: key);
  @override
  _WelcomeState createState() => _WelcomeState(
        user: user,
      );
}

class _WelcomeState extends State<Welcome> {
  var user;
  bool isLoading = true;
  _WelcomeState({
    Key key,
    @required this.user,
  });

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata();
  }

  FirebaseUser loggedin;
  fetchdata() async {
    await FirebaseAuth.instance.currentUser().then(
          (users) => loggedin = users,
        );
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account Information."),
      ),
      body: isLoading
          ? LinearProgressIndicator()
          : Column(
              children: <Widget>[
                Container(
                  child: Image.network(
                    "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/f05a9b5b-ead5-460e-8573-73ba2fff9cde/dcnrsqe-e0930ea2-6a43-4fd3-b522-8fc03bc26646.png/v1/fill/w_1024,h_792,strp/leaf_village_logo_by_cporsdesigns_dcnrsqe-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NzkyIiwicGF0aCI6IlwvZlwvZjA1YTliNWItZWFkNS00NjBlLTg1NzMtNzNiYTJmZmY5Y2RlXC9kY25yc3FlLWUwOTMwZWEyLTZhNDMtNGZkMy1iNTIyLThmYzAzYmMyNjY0Ni5wbmciLCJ3aWR0aCI6Ijw9MTAyNCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.cni8EijKWdjwXVivLoKh_2NNOENnhAXgY9a8sd-WyTE",
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Align(
                //     alignment: Alignment.bottomCenter,
                //     child: Text(
                //       user.uid.toString(),
                //       textAlign: TextAlign.center,
                //     ),
                //   ),
                // ),
                // Text(
                //   user.toString()
                // ),
                ListTile(
                  leading: Icon(
                    Icons.email,
                  ),
                  title: Text(
                    loggedin.email.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                // Text(
                //   "+" + loggedin.isEmailVerified.toString()
                // ),
                RaisedButton(
                  child: Text(
                    "Sign Out",
                  ),
                  onPressed: () {
                    signmeout();
                  },
                )
              ],
            ),
    );
  }

  signmeout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, '/home');
  }
}
