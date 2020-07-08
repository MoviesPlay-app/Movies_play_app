import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutterapp/navigation_bars/bottomnavbar.dart';
import 'package:slimy_card/slimy_card.dart';
import 'auth.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    String profile_pic;
     final Map args = ModalRoute.of(context).settings.arguments as Map;
     print('c');
     print(args['name']);
     if(args['profile_pic']==null){
       profile_pic='https://moonvillageassociation.org/wp-content/uploads/2018/06/default-profile-picture1.jpg';
     }
     else{
       profile_pic=args['profile_pic'];
     }
    return Scaffold(
     body: Container(
       padding:const EdgeInsets.only(left: 10, right: 5),
     child:Stack(
       children: <Widget>[
         ClipPath(
           child:Container(
           color:Colors.blue.withOpacity(0.8)
           ),
           clipper: GetClipper(),
         ),
         Positioned(
           width: 350.0,
            top: MediaQuery.of(context).size.height / 5,
            child: Column(
              children: <Widget>[
                Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                            image: NetworkImage(
                                profile_pic),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(75.0)),
                        boxShadow: [
                          BoxShadow(blurRadius: 7.0, color: Colors.black)
                        ])
         ),
          SizedBox(height:70),
      Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      Text(
        args['name'].toUpperCase(),
        style: TextStyle(
        fontSize: 35.0,

        //fontStyle: FontStyle.italic,
        //fontFamily: 'Montserrat'
        ),
                ),
      ],
      ),
        SizedBox(height:30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Icon(Icons.trip_origin, color: Colors.green, size: 13,),
             Text(
               'Online',
               style: TextStyle(
                 fontSize:18
               )
             ),

          ]
        ),
        SizedBox(height: 50,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
            '125',
            style: TextStyle(
              fontSize:20
            )

            ),
            Text(
            '25',
            style: TextStyle(
              fontSize:20
            )

            ),
            Text(
            '10',
            style: TextStyle(
              fontSize:20
            )

            ),
          ],
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Followers',
                style: TextStyle(
                  fontSize: 22,
                )
              ),
              Text(
                'Following',
                style: TextStyle(
                  fontSize: 22,
                )
              ),
              Text(
                'Posts',
                style: TextStyle(
                  fontSize: 22,
                )
              ),
            ],
          ),
          SizedBox(height:50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Login().googleSignOut();
                  Navigator.pushNamed(context, '/login');
                },
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            
              /*decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),*/
              shape:RoundedRectangleBorder(
              borderRadius:BorderRadius.circular(20.0),
              side:BorderSide(color: Colors.blue),
              ),

              child: const Text(
                'Logout', 
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  )
                ),
              ),
            ],
          ),
       ],
     )
    ),
   
       ],
     ),
     ),
    );
  }
}

class GetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size){
    var path=new Path();
    path.lineTo(0.0, size.height/2.0);
    path.lineTo(size.width+125,0.0);
    path.close();
    return path;

  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({@required Color color, @required double radius}) : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset = offset + Offset(cfg.size.width / 2, cfg.size.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}