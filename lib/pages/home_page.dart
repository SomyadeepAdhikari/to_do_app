import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/util/dialog_box.dart';
import 'package:to_do_app/util/to_do_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the hive box
  final _mybox=Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  final _controller=TextEditingController();

  @override
  void initState() {

    //If this is the first time ever opening the app,then create default data
    if(_mybox.get('TODOLIST')== null){
      db.createInitialData();
    }else{
      db.loadData();
    }
    super.initState();
  }
  

  void checkBoxChanged(bool? value,int index){
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }
  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }
  void saveNewTask(){
    setState(() {
      db.toDoList.add([_controller.text,false]);
      _controller.clear();
    });
    db.updateDatabase();
    Navigator.of(context).pop();
  }
  void createNewTask(){
    showDialog(context: context, builder: (context){
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: () => Navigator.of(context).pop(),
        );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text('To Do',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(onPressed: createNewTask,child: const Icon(Icons.add),),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context,index){
          return ToDoTile(
            taskName: db.toDoList[index][0], 
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value,index),
            deleteFunction: (context) => deleteTask(index),
          );
        })
    );
  }
}