import 'package:flutter/material.dart';

class UserDisplayHome extends StatefulWidget {
  @override
  _UserDisplayHomeState createState() => _UserDisplayHomeState();
}

class _UserDisplayHomeState extends State<UserDisplayHome> {
  
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    print(arguments['email']+arguments['name']);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body : Container(
        
      )
    );
  }
}
