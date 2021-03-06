
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:herwego/services/pref.dart';


import '../MyHomePage.dart';
import '../SignIn.dart';
import '../Utility.dart';
import 'auth.dart';

class SignUp extends StatefulWidget {
  static final String id='';
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignUp> {
  var isLoading=false;
  final _name=new TextEditingController();
  final _password=new TextEditingController();
  final _email=new TextEditingController();
  _doSignUp(){

    String name=_name.text.trim().toString();
    String password=_password.text.trim().toString();
    String email=_email.text.trim().toString();


    print(name);
    setState(() {
      isLoading=true;
    });

    // if(password.isEmpty||email.isEmpty)return



    FireBase.signUP(context, name, email, password).then((firebase) =>{
      _getFireBase(firebase)

    });



  }
  _getFireBase(FirebaseUser fireBase){
    setState(() {
      isLoading=false;
    });
    if(fireBase!=null){
      Prefs.loadUser(fireBase.uid);

      Navigator.pushReplacementNamed(context,MyHomePage.id);
    }else{
      Utils.fireToast('check your information');
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: _name,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Name',
                    hintStyle: TextStyle(
                      color: Colors.grey,


                    )
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: _password,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Colors.grey,


                    )
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: Colors.grey,


                    )
                ),
              ),
            ),
            SizedBox(height: 10,),
            Stack(
              children: [

                Container(
                  color: Colors.greenAccent,
                  margin: EdgeInsets.symmetric(horizontal: 70),
                  height: 50,
                  width: double.infinity,
                  child: FlatButton(
                    onPressed: (){
                      _doSignUp();
                    },
                    child:Text('Sign Up',style: TextStyle(
                      color: Colors.white,

                    ),),
                  ),
                ),SizedBox(height: 3,),isLoading?Center(child:CircularProgressIndicator() ,):SizedBox.shrink()
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 10,left: 120),
              child: Row(
                children: [
                  Text("already  you have account",style: TextStyle(color: Colors.grey,fontSize: 17),),
                  SizedBox(width: 10,),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (ctx)=>SignIn()));
                      },
                      child: Text('SignIn',style: TextStyle(color: Colors.grey,fontSize: 17)))
                ],
              ),
            )

          ],
        ),
        // isLoading?
        // Center(child: CircularProgressIndicator(),):SizedBox.shrink()





      ],),



    );
  }
}
