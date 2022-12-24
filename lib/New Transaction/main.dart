import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:mycompta/New%20Transaction/Transaction.dart';
import 'package:mycompta/New%20Transaction/TransactionAdapter.dart';
import 'package:mycompta/constants/constants.dart';
import 'package:path_provider/path_provider.dart';

void main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();
    var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter(TransactionAdapter());
  await Hive.openBox<Transaction>('transaction');
  runApp(TransactionHomePage());
}
class TransactionHomePage extends StatefulWidget {
  @override
  _TransactionHomePageState createState() => _TransactionHomePageState();
}

class _TransactionHomePageState extends State<TransactionHomePage> {
  Box<Transaction> transaction;
    
  String pathi;
   Color color = Color(0xff0D5657);
  TextEditingController _textEditingControllertitle = TextEditingController();
  TextEditingController _textEditingControllerprix = TextEditingController();


   @override
  void initState() {
    super.initState();
    transaction = Hive.box('transaction');
  }

    void onAddTransaction() {
    
      final newTransaction = Transaction(_textEditingControllertitle.text,_textEditingControllerprix.text, DateTime.now());
      transaction.add(newTransaction);
      Navigator.pop(context);
      _textEditingControllerprix.clear();
      _textEditingControllertitle.clear();
  
      
      return;
    
    
  }

  void onDeleteTransaction(int index) {
   if(index!=0) transaction.deleteAt(index);
   //TO DO red 3nak lva8a yk3mak
    return ; 
  
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            
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
                valueListenable: transaction.listenable(),
                builder: (context, value, child) {
                  if (transaction.length > 0) {
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        final task = transaction.get(index);
                        
                        return Card(
                          
                        
                        shadowColor: Colors.yellow,
                          elevation: 8,
                            //child: ArgentCustom(color1,task.title,"ecoutcasc.jpg",task.prix,task.ment,task.qte)
                            child: ListTile(
              title: Text(task.title),
              subtitle: Text(task.prix),
             
              //Container(height:_height/6,
              //width:_width/4,
            //  child:CircleAvatar(child: Image.file( File( task.path),width: _width/4 ,),backgroundColor: Colors.yellow,),
            //  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.yellow),
              
            //  ),
              leading: Text(task.prix),
              isThreeLine: true,
              onLongPress: () => onDeleteTransaction(index),
              onTap: (){ 
       
              
              }),
              
              );
                              
                            
                      
                      },
                      itemCount: transaction.length,
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
                                  controller: _textEditingControllertitle,
                                  decoration: InputDecoration(hintText: "Enter Title",hintStyle: _textStyle),
                                  autofocus: true,
                                ),
                                TextField(
                                  controller: _textEditingControllerprix,
                                   keyboardType: TextInputType.datetime,
                                  decoration: InputDecoration(hintText: "Enter Prix",hintStyle: _textStyle),
                                  autofocus: true,
                                ),
                                
                  // ignore: unnecessary_statements
                        
                
                  ],
                ),
                actions: [
                 
                  TextButton(
                    
                    
                     child: Text('SAVE',style: TextStyle(color: textColor)),
                     onPressed: () async {
                        var ment =_textEditingControllerprix.text;
                        var qte =_textEditingControllertitle.text;
                         
                        if (
                            qte.isNotEmpty &
                            ment.isNotEmpty 
                            
                            ) {
                          
                          onAddTransaction();
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
              "Don't have any Stocks",
              style: TextStyle(fontSize: 20.0),
            ),
          )
        ],
      ),
    );
  }
}