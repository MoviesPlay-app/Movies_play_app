import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:slimy_card/slimy_card.dart';
import '../assets/my_flutter_app_icons.dart';
import '../home.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


class BottomBarCinematography extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 6),
        height:60,
        color: Color.fromRGBO(234, 213, 253, 1),
        child:Row(

        //mainAxisAlignment: MainAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize:MainAxisSize.max,
        children: <Widget>[
          InkWell(
            child:Icon(Icons.skip_next,semanticLabel:'next',size:31,color:Color.fromRGBO(33, 39, 189, 1)),
            onTap:()=>{
              Navigator.pushNamed(context, '/preferences genre')
            }
          )
        ],
      ),
      
    );
    }
}

class BottomBarGenre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 6),
        height:60,
        color: Color.fromRGBO(234, 213, 253, 1),
        child:Row(

        //mainAxisAlignment: MainAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize:MainAxisSize.max,
        children: <Widget>[
          InkWell(
            child:Icon(Icons.skip_next,semanticLabel:'next',size:31,color:Color.fromRGBO(33, 39, 189, 1)),
            onTap:()=>{
              Navigator.pushNamed(context, '/preferences language')
            }
          )
        ],
      ),
      
    );
  }
}

class BottomBarLanguage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 6),
        height:60,
        color: Color.fromRGBO(234, 213, 253, 1),
        child:Row(

        //mainAxisAlignment: MainAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize:MainAxisSize.max,
        children: <Widget>[
          InkWell(
            child:Icon(Icons.skip_next,semanticLabel:'next',size:31,color:Color.fromRGBO(33, 39, 189, 1)),
            onTap:()=>{
              Navigator.pushNamed(context, '/preferences plot')
            }
          )
        ],
      ),
      
    );
  }
}

class BottomBarPlot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 6),
        height:60,
        color: Color.fromRGBO(234, 213, 253, 1),
        child:Row(

        //mainAxisAlignment: MainAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize:MainAxisSize.max,
        children: <Widget>[
          InkWell(
            child:Icon(Icons.skip_next,semanticLabel:'next',size:31,color:Color.fromRGBO(33, 39, 189, 1)),
            onTap:()=>{
              Navigator.pushNamed(context, '/userhome')
            }
          )
        ],
      ),
      
    );
  }
}