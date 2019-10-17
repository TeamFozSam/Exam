
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Signup.dart';



class Home extends StatefulWidget {
  final FirebaseUser user;
  
  Home({Key key, this.user}) : super(key: key);
  @override
  _HomeState createState() => _HomeState(user:user);
}

class _HomeState extends State<Home> {
 
  void logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context,
     MaterialPageRoute(
      builder: (context)=> Signup()
    ),);
  }
 FirebaseUser user;
    _HomeState({Key key,@required this.user});
   
  @override
  Widget build(BuildContext context) {
    return 
      
        Scaffold(
          appBar: AppBar(
            title: Text("Home"),
          ),
          body: Center(
            child: Container(
              child: Column(
               children: <Widget>[
               
                  Container(child: Center(child: Text('Login Succesfull '),)),
                  RaisedButton(
                    onPressed: ()=>logout(),
                    child: Text(
                      "Log out"
                    ),
                  ),
                  
               ],
       
    ),
            ),
          ),
        );
  }
}