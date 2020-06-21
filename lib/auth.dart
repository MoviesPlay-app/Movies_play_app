import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'push.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flushbar/flushbar.dart';


class Login extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final facebookLogin=FacebookLogin();
  static final FirebaseMessaging firebase_messaging= FirebaseMessaging();
  FlutterLocalNotificationsPlugin flutter_local_notifications=FlutterLocalNotificationsPlugin();
  AuthResult result;

  Future<FirebaseUser> login_with_google() async{
    GoogleSignInAccount googleSignInAccount=await googleSignIn.signIn();
    GoogleSignInAuthentication gsa=await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: gsa.accessToken,
      idToken: gsa.idToken,
    );
    final AuthResult authResult = await _auth.signInWithCredential(credential);
    FirebaseUser user = authResult.user;
    //register();
    
    print(user);
    initializeNotifications();
    showNotificationWithSound(user);
    return user;
  }

  login_with_fb() async{
    final result = await facebookLogin.logInWithReadPermissions(['email']);
    final token=result.accessToken.token;
    final graphResponse = await http.get('https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
    final profile=JSON.jsonDecode(graphResponse.body);
    print(profile);

}

  void googleSignOut()
  {
    googleSignIn.signOut();
    print("user signed out");
  }

  void facebookSignOut()
  {
    facebookLogin.logOut();
  }

  Future<AuthResult> signInWithEmailAndPassword() async{
  
    
    
    result = await _auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
  
    return result;
    
    }
  

  void register()
  {
      firebase_messaging.getToken().then((token) => print(token));
  }
  initializeNotifications() async{
    var initializeAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializeIOS = IOSInitializationSettings();
    var initSettings = InitializationSettings(initializeAndroid, initializeIOS);
    await flutter_local_notifications.initialize(initSettings);
  }

  Future showNotificationWithSound(FirebaseUser user) async {
  var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
      'your channel id', 'your channel name', 'your channel description',
      sound: 'slow_spring_board',
      importance: Importance.Max, priority: Priority.High);
  var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
  var platformChannelSpecifics = new NotificationDetails(
      androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
  await flutter_local_notifications.show(
    0,
    'Sign In',
    user.displayName+' You have just signed in to Movies Play',
    platformChannelSpecifics,
    payload: 'Custom_Sound',
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Movies Play'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Authentication',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: (){
                    //forgot password screen
                  },
                  textColor: Colors.blue,
                  child: Text('Forgot Password'),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Login'),
                      onPressed: () {
                        signInWithEmailAndPassword().then((AuthResult result) => {
                          print(result),
                          Navigator.pushNamed(context, '/userhome'),
                          })
                        .catchError((e)=> {
                          print(e),
                          if(e!=null){
                          Flushbar(
                            title : 'Sign in Error',
                            message : e.message,
                            backgroundGradient: LinearGradient(colors: [Colors.blue, Colors.teal]),
                            duration: Duration(seconds:3),
                            flushbarPosition: FlushbarPosition.TOP,
                          )..show(context)
                          }
                        });

                      },
                    )),
                FlatButton(
                  onPressed: (){
                    //forgot password screen
                  },
                  textColor: Colors.blue,
                  child: Text('Or'),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),

                    child: GoogleSignInButton(
                      onPressed: () {
                        print("a");
                        login_with_google()

                            .then((FirebaseUser user) => print(user))
                            
                            .catchError((e) => print(e));
                            
                            
                        
                        Navigator.pushNamed(context, '/userhome');
                      },
                    )),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: FacebookSignInButton(
                      onPressed: () {
                        login_with_fb();
                        Navigator.pushNamed(context, '/userhome');

                      },
                    )),

                Container(
                    child: Row(
                      children: <Widget>[
                        Text('Does not have account?'),
                        FlatButton(
                          textColor: Colors.blue,
                          child: Text(
                            'Sign in',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {

                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )),

              ],
            )));
  }
}


