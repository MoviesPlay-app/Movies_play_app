


import 'package:flutter/material.dart';
import 'package:flutterapp/auth.dart';
import 'package:flutterapp/home.dart';
import 'package:flutterapp/push.dart';
import 'package:splashscreen/splashscreen.dart';
import 'auth.dart' as auth;
import 'home.dart' as home;


void main() {
  runApp(MaterialApp(

    home : Home(),
    routes: {
      '/login' : (context) => Login(),
      '/signup' : (context) => SignUp(),
      '/userhome' : (context) => UserHome(),
      '/push' : (context) => PushNotification(),
    },

  ));
}



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
     //test code
    return new SplashScreen(
      seconds: 8,
      image: new Image.asset('assets/loading.gif'),
      backgroundColor: Colors.black,
      photoSize: 150,
      //navigateAfterSeconds: AfterSplash(),
      navigateAfterSeconds : AfterSplash()
    );
  }
}


class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          body: Padding(
            padding: EdgeInsets.all(10),
            child : ListView(
              children: <Widget>[
                Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('Login'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                )),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Sign Up'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                    )),
                    Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('logout'),
                      onPressed: () {
                        Login().googleSignOut();
                      },
                    )),

              ],
            )
          ),

        );
  }
}



/*class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          appBar: AppBar(
            title: Text('Hey B'),
            centerTitle: true,
            backgroundColor: Colors.red,
          ),
          body : Center(
            child : TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter your email',

              ),
              textAlign: TextAlign.center,
              autofocus: true,



            ),





          ),

          floatingActionButton: FloatingActionButton(
            onPressed: () {
              print('Pressed');
            },
            child : Text('+'),
            backgroundColor: Colors.red,
          ),
        );




  }
}*/


