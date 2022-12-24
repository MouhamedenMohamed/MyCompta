




import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive/hive.dart';


final String SIGN_IN = 'signin';
final String RecoverYour_Password='recover';
final String SIGN_UP ='signup';
final String SPLASH_SCREEN ='splashscreen';
final Color myFirstcolor=Colors.red;
final Color color1=Colors.red;
final Color buttonColor=Colors.pink;
final Color color2=Colors.blue[300];
final Color colorStock=Colors.orange;
final Color textColor =Colors.white;
var db = Hive.box('StockBox');
final double total=0;
final TextStyle  ts = TextStyle(color: buttonColor );
var ident = [];
//List<int> l = new List<int>.generate(db.length, double.parse(db.get(i).prix) =>db.get(i+1).prix );
List<int> lmed = new List<int>.generate(10, (i) => i * i);