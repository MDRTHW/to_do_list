import 'package:hive/hive.dart';

class ToDoDatabase{

  List toDoList =[];
  //reference to box
  final _myBox = Hive.box('todo');

  //run this method if the 1st time the app is opened
  void createInitialData(){
    toDoList = [
      ['Buy Milk', false,  'xx/xx/xxxx'],
      ['Buy Eggs', false, 'xx/xx/xxxx'],
      ['Buy Bread', false, 'xx/xx/xxxx'],
    ];
  }

  //load data from database
  void loadData(){
    toDoList = _myBox.get("TODOLIST");
  }


  //update the database
  void updateDatabase(){
    _myBox.put("TODOLIST", toDoList);
  }

}