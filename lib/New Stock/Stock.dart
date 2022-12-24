
import 'package:hive/hive.dart';



@HiveType(typeId: 1)
class Task {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String prix;

   @HiveField(2)
  final String qte;

   @HiveField(3)
  final String ment;
  
   @HiveField(4)
  final String path;
   
  

  
  
  Task(this.title,  this.prix, this.qte, this.ment, this.path);
}


@HiveType(typeId: 2)
class Categorie {
   @HiveField(0)
  final String name;
  Categorie(this.name);
  
  }
