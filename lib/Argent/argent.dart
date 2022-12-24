import 'dart:ffi';

import 'package:flutter/material.dart';


class Argent extends StatelessWidget {
  var total ;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
        brightness: Brightness.dark,
      ),
      body: Text("$total")
    );
  }
} 