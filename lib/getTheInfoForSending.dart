import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() => runApp(GetTheInfo());

class GetTheInfo extends StatelessWidget {
  final FirebaseUser firebaseUser;
  GetTheInfo({Key key, this.firebaseUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: GetTheInfoStateful(firebaseUser: firebaseUser,),
    );
  }

}

class GetTheInfoStateful extends StatefulWidget {
  final FirebaseUser firebaseUser;
  GetTheInfoStateful({Key key, this.firebaseUser}) : super(key: key);

  State<GetTheInfoStateful> createState() => new GetTheInfoState();
}

class GetTheInfoState extends State<GetTheInfoStateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: new Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height,
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
            elevation: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[

                Padding(
                  padding: EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 16.0),
                  child: Text("Send document:",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),



                Padding(
                  padding: EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                  child: Text("Any one mode of sending is mandatory",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ),
                ),




                Padding(
                  padding: EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Email ID (only @gmail.com)",
                    ),
                  ),
                ),


                Padding(
                  padding: EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Mobile number",
                    ),
                  ),
                ),


                Padding(
                  padding: EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "WhatsApp number",
                    ),
                  ),
                ),




                Align(
                  alignment: FractionalOffset.center,
                  child:
                  Padding(
                    padding: EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 16.0),
                    child:
                    RaisedButton(
                      color: Colors.green,
                      textColor: Colors.white,
                      child: Text("Send Document"),
                      onPressed: () {},
                    ),
                  ),
                ),


              ],
            ),
          ),
        )
      ),
    );
  }

}
