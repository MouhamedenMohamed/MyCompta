import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mycompta/New%20Stock/Stock.dart';
import 'package:mycompta/constants/constants.dart';
import 'package:mycompta/ui/signup.dart';

import 'package:mycompta/ui/widgets/Aboutme.dart';

import 'package:mycompta/ui/widgets/homepage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mycompta/ui/widgets/responsive_ui.dart';

import 'ShowMore.dart';

class MyApp1 extends StatefulWidget {
 
  @override
  _MyApp1State createState() => _MyApp1State();
}

class _MyApp1State extends State<MyApp1> {
  Box<Task> tasksBox;
    
  String pathi;
   Color color = Color(0xff0D5657);
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _textEditingControllerprix = TextEditingController();
  TextEditingController _textEditingControllerQte = TextEditingController();
  TextEditingController _textEditingControllerMent = TextEditingController();
 
  
  @override
  void initState() {
    super.initState();
    tasksBox = Hive.box('StockBox');
  }

 void colorA(BuildContext context,Task task){
   setState(() {
    if( color==Colors.blue)color=Color(0xff0D5657);
    else color=Colors.blue; 
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Show(context,task)));
   });
 }

  void onAddTask(String path) {
    if (path!=null) {
      final newTask = Task(_textEditingController.text,_textEditingControllerprix.text, _textEditingControllerQte.text,_textEditingControllerMent.text,path);
      tasksBox.add(newTask);
      Navigator.pop(context);
      _textEditingControllerprix.clear();
      _textEditingControllerQte.clear();
     
      _textEditingControllerMent.clear();
      _textEditingController.clear();
      pathi = null;
      return;
    }
    
  }

  void onUpdateTask(int index, Task task) {
    
    tasksBox.putAt(index, Task(task.title,task.prix,task.qte,task.ment,task.path));
    return;
    
  }








  void onDeleteTask(int index) {
   if(index!=0) tasksBox.deleteAt(index);
   
    return ; 
  
  }

  @override
  Widget build(BuildContext context) {

  double _width;


     _width = MediaQuery.of(context).size.width;
   
   
    return MaterialApp(
            routes: <String, WidgetBuilder>{
              
              'home': (BuildContext context) =>SignInScren(),
               'sell': (BuildContext context) =>SignInScren(),
               'add': (BuildContext context) =>SignInScren(),
              },
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primaryColor: Color(0xff0D3257)),
        home: Scaffold(
        appBar: AppBar(
          actions: [
           BackButton(onPressed:(){Navigator.pop(context);})
          ],
          title: Text('Add Stock'),
          brightness: Brightness.dark,
        ),
        body:ValueListenableBuilder(
                valueListenable: tasksBox.listenable(),
                builder: (context, value, child) {
                  if (tasksBox.length > 0) {
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        final task = tasksBox.get(index);
                        
                        return Card(
                          
                        
                        shadowColor: Colors.yellow,
                          elevation: 8,
                            //child: ArgentCustom(color1,task.title,"ecoutcasc.jpg",task.prix,task.ment,task.qte)
                            child: ListTile(
              title: Text(task.title),
              subtitle: Text(task.qte),
              trailing:Container(decoration: BoxDecoration(color: Colors.white), child: Image.file( File( task.path),width: _width/3 ,)),
              //Container(height:_height/6,
              //width:_width/4,
            //  child:CircleAvatar(child: Image.file( File( task.path),width: _width/4 ,),backgroundColor: Colors.yellow,),
            //  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.yellow),
              
            //  ),
              leading: Text(task.prix),
              isThreeLine: true,
              onLongPress: () => onDeleteTask(index),
              onTap: (){  colorA(context,task);
       
              
              }),
              
              );
                              
                            
                      
                      },
                      itemCount: tasksBox.length,
                      separatorBuilder: (context, index) => Divider(),
                    );
                  } else {
                    return EmptyList();
                  }
                },
              ),
         
        
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff0D3257),
          child: Icon(Icons.add),
          onPressed: () {

                 

showDialog(
            context: context,
            builder: (context) {
              var _textStyle = ts;
                          return AlertDialog(
                           backgroundColor: color2,
                            title: Text('Add New Stock',style: _textStyle),
                            content: Wrap(
                              children: [
                                TextField(
                                  controller: _textEditingController,
                                  decoration: InputDecoration(hintText: "Entrer Name",hintStyle: _textStyle),
                                  autofocus: true,
                                ),
                                TextField(
                                  controller: _textEditingControllerprix,
                                   keyboardType: TextInputType.datetime,
                                  decoration: InputDecoration(hintText: "Entrer Prix",hintStyle: _textStyle),
                                  autofocus: true,
                                ),
                                TextField(
                                  keyboardType: TextInputType.number,
                                  controller: _textEditingControllerQte,
                                  decoration: InputDecoration(hintText: "Entrer Quantite",hintStyle: _textStyle),
                                  autofocus: true,
                                ),
                                TextField(
                                  controller: _textEditingControllerMent,
                                  decoration: InputDecoration(hintText: "Entrer Mention",hintStyle:_textStyle),
                      autofocus: true,
                    ),
                  // ignore: unnecessary_statements
                          TextButton(
                          onPressed:() async {
                          
                        
                          final picker = ImagePicker();
                          final pickedFile = await picker.getImage(source: ImageSource.gallery);

                          if (pickedFile != null) {
                            setState(() {
                             
                              pathi=File(pickedFile.path).path;
                            });
                          }
                          
                  } ,
                  child: Icon(Icons.add_a_photo))
                  ],
                ),
                actions: [
                 
                  TextButton(
                    
                    
                     child: Text('SAVE',style: TextStyle(color: textColor)),
                     onPressed: () async {
                        var ment =_textEditingControllerMent.text;
                        var qte =_textEditingControllerQte.text;
                         var pri =_textEditingControllerprix.text;
                          var tit =_textEditingController.text;
                        if (tit.isNotEmpty &
                            qte.isNotEmpty &
                            ment.isNotEmpty &
                            pri.isNotEmpty 
                            ) {
                          
                          onAddTask(pathi);
                        }
                      },
                     
                     
                     ),
                     TextButton(
                    
                    
                     child: Text('CANCEL',style: TextStyle(color: textColor),),onPressed: (){Navigator.pop(context);},)
                ],
              );
            },
);
          

          }
        ),
      

      ),
    );
  }
}

class EmptyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              child: Icon(Icons.inbox_outlined,
                  size: 80.0, color: Color(0xff0D3257))),
          Container(
            padding: EdgeInsets.only(top: 4.0),
            child: Text(
              "Pas des Stock",
              style: TextStyle(fontSize: 20.0),
            ),
          )
        ],
      ),
    );
  }
}