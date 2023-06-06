import 'package:flutter/material.dart';
import 'package:to_do/utilities/my_buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
   DialogBox({Key? key, required this.controller, required this.onSave, required this.onCancel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        decoration: BoxDecoration(
          // color: Colors.yellow,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             Text('Create New Task'),
             SizedBox(height: 20,),
            //get user input
            TextField(
              controller: controller,
              decoration:  InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Task Name',
              ),
            ),
            // two buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(text: "Save", onPressed:onSave,),
                // SizedBox(width: 10,),
                MyButton(text: "Cancel", onPressed:onCancel,),
              ],
            )
          ],
        ),

      ),
    );
  }
}
