import 'package:flutter/material.dart';

import 'package:herwego/services/auth.dart';
class MyHomePage extends StatefulWidget {
  @override
  static final String id='';
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),centerTitle: true,
      ),

      backgroundColor: Colors.white,
      body: Center(child:Container(
        color: Colors.greenAccent,
        margin: EdgeInsets.symmetric(horizontal: 70),
        height: 50,
        width: double.infinity,
        child: FlatButton(
          onPressed: (){
            FireBase.signout(context);
          },
          child:Text('Log Out',style: TextStyle(
            color: Colors.white,

          ),),
        ),
      ),

      ),

    );
  }
}
