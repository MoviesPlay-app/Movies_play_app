import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutterapp/bottomnavbar.dart';
import 'package:slimy_card/slimy_card.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Stack(
       children: <Widget>[
         ClipPath(
           child:Container(
           color:Colors.black.withOpacity(0.8)
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
                                'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(75.0)),
                        boxShadow: [
                          BoxShadow(blurRadius: 7.0, color: Colors.black)
                        ])
         ),
          SizedBox(height:30),
      Text(
        'Name',
        style: TextStyle(
        fontSize: 30.0,
        fontStyle: FontStyle.italic,
        fontFamily: 'Montserrat'),
                ),
        SizedBox(height:30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Icon(Icons.trip_origin, color: Colors.green, size: 18,),
             Text(
               'Online',
               style: TextStyle(
                 fontSize:26
               )
             ),

          ]
          
        )
       ],
     )
    ),
   
       ],
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