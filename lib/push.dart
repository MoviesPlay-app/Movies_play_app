import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotification extends StatefulWidget {
  @override
  _PushNotificationState createState() => _PushNotificationState();
}

class _PushNotificationState extends State<PushNotification> {
  static final FirebaseMessaging firebase_messaging= FirebaseMessaging();
  void register(){
  }
  void initState(){
    super.initState();
    getMessage();
  }
  void getMessage(){
    firebase_messaging.configure(
        onMessage: (Map<String, dynamic> message) async {
      print('on message $message');
      setState(() => message = message["notification"]["title"]);
    }, onResume: (Map<String, dynamic> message) async {
      print('on resume $message');
      setState(() => message = message["notification"]["title"]);
    }, onLaunch: (Map<String, dynamic> message) async {
      print('on launch $message');
      setState(() => message = message["notification"]["title"]);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

class Push{
  
}




