
import 'package:hive/hive.dart';



@HiveType(typeId: 1)
class Transaction {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String prix;

   @HiveField(2)
  final DateTime date;

  Transaction(this.title, this.prix, this.date);

 

  
  
}

