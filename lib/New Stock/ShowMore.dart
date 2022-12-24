 import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mycompta/New%20Stock/Stock.dart';
import 'package:mycompta/constants/constants.dart';

import 'main.dart';

Widget Show(BuildContext context ,Task task) {
    final avatar = Padding(
      padding: EdgeInsets.all(5),
        child: Hero(
        tag: 'logo',
        child: SizedBox(
        height: 160,
            child: Image.file(File(task.path))
      )
    ),
    );
    final description =Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
       
        gradient: LinearGradient(colors: [
         Colors.amber,
        Colors.orange
      ],begin: Alignment.topLeft,
      end: Alignment.centerRight
      )),
      height: MediaQuery.of(context).size.height/1.5,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:[
        Text("Name : ${ task.title}",style: TextStyle(fontSize: 20),textAlign: TextAlign.left,),
         Text("La quantiteé disponible des pieces  : ${ task.qte}",style: TextStyle(fontSize: 20),),
         Text("Prix Par unité : ${ task.prix} ",style: TextStyle(fontSize: 20),),
         Text("La Qualite  : ${ task.ment}",style: TextStyle(fontSize: 20),)
      

      ]
    ),);
    
    final buttonLogout = BackButton(color: Colors.black87,onPressed: () {
         
        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp1()));
      }
    );
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: <Widget>[
              avatar,
              description,
              buttonLogout
            ],
          ),
        ),
      )
    );
  }