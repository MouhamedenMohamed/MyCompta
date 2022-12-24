import 'package:flutter/material.dart';
import 'package:mycompta/constants/constants.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final avatar = Padding(
      padding: EdgeInsets.all(20),
        child: Hero(
        tag: 'logo',
        child: SizedBox(
        height: 160,
            child: Text("Hello ${ident[0]}\nhh your pass word is ${ident[1]}")
      )
    ),
    );
    final description = Padding(
      padding: EdgeInsets.all(10),
      child: RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          text: 'you don\'t haveto cry ',
                    style: TextStyle(color: Colors.black, fontSize: 20)
        ),
      ),
    );
    final buttonLogout = FlatButton(
      child: Text('Logout', style: TextStyle(color: Colors.black87, fontSize: 16),),
      onPressed: () {

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
}