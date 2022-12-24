import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mycompta/New%20Stock/Stock.dart';
import 'package:mycompta/New%20Stock/StockAdapter.dart';
import 'package:mycompta/New%20Stock/main.dart';

import 'package:mycompta/constants/constants.dart';
import 'package:mycompta/ui/Common/widgets.dart';
import 'package:mycompta/ui/widgets/responsive_ui.dart';
import 'package:path_provider/path_provider.dart';

import '../signup.dart';
import 'Aboutme.dart';
import 'dashboard.dart';

Widget CustomButton(String name,Color color){

return RaisedButton(
 onPressed: () {
       },
  color: color,
  child: Text(name)
);



}

class SignInScren extends StatefulWidget {
  @override
  _SignInScrenState createState() => _SignInScrenState();
}

class _SignInScrenState extends State<SignInScren> {

  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  GlobalKey<FormState> _key = GlobalKey();



  @override
  Widget build(BuildContext context) {
     _height = MediaQuery.of(context).size.height;
     _width = MediaQuery.of(context).size.width;
     _pixelRatio = MediaQuery.of(context).devicePixelRatio;
     _large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
     _medium =  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
     void stock() async{ 
       WidgetsFlutterBinding.ensureInitialized();
    var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('StockBox');
       
       Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp1()));
}
      void Argent(){
       Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard()));
       }
       void  Vendr(){
        return;
       }
    return Material(
      child: Scaffold(
        appBar: AppBar(backgroundColor:color2,
        shadowColor: color2,),
          drawer: Drawer(
child: ListView(
children: [
  
  ListTile(
leading: const Icon(Icons.people),
title: const Text("Profile"),
onTap: () {
 Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutMe(context)));

},
),
ListTile(
leading: const Icon(Icons.train),
title: const Text("Paramètres"),
onTap: () {},
),
ListTile(
leading: const Icon(Icons.train),
title: const Text("Déconnexion"),
onTap: () {
  setState(() {
  
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
  });
},
)
],
)
),
          body: Container(
          height: _height,
          width: _width,
          padding: EdgeInsets.only(bottom: 5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
               clipShape(context,_height,_large,_medium,_width),
               
                Container(
               
                   
                  child: Align(alignment: Alignment.center,
                  widthFactor: 0.95,
                  heightFactor: 0.75,
                  child:Wrap(
                    spacing: 20,
                  children: [
                      SizedBox(height:30),
                //  buttonCustom(Argent,context,_height,_large,_medium,_width,"Argent"),
                //  buttonCustom(Stock,context,_height,_large,_medium,_width,"Stock"),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child :Wrap(
                      spacing: 10,
                    children: [
                    SquareContainer(Argent,'Comptabilité',Icons.monetization_on),
                    SquareContainer(stock,'Stock',Icons.trending_up),
                    
                  ],))
                     

                 
                  
                  ],
                  
                  ) ,
                  ),),
               
                
              ],
            ),
          ),
        ),
      ),
    );
  }




}




// ignore: non_constant_identifier_names
Widget SquareContainer(Function suivant,String text,IconData icon){
return Container(
height:130,
width: 100,
decoration:  BoxDecoration(color: Colors.white, border: Border.all(
                                color: Colors.grey.withOpacity(0.5), width: 1.0),
borderRadius: BorderRadius.circular(12)
),
child:Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
 children:[
     IconButton(icon: Icon(icon,size: 40,color: Colors.orange,), onPressed: suivant),
   
     Text(text,style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),),
   
   ],),

 

);



}

