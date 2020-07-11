import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:slimy_card/slimy_card.dart';
import '../assets/my_flutter_app_icons.dart';
import '../home.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return ValueListenableBuilder(
    valueListenable:Hive.box('myBox').listenable(),
    builder: (context,box,widget){
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 6),
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
          InkWell(
          child:Icon(Icons.face,semanticLabel: 'Profile',size:31,color:Color.fromRGBO(33, 39, 189, 1)),
          onTap:()=>{
           // Navigator.pushNamed(context,'/profile',arguments: {'name':box.get('name'),'email':box.get('email'),'profile_pic':box.get('profile_pic')})
          },
          ),
        ],
      ),
      
    );
    }
    );
  }
}