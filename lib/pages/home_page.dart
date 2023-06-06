import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do/utilities/dialog_box.dart';
import 'package:to_do/utilities/todo_tile.dart';

import '../data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //reference the box
  final _myBox = Hive.box('todo');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    //if this is the 1st time the app is opened
    if(_myBox.isEmpty){
      db.createInitialData();

    }
    else{
      //if already have data
      db.loadData();
    }
    super.initState();
  }

  //text controller
  final _controller = TextEditingController();




  //checkbox was taped
  void checkBoxChnaged(bool? value, int index){
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  //save new task
  void saveNewTask(){
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    db.updateDatabase();
    Navigator.pop(context);
  }
  //create new task
  void createNewTask(){
    String newTaskName = '';
    showDialog(
        context: context,
        builder: (BuildContext context){
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: (){
              Navigator.pop(context);
              _controller.clear();
            },

          );
        }
    );
  }

  // delete task
  void deleteTask(int index){
  setState(() {
    db.toDoList.removeAt(index);
  });
  db.updateDatabase();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Center(child: const Text('TO DO')),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
        backgroundColor: Colors.yellow,
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
          itemBuilder: (context,index){
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChnaged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
          }
      ),

      );
  }
}