class SignUp extends StatelessWidget {
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final facebookLogin=FacebookLogin();
  static final FirebaseMessaging firebase_messaging= FirebaseMessaging();
  FlutterLocalNotificationsPlugin flutter_local_notifications=FlutterLocalNotificationsPlugin();
  AuthResult result;

  Future<FirebaseUser> login_with_google() async{
    GoogleSignInAccount googleSignInAccount=await googleSignIn.signIn();
    GoogleSignInAuthentication gsa=await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: gsa.accessToken,
      idToken: gsa.idToken,
    );
    final AuthResult authResult = await _auth.signInWithCredential(credential);
    FirebaseUser user = authResult.user;
    //register();
    
    print(user);
    initializeNotifications();
    showNotificationWithSound(user);
    return user;
  }

  login_with_fb() async{
    final result = await facebookLogin.logInWithReadPermissions(['email']);
    final token=result.accessToken.token;
    final graphResponse = await http.get('https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
    final profile=JSON.jsonDecode(graphResponse.body);
    print(profile);

}

  void googleSignOut()
  {
    googleSignIn.signOut();
    print("user signed out");
  }

  void facebookSignOut()
  {
    facebookLogin.logOut();
  }

  Future<AuthResult> signUpWithEmailAndPassword(String email,String password) async{
    FirebaseUser user;
    
    result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
    return result;
    
  }
  void email_signout(){
    _auth.signOut();
  }

  void register()
  {
      firebase_messaging.getToken().then((token) => print(token));
  }
  initializeNotifications() async{
    var initializeAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializeIOS = IOSInitializationSettings();
    var initSettings = InitializationSettings(initializeAndroid, initializeIOS);
    await flutter_local_notifications.initialize(initSettings);
  }

  Future showNotificationWithSound(FirebaseUser user) async {
  var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
      'your channel id', 'your channel name', 'your channel description',
      sound: 'slow_spring_board',
      importance: Importance.Max, priority: Priority.High);
  var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
  var platformChannelSpecifics = new NotificationDetails(
      androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
  await flutter_local_notifications.show(
    0,
    'Sign In',
    user.displayName+' You have just signed in to Movies Play',
    platformChannelSpecifics,
    payload: 'Custom_Sound',
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Movies Play'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Authentication',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Email',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: (){
                    //forgot password screen
                  },
                  textColor: Colors.blue,
                  child: Text('Forgot Password'),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Registerr'),
                      onPressed: () {
                        
                        signUpWithEmailAndPassword(emailController.text,passwordController.text)
                        .catchError((e) =>{
                          Flushbar(
                            title : 'Registeration error',
                            message : e.message,
                            backgroundGradient: LinearGradient(colors: [Colors.blue, Colors.teal]),
                            duration: Duration(seconds:3),
                            flushbarPosition: FlushbarPosition.TOP,
                          )..show(context),
                        });
              
                        
                        
                          
                          
                      
                        
                        Navigator.pushNamed(context, '/userhome');
                        
                      },
                    )),
                FlatButton(
                  onPressed: (){
                    //forgot password screen
                  },
                  textColor: Colors.blue,
                  child: Text('Or'),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),

                    child: GoogleSignInButton(
                      onPressed: () {
                        print("a");
                        login_with_google()

                            .then((FirebaseUser user) => print(user))
                            
                            .catchError((e) => print(e));
                            
                            
                        
                        Navigator.pushNamed(context, '/userhome');
                      },
                    )),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: FacebookSignInButton(
                      onPressed: () {
                        login_with_fb();
                        Navigator.pushNamed(context, '/userhome');

                      },
                    )),

                Container(
                    child: Row(
                      children: <Widget>[
                        Text('Does not have account?'),
                        FlatButton(
                          textColor: Colors.blue,
                          child: Text(
                            'Sign in',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {

                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )),

              ],
            )));
  }
}




