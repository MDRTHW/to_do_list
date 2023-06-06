import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    
    Future.delayed(Duration(milliseconds: 1500), (){
      Navigator.pushReplacementNamed(context, '/home');
    } );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.yellow[200],
        body: Center(

          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
             image: AssetImage('assets/images/todo.png'),
              height: 200,
              width: 200,
           ),
           Image(
              image: AssetImage('assets/images/logo.png'),
              height: 200,
            width: 200,
          )
        ],
      ),

    )
    );

  }
}
