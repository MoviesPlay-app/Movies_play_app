import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutterapp/navigation_bars/bottomnavbar.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:hive/hive.dart';
import 'dart:async';
import 'navigation_bars/bottom_nav_bar_preference.dart';

class PreferencesCinematography extends StatefulWidget {
  @override
  _PreferencesCinematographyState createState() => _PreferencesCinematographyState();
}

class _PreferencesCinematographyState extends State<PreferencesCinematography> {
    var images=[{'name':'Extreme Long Shot','url':'https://s.studiobinder.com/wp-content/uploads/2019/09/Camera-Shot-Guide-Extreme-Wide-Shot-Mad-Mad-Fury-Road-StudioBinder.jpg'},
    {'name':'Long Shot','url':'https://s.studiobinder.com/wp-content/uploads/2019/09/Camera-Shot-Guide-Wide-Shot-The-Martian-StudioBinder.jpeg'},
    {'name':'Full Shot','url':'https://s.studiobinder.com/wp-content/uploads/2019/09/Camera-Shot-Guide-Full-Shot-2-Django-Unchained-StudioBinder.jpg'},
    {'name':'Medium Wide Shot','url':'https://s.studiobinder.com/wp-content/uploads/2019/09/Definitive-Guide-to-Camera-Shots-Medium-Wide-Shot-Usual-Suspects.jpeg'},
    {'name':'Cow boy Shot','url':'https://s.studiobinder.com/wp-content/uploads/2019/04/Different-Types-of-Shots-Cowboy-Shot-Wonderwoman.jpeg'},
    {'name':'Medium Shot','url':'https://s.studiobinder.com/wp-content/uploads/2019/09/Camera-Shot-Guide-Medium-Shot-X-Men-Days-of-Future-Past-StudioBinder.jpeg'},
    {'name':'Medium Close Up Shot','url':'https://s.studiobinder.com/wp-content/uploads/2019/09/Camera-Shot-Guide-Medium-Close-Up-Single-Shot-No-Country-for-Old-Men-StudioBinder.jpeg'},
    {'name':'Close Up','url':'https://s.studiobinder.com/wp-content/uploads/2019/09/Camera-Shot-Guide-Close-Up-Shot-The-Usual-Suspects-StudioBinder.jpeg'},
    {'name':'Extreme Close Up','url':'https://s.studiobinder.com/wp-content/uploads/2018/02/Ultimate-Guide-To-Camera-Shots-Extreme-close-Up-In-X-Men-First-Class.jpeg'},
    ];

