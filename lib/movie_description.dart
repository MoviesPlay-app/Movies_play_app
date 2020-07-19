import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutterapp/navigation_bars/bottomnavbar.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:hive/hive.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:share/share.dart';

class MovieDescription extends StatefulWidget {
  @override
  _MovieDescriptionState createState() => _MovieDescriptionState();
}

class _MovieDescriptionState extends State<MovieDescription> {
  bool nowshowing=true;
  String title;
  String genre;
  String language;
  String poster;
  String actors;
  String plot;
  String release_date;
  String ratings;
  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments as Map;
    title=args['result']['Title'];
    genre=args['result']['Genre'];
    language=args['result']['Language'];
    poster=args['result']['Poster'];
    actors=args['result']['Actors'];
    plot=args['result']['Plot'];
    release_date=args['result']['Released'];
    ratings=args['result']['Ratings'][1]['Value'];
    return ListView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      children: <Widget>[
      Flexible(
      child:Container(
        //padding: const EdgeInsets.only(top: 48),
        child: Material(
          elevation: 5.0,
          child: new Column(
            
            children: <Widget>[
              SizedBox(height:30),
              Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        child: Icon(Icons.arrow_back, color: Colors.black),
                        onTap: () {
                          Navigator.pushNamed(context, '/userhome');
                        },
                      ),
                      Flexible(
                      child:Text(title, style: TextStyle(fontSize: 24, color: Colors.black)),
                      ),
                    InkWell(
                      child:Icon(Icons.share, color: Colors.black),
                      onTap:(){
                        Share.share(poster);
                      }
                    )
                    ],
                  ),
              SizedBox(height:20),
              Image.network(
                  poster),
              SizedBox(height:50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                  child:Text(
                    title,
                    style:TextStyle(
                      fontSize:25,
                    )
                    )
                  ),
                ]
      
              ),
              SizedBox(height:20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    genre,
                    style:TextStyle(
                      fontSize:15,
                    )
                    )
                ]
      
              ),
              SizedBox(height:20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    language,
                    style:TextStyle(
                      fontSize:15,
                    )
                    )
                ]
      
              ),
              SizedBox(height:20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    release_date,
                    style:TextStyle(
                      fontSize:15,
                    )
                    )
                ]
      
              ),
              SizedBox(height:20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
               Container(
                 child:Image(
                   image:AssetImage('assets/icons/tomato_ratings.jpg'),
                   fit:BoxFit.cover,
                 ),
                 height:35,
                 width:35,
               ),
               SizedBox(width:20),
                Text(
                  ratings,
                  style:TextStyle(
                    fontSize:15,
                  )
                )
              ],),
              SizedBox(height:20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                  width:300,
                  child:Flexible(
                  child:Text(
                    actors,
                    overflow: TextOverflow.clip,
                    style:TextStyle(
                      fontSize:15
                    ),
                    textAlign:TextAlign.justify,
                    )
                  )
                  )
                ]
      
              ),
              SizedBox(height:20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width:300,
                  child:Flexible(
                  child:Text(
                    plot,
                    style:TextStyle(
                      fontSize:15,
                    ),
                    textAlign:TextAlign.justify,
                    )
                  ),
                  )
                ]
      
              ),
              SizedBox(height:85),
              Row(
                children: <Widget>[
                ]
              )
              /*new Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(top: 20.0),
                    width: 220.0,
                    decoration: new BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: new BorderRadius.circular(5.0)),
                    height: 480.0,
                    child:Row(

                    )
                  )
              ),*/
                   /* child: (nowshowing)
                        ? new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new GestureDetector(
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              width: 110.0,
                              decoration: new BoxDecoration(
                                  color: Colors.white,
                                  border: new Border.all(
                                      color: Colors.grey.shade400),
                                  borderRadius: new BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      bottomLeft: Radius.circular(5.0))),
                              child:
                              new Center(child: Text("Now Showing")),
                            ),
                            onTap: () {
                              setState(() {
                                nowshowing = true;
                              });
                            },
                          ),
                          new GestureDetector(
                              child: Container(
                                width: 110.0,
                                padding: EdgeInsets.all(10.0),
                                decoration: new BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: new BorderRadius.only(
                                        topRight: Radius.circular(5.0),
                                        bottomRight:
                                        Radius.circular(5.0))),
                                child: new Center(
                                    child: Text("Coming Soon")),
                              ),
                              onTap: () {
                                setState(() {
                                  nowshowing = false;
                                });
                              })
                        ])
                        : new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new GestureDetector(
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            width: 110.0,
                            decoration: new BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: new BorderRadius.only(
                                    topLeft: Radius.circular(5.0),
                                    bottomLeft: Radius.circular(5.0))),
                            child: new Center(child: Text("Now Showing")),
                          ),
                          onTap: () {
                            setState(() {
                              nowshowing = true;
                            });
                          },
                        ),
                        new GestureDetector(
                            child: Container(
                              width: 110.0,
                              padding: EdgeInsets.all(10.0),
                              decoration: new BoxDecoration(
                                  border: new Border.all(
                                      color: Colors.grey.shade400),
                                  color: Colors.white,
                                  borderRadius: new BorderRadius.only(
                                      topRight: Radius.circular(5.0),
                                      bottomRight: Radius.circular(5.0))),
                              child:
                              new Center(child: Text("Coming Soon")),
                            ),
                            onTap: () {
                              setState(() {
                                nowshowing = false;
                              });
                            }),
                      ],
                    ),
                  )),*/
              /*(nowshowing)
                  ? new Container(
                padding: EdgeInsets.only(
                    top: 20.0, left: 20.0, right: 20.0, bottom: 20.0),
                child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Container(
                          width: 100.0,
                          child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Icon(Icons.equalizer),
                                new Text("Filters")
                              ])),
                      new Container(
                        height: 30.0,
                        decoration: new BoxDecoration(
                            border: new BorderDirectional(
                                start: BorderSide(
                                    color: Colors.grey.shade500))),
                      ),
                      new Container(
                          width: 100.0,
                          child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Icon(Icons.movie),
                                new Text("Cinemas")
                              ])),
                    ]),
              )
                  : new Container(
                height: 30.0,
              )*/
            ],
          ),
        ),
      ),
      ),
      Container(
        child: Material(
          elevation: 5.0,
          child: new Column(
            children: <Widget>[
             // new Image.network(
                //  "https://i0.wp.com/www.socialnews.xyz/wp-content/uploads/2018/10/31/Zero-Movie-New-Poster-.jpg?resize=1024%2C576&quality=90&zoom=1&ssl=1"),
              /*new Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(top: 20.0),
                    width: 220.0,
                    decoration: new BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: new BorderRadius.circular(5.0)),
                    height:500,
                    child: (nowshowing)
                        ? new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new GestureDetector(
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              width: 110.0,
                              decoration: new BoxDecoration(
                                  color: Colors.white,
                                  border: new Border.all(
                                      color: Colors.grey.shade400),
                                  borderRadius: new BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      bottomLeft: Radius.circular(5.0))),
                              child:
                              new Center(child: Text("Now Showing")),
                            ),
                            onTap: () {
                              setState(() {
                                nowshowing = true;
                              });
                            },
                          ),
                          new GestureDetector(
                              child: Container(
                                width: 110.0,
                                padding: EdgeInsets.all(10.0),
                                decoration: new BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: new BorderRadius.only(
                                        topRight: Radius.circular(5.0),
                                        bottomRight:
                                        Radius.circular(5.0))),
                                child: new Center(
                                    child: Text("Coming Soon")),
                              ),
                              onTap: () {
                                setState(() {
                                  nowshowing = false;
                                });
                              })
                        ])
                        : new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new GestureDetector(
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            width: 110.0,
                            decoration: new BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: new BorderRadius.only(
                                    topLeft: Radius.circular(5.0),
                                    bottomLeft: Radius.circular(5.0))),
                            child: new Center(child: Text("Now Showing")),
                          ),
                          onTap: () {
                            setState(() {
                              nowshowing = true;
                            });
                          },
                        ),
                        new GestureDetector(
                            child: Container(
                              width: 110.0,
                              padding: EdgeInsets.all(10.0),
                              decoration: new BoxDecoration(
                                  border: new Border.all(
                                      color: Colors.grey.shade400),
                                  color: Colors.white,
                                  borderRadius: new BorderRadius.only(
                                      topRight: Radius.circular(5.0),
                                      bottomRight: Radius.circular(5.0))),
                              child:
                              new Center(child: Text("Coming Soon")),
                            ),
                            onTap: () {
                              setState(() {
                                nowshowing = false;
                              });
                            }),
                      ],
                    ),
                  )),*/
              /*(nowshowing)
                  ? new Container(
                padding: EdgeInsets.only(
                    top: 20.0, left: 20.0, right: 20.0, bottom: 20.0),
                child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Container(
                          width: 100.0,
                          child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Icon(Icons.equalizer),
                                new Text("Filters")
                              ])),
                      new Container(
                        height: 30.0,
                        decoration: new BoxDecoration(
                            border: new BorderDirectional(
                                start: BorderSide(
                                    color: Colors.grey.shade500))),
                      ),
                      new Container(
                          width: 100.0,
                          child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Icon(Icons.movie),
                                new Text("Cinemas")
                              ])),
                    ]),
              )
                  : new Container(
                height: 30.0,
              )*/
            ],
          ),
        ),
      )
      /*(nowshowing)
          ? new Padding(
          padding: EdgeInsets.only(top: 10.0))
          : new Padding(
          padding: EdgeInsets.only(top: 10.0)),*/
    ]);
  }
}
