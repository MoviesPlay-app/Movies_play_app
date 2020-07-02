import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutterapp/bottomnavbar.dart';
import 'package:slimy_card/slimy_card.dart';
//import 'package:awesome_card/awesome_card.dart';
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
  _UserDisplayHome createState() => _UserDisplayHome();
}

class _UserDisplayHome extends State<UserDisplayHome> with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Color backgroundColor = Color(0xFFFAFAFA);
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
        ],
      ),
      bottomNavigationBar: BottomBar(

      ),
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/userhome');
                },
                child:Text("Dashboard", style: TextStyle(color: Colors.black, fontSize: 22)),
  
                ),
              
                SizedBox(height: 14),
                FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/userhome');
                },
                child:Text("Messages", style: TextStyle(color: Colors.black, fontSize: 22)),
  
                ),
                SizedBox(height: 14),
                FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
                child:Text("Profile", style: TextStyle(color: Colors.black, fontSize: 22)),
  
                ),
                SizedBox(height: 14),
               FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
                child:Text("Signout", style: TextStyle(color: Colors.black, fontSize: 22)),
  
                ),
                SizedBox(height: 14),
                FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/userhome');
                },
                child:Text("About", style: TextStyle(color: Colors.black, fontSize: 22)),
  
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          //borderRadius: BorderRadius.all(Radius.circular(40)),
          elevation: 8,
          color: backgroundColor,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        child: Icon(Icons.menu, color: Colors.black),
                        onTap: () {
                          setState(() {
                            if (isCollapsed)
                              _controller.forward();
                            else
                              _controller.reverse();

                            isCollapsed = !isCollapsed;
                          });
                        },
                      ),
                      Text("Personalised List", style: TextStyle(fontSize: 24, color: Colors.black)),
                      Icon(Icons.settings, color: Colors.black),
                    ],
                  ),
                  SizedBox(height: 50),
                      Container(
                      height: 200,
                      child: PageView(
                        controller: PageController(initialPage: 0),
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        pageSnapping: true,
                        children: <Widget>[
                              /*SlimyCard(
                              color: Colors.red,
                              width:200,
                              topCardHeight:150,
                              bottomCardHeight: 100,
                              borderRadius: 15,
                              slimeEnabled:true,
                            ),*/
                              
                            
                            
                           
                            
                          
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8 ),
                            //color: Colors.blueAccent,
                            width: 50,
                            
                            child:Card(
                             elevation: 8,
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            
                                ),
                            child:Container(
                            decoration: BoxDecoration(
                            gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Colors.blue, Colors.red]),
                            borderRadius: BorderRadius.circular(15.0),),
                            child: Center(
                            child: Text(
                            'Cinematography',
                            style: TextStyle(
                              fontSize: 48.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          ),
                        ),
                      ),
                            
                           
                            
                            ),
                            
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8 ),
                            //color: Colors.blueAccent,
                            width: 50,
                            
                            child:Card(
                             elevation: 8,
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            
                                ),
                            child:Container(
                            decoration: BoxDecoration(
                            gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Colors.blue, Colors.red]),
                            borderRadius: BorderRadius.circular(15.0),),
                            child: Center(
                            child: Text(
                            'Genre',
                            style: TextStyle(
                              fontSize: 48.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          ),
                        ),
                      ),
                            
                           
                            
                            ),
                            
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8 ),
                            //color: Colors.blueAccent,
                            width: 50,
                            
                            child:Card(
                             elevation: 8,
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            
                                ),
                            child:Container(
                            decoration: BoxDecoration(
                            gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Colors.blue, Colors.red]),
                            borderRadius: BorderRadius.circular(15.0),),
                            child: Center(
                            child: Text(
                            'Cast',
                            style: TextStyle(
                              fontSize: 48.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          ),
                        ),
                      ),
                            
                           
                            
                            ),
                            
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8 ),
                            //color: Colors.blueAccent,
                            width: 50,
                            
                            child:Card(
                             elevation: 8,
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            
                                ),
                            child:Container(
                            decoration: BoxDecoration(
                            gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Colors.blue, Colors.red]),
                            borderRadius: BorderRadius.circular(15.0),),
                            child: Center(
                            child: Text(
                            'Plot',
                            style: TextStyle(
                              fontSize: 48.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          ),
                        ),
                      ),
                            
                           
                            
                            ),
                            
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8 ),
                            //color: Colors.blueAccent,
                            width: 50,
                            
                            child:Card(
                             elevation: 8,
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            
                                ),
                            child:Container(
                            decoration: BoxDecoration(
                            gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Colors.blue, Colors.red]),
                            borderRadius: BorderRadius.circular(15.0),),
                            child: Center(
                            child: Text(
                            'Language',
                            style: TextStyle(
                              fontSize: 48.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          ),
                        ),
                      ),
                            
                           
                            
                            ),
                            
                          ),
                        ],
                      ),
                      ),
                  
                  SizedBox(height: 70),
                  Text("Cinematography", style: TextStyle(color: Colors.black, fontSize: 20),),
                  SizedBox(height:10),
                  Container(
                    height: 200,
                    child: PageView(
                      controller: PageController(viewportFraction:0.5),
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      children: <Widget>[
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.redAccent,
                          width: 100,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.blueAccent,
                          width: 100,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.greenAccent,
                          width: 100,
                        ),
                    ],)
                  ),
                  SizedBox(height:40),
                  Text("Genre", style: TextStyle(color: Colors.black, fontSize: 20),),
                  SizedBox(height:10),
                  Container(
                    height: 200,
                    child: PageView(
                      controller: PageController(viewportFraction:0.5),
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      children: <Widget>[
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.redAccent,
                          width: 100,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.blueAccent,
                          width: 100,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.greenAccent,
                          width: 100,
                        ),
                    ],)
                  ),

                  SizedBox(height:40),
                  Text("Cast", style: TextStyle(color: Colors.black, fontSize: 20),),
                  SizedBox(height:10),
                  Container(
                    height: 200,
                    child: PageView(
                      controller: PageController(viewportFraction:0.5),
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      children: <Widget>[
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.redAccent,
                          width: 100,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.blueAccent,
                          width: 100,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.greenAccent,
                          width: 100,
                        ),
                    ],)
                  ),
                  SizedBox(height:40),
                  Text("Language", style: TextStyle(color: Colors.black, fontSize: 20),),
                  SizedBox(height:10),
                  Container(
                    height: 200,
                    child: PageView(
                      controller: PageController(viewportFraction:0.5),
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      children: <Widget>[
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.redAccent,
                          width: 100,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.blueAccent,
                          width: 100,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.greenAccent,
                          width: 100,
                        ),
                    ],)
                  ),
                  SizedBox(height:40),
                  Text("Plot", style: TextStyle(color: Colors.black, fontSize: 20),),
                  SizedBox(height:10),
                  Container(
                    height: 200,
                    child: PageView(
                      controller: PageController(viewportFraction:0.5),
                      scrollDirection: Axis.horizontal,
                      physics:BouncingScrollPhysics(),
                      children: <Widget>[
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.redAccent,
                          width: 100,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.blueAccent,
                          width: 100,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.greenAccent,
                          width: 100,
                        ),
                    ],)
                  )
                  
                  /*SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics:BouncingScrollPhysics(),
                  child:ListView.separated(
                    shrinkWrap: true,
                      physics:BouncingScrollPhysics(),
                      itemBuilder: (context, position) {
                    return ListTile(
                      title: Text(position.toString()),
                      subtitle: Text("Apple"),
                      trailing: Text("-2900"),
                    );
                  }, separatorBuilder: (context, position) {
                    return Divider(height: 16);
                  }, itemCount: 10)
                  ),*/
                ],
              ),
            ),
            
          ),
          
        ),
      ),
      
    );
  }
}