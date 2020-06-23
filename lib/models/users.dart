import 'dart:html';

class User{
  String id;
  String email;
  String name;
  int phone;
  Map<String,String> preferences;
  List<String> references;
  List<String> reviews;
  Geolocation loc;
  User({this.id,this.email,this.name,this.phone,this.preferences,this.references,this.loc});
  User.fromMap(Map snapshot,String id) :

  id=id ?? '' ,
  name=snapshot['Name'] ?? '',
  email =snapshot['Email'] ?? '',
  phone=snapshot['Phone'] ?? '',
  preferences=snapshot['Preferences'] ?? '',
  references=snapshot['References'] ?? '',
  reviews=snapshot['Reviews'] ?? '',
  loc=snapshot['Location'];

  toJson(){
    return{
      'Name' : name,
      'Email' : email, 
      'Phone' : phone,
      'Preferences' : preferences,
      'References' : references,
      'Reviews' : reviews,
      'Location' : loc
    };
  }
  




 }