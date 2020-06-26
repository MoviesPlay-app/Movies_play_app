import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
// To be done 
class MidScreen extends StatefulWidget {
  @override
  _MidScreenState createState() => _MidScreenState();
}

class _MidScreenState extends State<MidScreen> {
  @override
  Widget build(BuildContext context) {
     final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    print(arguments['email']+arguments['name']);
    return Scaffold(
    body : Container(
      decoration : BoxDecoration(
        color : Color(0xFF137BF3)
      ),
      child: FlareActor(
        "assets/midscreen2.flr",alignment: Alignment.center,fit: BoxFit.contain,animation:'Popup_Animation',
      ),
    ),      
    );
  }
}

class UserDisplayHome extends StatefulWidget {
  @override
  _UserDisplayHomeState createState() => _UserDisplayHomeState();
}

class _UserDisplayHomeState extends State<UserDisplayHome> {
  
  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body : Container(
        
      )
    );
  }
}
