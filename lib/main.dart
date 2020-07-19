import 'package:flutter/material.dart';
import 'package:flutterapp/auth.dart';
import 'package:flutterapp/discussion.dart';
import 'package:flutterapp/home.dart';
import 'package:flutterapp/movie_description.dart';
import 'package:flutterapp/preferences.dart';
import 'package:flutterapp/profile.dart';
import 'package:flutterapp/push.dart';
import 'package:splashscreen/splashscreen.dart';
import 'auth.dart' as auth;
import 'home.dart' as home;
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  //Hive.registerAdapter(ContactAdapter(), 0);
  runApp(MaterialApp(
    
    home : Home(),
    routes: {
      '/login' : (context) => Login(),
      '/signup' : (context) => SignUp(),
      '/userhome' : (context) => UserDisplayHome(),
      '/push' : (context) => PushNotification(),
      '/midscreen' : (context) => MidScreen(),
      '/discussion': (context) => Discussion(),
      '/profile' : (context)=> Profile(),
      '/preferences cinematography' : (context)=> PreferencesCinematography(),
      '/preferences genre': (context) => PreferencesGenre(),
      '/preferences language': (context) => PreferencesLanguage(),
      '/preferences plot' : (context) => PreferencesPlot(),
      '/movie description' : (context) => MovieDescription(),
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
                    print(Login().isSignedIn);
                    if(Login().isSignedIn || SignUp().isSignedIn){
                      
                      Navigator.pushNamed(context, '/userhome');
                    }
                    else{
                    Navigator.pushNamed(context, '/login');
                    }
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
                        if(Login().isSignedIn || SignUp().isSignedIn){
                      Navigator.pushNamed(context, '/userhome');
                    }
                    else{
                    Navigator.pushNamed(context, '/signup');
                    }
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
                        Login().email_signout();
                        Login().facebookSignOut();
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