    var cinematography_preferences=[];
    //var box=Hive.box('myBox');
    int count=0;
    List<bool> _lights=[false,false,false,false,false,false,false,false,false];

  
  @override
  Widget build(BuildContext context) {
  final Map args = ModalRoute.of(context).settings.arguments as Map;
    var box=Hive.box('User_details');
    box.put('name',args['name']);
    box.put('email',args['email']);
    box.put('phone',args['phone']);
    
    return Scaffold(
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics:BouncingScrollPhysics(),
        child: Container(
           padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
          child:Column(
          children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Choose Favourite Cinematography ',style: TextStyle(fontSize:22,color:Colors.black)),
            ],
            ),
            SizedBox(height:25),
            Container(
            child:GridView.count( 
          crossAxisCount: 2, 
          crossAxisSpacing: 10.0, 
          mainAxisSpacing: 10.0, 
          shrinkWrap: true, 
          scrollDirection: Axis.vertical, 
          physics: BouncingScrollPhysics(),
          children: List.generate(images.length, (index) { 
              return Padding( 
                padding: const EdgeInsets.all(10.0),
                child:Stack( 
                children:<Widget>[Container(
                  decoration: BoxDecoration( 
                     //color:_lights[index]?Colors.blue:Colors.transparent,
                    image: DecorationImage( 
                      image: NetworkImage(images[index]['url']),
                      fit: BoxFit.cover,
                    ), 
                    borderRadius:  
                    BorderRadius.all(Radius.circular(20.0),), 

                  ),
                  
                    
                ),
                Container(
                  alignment: Alignment.center,
                  child:Text(
                    images[index]['name'],
                    style:TextStyle(
                       color: _lights[index]? Colors.blue:Colors.white,
                      fontSize:15,
                    )

                  )
                ),
                GestureDetector(
                  onTap:()=>{
                    setState((){
                      if(_lights[index]==false){
                        if(count<3){
                          _lights[index]=true;
                          count=count+1;
                          cinematography_preferences.add(images[index]['name']);
                          print(cinematography_preferences);
                        }
                        else{
                    Timer timer = Timer(Duration(milliseconds: 3000), (){
                    Navigator.of(context, rootNavigator: true).pop();
                      });
                    showDialog(
                    context:context,
                    builder:(BuildContext context){
                      return AlertDialog(
                        //title:Text('Alert'),
                        content:Text(
                          'Select 3 options'
                        ),
                      );
                    }
                    
                    ).then((value){
  // dispose the timer in case something else has triggered the dismiss.
                    timer?.cancel();
                      timer = null;
                      });
                        }
                      }
                      else{
                        _lights[index]=false;
                        count=count-1;
                        cinematography_preferences.remove(images[index]['name']);
                        print(cinematography_preferences);
                      }
                    })
                    }
                ),
                ],
                ),
                 
              ); 
            },
            ), 
            
        ), 
            ),
            

            
          ],
          ),
           

        )
      ),
      bottomNavigationBar: BottomBarCinematography(

      ),
      
    );
    
  }
  
}

class PreferencesGenre extends StatefulWidget {
  @override
  _PreferencesGenreState createState() => _PreferencesGenreState();
}

class _PreferencesGenreState extends State<PreferencesGenre> {
 
    var images=[
    {'name':'action','url':'assets/icons/action.png'},
    {'name':'adventure','url':'assets/icons/adventure.png'},
    {'name':'animation','url':'assets/icons/animation.png'},
    {'name':'comedy','url':'assets/icons/comedy.png'},
    {'name':'horror','url':'assets/icons/horror (2).png'},
    {'name':'musical','url':'assets/icons/musical (2).png'},
    {'name':'romance','url':'assets/icons/romance (2).png'},
    {'name':'sci-fi','url':'assets/icons/sci-fi.png'},
    ];

    var genre_preferences=[];
    //var box=Hive.box('myBox');
    int count=0;
    List<bool> _lights=[false,false,false,false,false,false,false,false];

  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics:BouncingScrollPhysics(),
        child: Container(
           padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
          child:Column(
          children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Choose Favourite Genre ',style: TextStyle(fontSize:22,color:Colors.black)),
            ],
            ),
            SizedBox(height:20),
            Container(
            child:GridView.count( 
          crossAxisCount: 2, 
          crossAxisSpacing: 10.0, 
          mainAxisSpacing: 10.0, 
          shrinkWrap: true, 
          scrollDirection: Axis.vertical, 
          physics: BouncingScrollPhysics(),
          children: List.generate(images.length, (index) { 
              return Padding( 
                padding: const EdgeInsets.all(10.0),
                  child:Container(
                  decoration: BoxDecoration( 
                    color:_lights[index]?Colors.blue:Colors.transparent,
                    image: DecorationImage(
                      image: AssetImage(images[index]['url']),
                      fit: BoxFit.scaleDown 
                    ),
                    borderRadius:  
                    BorderRadius.all(Radius.circular(20.0),),

                  ),
                  child:GestureDetector(
                  onTap:()=>{
                    setState((){
                      if(_lights[index]==false){
                        if(count<3){
                          _lights[index]=true;
                          count=count+1;
                          genre_preferences.add(images[index]['name']);
                          print(genre_preferences);
                        }
                        else{
                          Timer timer = Timer(Duration(milliseconds: 3000), (){
                    Navigator.of(context, rootNavigator: true).pop();
                      });
                    showDialog(
                    context:context,
                    builder:(BuildContext context){
                      return AlertDialog(
                        //title:Text('Alert'),
                        content:Text(
                          'Select 3 options'
                        ),
                      );
                    }
                    
                    ).then((value){
  // dispose the timer in case something else has triggered the dismiss.
                    timer?.cancel();
                      timer = null;
                      });
                        }
                      }
                      else{
                        _lights[index]=false;
                        count=count-1;
                       genre_preferences.remove(images[index]['name']);
                        print(genre_preferences);
                      }
                    })
                    }
                )
                    
                ),
                /*Container(
                  alignment: Alignment.center,
                  child:Text(
                    images[index]['name'],
                    style:TextStyle(
                       color: _lights[index]? Colors.blue:Colors.white,
                      fontSize:15,
                    )

                  )
                ),*/
                
                 
              ); 
            },), 
        ), 
            ),
            

            
          ],
          ),
           

        )
      ),
      bottomNavigationBar: BottomBarGenre(


      ),
    );
  }

}



