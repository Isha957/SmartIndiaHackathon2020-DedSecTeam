import 'package:Web_App_Flutter_Demo/userDashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Doctor's Voice",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: "Doctor's Voice"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void initState() {
    super.initState();
    _auth.currentUser().then((onValue) {
      if(onValue != null) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserDashboard(firebaseUser: onValue,)));
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: new Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              Container(
                child: Card(
                  elevation: 16.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  child: Center(
                    child: Text(
                      "Doctor's Voice",
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                ),
                width: MediaQuery.of(context).size.width / 2,
                height: 100,
              ),


              Container(
                child:
                Card(
                  elevation: 16.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Padding(
                        padding: EdgeInsets.all(32.0),
                        child:
                        Text("Login (or) Create an account",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),




                      Center(
                        child:
                        Padding(
                            padding: EdgeInsets.all(32.0),
                            child: RaisedButton(
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child:
                                Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child:
                                  Text("Continue with Google",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                _signInWithGoogle();
                              },
                            )
                        ),
                      ),



                    ],
                  ),
                ),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 2,
              ),

            ],
          )
      ),
    );
  }


  void _signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
    await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    setState(() {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => new UserDashboard(firebaseUser: user,)));
    });
  }

}
