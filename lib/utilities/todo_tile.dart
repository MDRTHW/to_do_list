import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {

  final String dateTime;
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;


   ToDoTile({
     Key? key,
     required this.taskName,
     required this.taskCompleted,
     required this.dateTime,
     this.onChanged,
     required this.deleteFunction,

   }) : super(key: key );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
      child: Slidable(
        endActionPane:  ActionPane(
          motion:  StretchMotion(),
          children: [
            SlidableAction(
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              onPressed: deleteFunction,
              borderRadius: BorderRadius.circular(10),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0,top: 3, bottom: 10.0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  // height: 10,
                  // color: Colors.white,
                  child: Text(dateTime,
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
                Row(
                  children: [
                    //chjeckbox
                    Checkbox(
                      value: taskCompleted,
                      onChanged: onChanged,
                      activeColor: Colors.black,
                    ),

                    //task name
                    Text(
                      taskName,
                      style:
                      TextStyle(
                        decoration: taskCompleted ? TextDecoration.lineThrough: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(10),
          )
        ),
      ),
    );

  }
}
