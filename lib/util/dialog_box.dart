import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({super.key,required this.controller,required this.onSave,required this.onCancel});
  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[400],
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(border: OutlineInputBorder(),hintText: 'Add a New Task..'),
          ),
            Row( 
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(onPressed: onSave, child: const Text('Save',style: TextStyle(color: Colors.blue)),),
                MaterialButton(onPressed: onCancel, child: const Text('Cancel',style: TextStyle(color: Colors.red)),),
              ],
            )
        ],)
      ),
    );
  }
}