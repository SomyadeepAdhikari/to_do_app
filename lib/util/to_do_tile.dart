import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  ToDoTile({super.key, required this.taskName, required this.taskCompleted,required this.onChanged,required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:20.0,top:20,right: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(), 
          children: [SlidableAction(
          onPressed: deleteFunction,
          icon: Icons.delete,
          backgroundColor: Colors.red.shade600,
          borderRadius: BorderRadius.circular(12)
        )]),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.yellow
          ),
          child: Row(
            children: [
              Checkbox(value: taskCompleted, onChanged: onChanged,activeColor: Colors.black,),
              Text(taskName,
                style: TextStyle(decoration: taskCompleted?TextDecoration.lineThrough:TextDecoration.none),),
            ],
          ),
        ),
      ),
    );
  }
}