class PreferencesLanguage extends StatefulWidget {
  @override
  _PreferencesLanguageState createState() => _PreferencesLanguageState();
}

class _PreferencesLanguageState extends State<PreferencesLanguage> {
 
    var images=[
      {'name':'english','url':'assets/icons/english.png'},
      {'name':'hindi','url':'assets/icons/hindi.png'},
      {'name':'regional','url':'assets/icons/regional.png'},
      {'name':'international','url':'assets/icons/international.png'},
    ];

    var language_preferences=[];
    //var box=Hive.box('myBox');
    int count=0;
    List<bool> _lights=[false,false,false,false];

  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics:BouncingScrollPhysics(),
        child: Container(
           padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
          child:Column(
          children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Choose Favourite Language ',style: TextStyle(fontSize:22,color:Colors.black)),
            ],
            ),
            SizedBox(height:20),
            Container(
            child:GridView.count( 
          crossAxisCount: 2, 
          crossAxisSpacing: 10.0, 
          mainAxisSpacing: 10.0, 
          shrinkWrap: true, 
          scrollDirection: Axis.vertical, 
          physics: BouncingScrollPhysics(),
          children: List.generate(images.length, (index) { 
              return Padding( 
                padding: const EdgeInsets.all(10.0),
                  child:Container(
                  decoration: BoxDecoration( 
                    color:_lights[index]?Colors.blue:Colors.transparent,
                    image: DecorationImage(
                      image: AssetImage(images[index]['url']),
                      fit: BoxFit.scaleDown 
                    ),
                    borderRadius:  
                    BorderRadius.all(Radius.circular(20.0),), 

                  ),
                  child:GestureDetector(
                  onTap:()=>{
                    setState((){
                      if(_lights[index]==false){
                        if(count<3){
                          _lights[index]=true;
                          count=count+1;
                          language_preferences.add(images[index]['name']);
                          print(language_preferences);
                        }
                        else{
                          Timer timer = Timer(Duration(milliseconds: 3000), (){
                    Navigator.of(context, rootNavigator: true).pop();
                      });
                    showDialog(
                    context:context,
                    builder:(BuildContext context){
                      return AlertDialog(
                        //title:Text('Alert'),
                        content:Text(
                          'Select 3 options'
                        ),
                      );
                    }
                    
                    ).then((value){
  // dispose the timer in case something else has triggered the dismiss.
                    timer?.cancel();
                      timer = null;
                      });
                        }
                      }
                      else{
                        _lights[index]=false;
                        count=count-1;
                       language_preferences.remove(images[index]['name']);
                        print(language_preferences);
                      }
                    })
                    }
                )
                    
                ),
                /*Container(
                  alignment: Alignment.center,
                  child:Text(
                    images[index]['name'],
                    style:TextStyle(
                       color: _lights[index]? Colors.blue:Colors.white,
                      fontSize:15,
                    )

                  )
                ),*/
                
                 
              ); 
            },), 
        ), 
            ),
            

            
          ],
          ),
           

        )
      ),
      bottomNavigationBar: BottomBarLanguage(


      ),
    );
  }

}

