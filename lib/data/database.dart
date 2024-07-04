import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{
  List toDoList=[];

  //reference our box
  final _mybox=Hive.box('mybox');

  //run this if the app is opened for the first time
  void createInitialData(){
    toDoList=[
    ['Make Tutorial',false],
    ['Exercise',true]
  ];
  }

  //load the data from the database
  void loadData(){
    toDoList = _mybox.get("TODOLIST");
  }

  //update the database
  void updateDatabase(){
    _mybox.put("TODOLIST", toDoList);
  }
}