import 'package:Web_App_Flutter_Demo/getTheInfoForSending.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(UserDashboard());

class UserDashboard extends StatelessWidget {
  final FirebaseUser firebaseUser;
  UserDashboard({Key key, this.firebaseUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "User Dashboard",
      home: new UserDashboardStateful(title: firebaseUser,),
    );
  }

}

class UserDashboardStateful extends StatefulWidget {

  UserDashboardStateful({Key key, this.title}) : super(key: key);
  final FirebaseUser title;

  @override
  State<UserDashboardStateful> createState() => new UserDashboardState();
}

class UserDashboardState extends State<UserDashboardStateful> {

  var patientName = new TextEditingController();
  var age = new TextEditingController();
  var gender = new TextEditingController();
  var symptoms = new TextEditingController();
  var diagnosis =  new TextEditingController();
  var prescription = new TextEditingController();
  var advicesOptional = new TextEditingController();

  bool allParamsAbsent = false;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Column(
          children: <Widget>[

            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.height,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                )),
                elevation: 16.0,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[

                          Padding(
                            padding: EdgeInsets.all(32.0),
                            child: Text("Hi "+widget.title.displayName, style: TextStyle(
                              fontSize: 24.0,
                            ),),
                          ),



                          Padding(
                            padding: EdgeInsets.all(32.0),
                            child: RaisedButton(
                              elevation: 0,
                              color: Colors.blue,
                              textColor: Colors.white,
                              onPressed: () {},
                              child: Text("Profile"),
                            ),
                          ),

                        ],
                      ),

                      Flex(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          Flexible(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 16.0),
                              child: TextField(
                                controller: patientName,
                                decoration: InputDecoration(
                                    labelText: "Patient Name"
                                ),
                              ),
                            ),
                          ),

                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 16.0),
                              child: TextField(
                                controller: age,
                                decoration: InputDecoration(
                                    labelText: "Age"
                                ),
                              ),
                            ),
                          ),


                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 16.0),
                              child: TextField(
                                controller: gender,
                                decoration: InputDecoration(
                                    labelText: "Gender"
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),


                      Padding(
                        padding: EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 16.0),
                        child: TextField(
                          controller: symptoms,
                          decoration: InputDecoration(
                            labelText: "Symptoms",
                          ),
                        ),
                      ),



                      Padding(
                        padding: EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 16.0),
                        child: TextField(
                          controller: diagnosis,
                          decoration: InputDecoration(
                            labelText: "Diagnosis",
                          ),
                        ),
                      ),



                      Padding(
                        padding: EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 16.0),
                        child: TextField(
                          controller: prescription,
                          decoration: InputDecoration(
                            labelText: "Prescription",
                          ),
                        ),
                      ),


                      Padding(
                        padding: EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 16.0),
                        child: TextField(
                          controller: advicesOptional,
                          decoration: InputDecoration(
                            labelText: "Advices (optional)",
                          ),
                        ),
                      ),



                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                          Row(
                            children: <Widget>[

                              Padding(
                                padding: EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 16.0),
                                child: FloatingActionButton(
                                  heroTag: null,
                                  onPressed: () {},
                                  child: Icon(Icons.history),
                                ),
                              ),



                            ],
                          ),


                          Padding(
                            padding: EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 16.0),
                            child: FloatingActionButton(
                              heroTag: null,
                              onPressed: () {
                                checkIfAllParametersPassing();
                              },
                              child: Icon(Icons.send),
                            ),
                          ),


                        ],
                      ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 16.0),
                        child: Container(
                          height: 200,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(16.0)),
                            ),
                              color: Colors.black,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                          ),
                        ),
                      ),



                    ],
                  ),
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }

  void checkIfAllParametersPassing() {
      if(isEmptyOrNullCheck(patientName.text) &&
          isEmptyOrNullCheck(age.text) &&
          isEmptyOrNullCheck(gender.text) &&
          isEmptyOrNullCheck(symptoms.text) &&
          isEmptyOrNullCheck(diagnosis.text) &&
          isEmptyOrNullCheck(prescription.text)) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => new GetTheInfo(firebaseUser: widget.title,)));
      } else {
        
      }
  }

  bool isEmptyOrNullCheck(String string) {
    if(string == null || string.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

}
