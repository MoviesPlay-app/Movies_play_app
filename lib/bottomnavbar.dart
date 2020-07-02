import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:slimy_card/slimy_card.dart';
import './assets/my_flutter_app_icons.dart';


class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
        height:60,
        color: Color.fromRGBO(234, 213, 253, 1),
        child:Row(

        //mainAxisAlignment: MainAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize:MainAxisSize.max,
        children: <Widget>[
          InkWell(
          child:Icon(Icons.home,semanticLabel: 'Home',size:31,color:Color.fromRGBO(33, 39, 189, 1)),
          onTap:()=>{
            Navigator.pushNamed(context, '/userhome')
          }
          ),
          InkWell(
          child: Icon(Icons.chat,semanticLabel: 'Discussion',size:31,color:Color.fromRGBO(33, 39, 189, 1)),
          onTap:()=>{
            Navigator.pushNamed(context, '/discussion')
          }
          ),
          InkWell(
          child:Icon(Icons.chat,semanticLabel: 'chats',size:31,color:Color.fromRGBO(33, 39, 189, 1)),
          onTap:()=>{
            Navigator.pushNamed(context,'/discussion')
          },
          ),
        ],
      ),
      
    );
  }
}