class PreferencesPlot extends StatefulWidget {
  @override
  _PreferencesPlotState createState() => _PreferencesPlotState();
}

class _PreferencesPlotState extends State<PreferencesPlot> {
 
  var names=[
    'Happy Ending',
    'Sad Ending',
    'Tragedy',
  ];
    var plot_preferences=[];
    //var box=Hive.box('myBox');
    int count=0;
    List<bool> _lights=[false,false,false,false,false,false,false,false,false];

  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics:BouncingScrollPhysics(),
        child: Container(
           padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
          child:Column(
          children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Choose Favourite Plot Style ',style: TextStyle(fontSize:22,color:Colors.black)),
            ],
            ),
            SizedBox(height:20),
            Container(
            child:GridView.count( 
          crossAxisCount: 2, 
          crossAxisSpacing: 10.0, 
          mainAxisSpacing: 10.0, 
          shrinkWrap: true, 
          scrollDirection: Axis.vertical, 
          physics: BouncingScrollPhysics(),
          children: List.generate(names.length, (index) {
              
                return Padding( 
                padding: const EdgeInsets.all(10.0),
                child:Stack( 
                children:<Widget>[
                  Container(
                            
                            decoration: BoxDecoration(
                            
                            gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Colors.blue, Colors.red]),
                            borderRadius: BorderRadius.circular(15.0),),
                            child: Center(
                            child: Text(
                            names[index],
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: _lights[index]? Colors.blue:Colors.white),
                          ),
                        ),
                        
                      ),
                GestureDetector(
                  onTap:()=>{
                    setState((){
                      if(_lights[index]==false){
                        if(count<1){
                          _lights[index]=true;
                          count=count+1;
                          plot_preferences.add(names[index]);
                          print(plot_preferences);
                        }
                        else{
                          Timer timer = Timer(Duration(milliseconds: 3000), (){
                    Navigator.of(context, rootNavigator: true).pop();
                      });
                    showDialog(
                    context:context,
                    builder:(BuildContext context){
                      return AlertDialog(
                        //title:Text('Alert'),
                        content:Text(
                          'Select 1 option'
                        ),
                      );
                    }
                    
                    ).then((value){
  // dispose the timer in case something else has triggered the dismiss.
                    timer?.cancel();
                      timer = null;
                      });
                        }
                      }
                      else{
                        _lights[index]=false;
                        count=count-1;
                        plot_preferences.remove(names[index]);
                        print(plot_preferences);
                      }
                    })
                    }
                ),
                ],
                ),
                 
              ); 
              /*return Padding(
                padding: const EdgeInsets.all(10.0),
                  child:Container(
                    child:Card(
                             elevation: 8,
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            
                                ),
                            child:Container(
                            
                            decoration: BoxDecoration(
                            color: _lights[index]? Colors.blue:Colors.red,
                            gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Colors.blue, Colors.red]),
                            borderRadius: BorderRadius.circular(15.0),),
                            child: Center(
                            child: Text(
                            names[index],
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          ),
                        ),
                        
                      ),
                            
                           
                            
                            
                  /*decoration: BoxDecoration( 
                    color:_lights[index]?Colors.blue:Colors.transparent,
                    image: DecorationImage(
                      image: AssetImage(images[index]['url']),
                      fit: BoxFit.scaleDown 
                    ),
                    borderRadius:  
                    BorderRadius.all(Radius.circular(20.0),), 

                  ),*/
                  
                    ),
                    
                ),
                
                /*Container(
                  alignment: Alignment.center,
                  child:Text(
                    images[index]['name'],
                    style:TextStyle(
                       color: _lights[index]? Colors.blue:Colors.white,
                      fontSize:15,
                    )

                  )
                ),*/
                
              
              );*/
               
            },), 
        ), 
            ),
            

            
          ],
          ),
           

        )
      ),
      bottomNavigationBar: BottomBarPlot(


      ),
    );
  }

}

