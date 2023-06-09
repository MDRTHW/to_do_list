import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do/pages/home_page.dart';
import 'package:to_do/pages/loading_screen.dart';

void main() async{
  //init hive
 await  Hive.initFlutter();

 //open box
 var box = await Hive.openBox('todo');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
     initialRoute: '/loading',
      routes: {
        '/home': (context) => HomePage(),
        '/loading': (context) => LoadingScreen(),
      },
     //  home: LoadingScreen(),
    );
  }
}
