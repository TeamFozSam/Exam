import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var sam= "/1.jpg";
  
  foz(){
    var ran=Random().nextInt(6)+1;
    setState(() {
     switch (ran.toString()) {
       case "1":
         sam= "/1.jpg";
         break;
         case "2":
         sam= "/2.jpg";
         break;
         case "3":
         sam= "/3.jpg";
         break;
         case "4":
         sam= "/4.jpg";
         break;
         case "5":
         sam= "/5.jpg";
         break;
         case "6":
         sam= "/6.jpg";
         break;

       default:
     } 
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dice Rolling"),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.black54,
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 250.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20.0),
                    ),
                  child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Container(
              height: 150.0,
              child: Image.asset("dice"+ sam),
              ),
              Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: RaisedButton(
                  child: Text("Dice Change", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                  color: Colors.green,
                  onPressed: foz,
                ),
              ),
            ],
          )
              ],
              ),
            
              
            
              ),  
              ],
            ),
          ),
          
          
        ],
      )
      
    );
  }
}