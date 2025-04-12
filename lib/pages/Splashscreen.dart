import 'dart:async';
import 'package:untitled/pages/Todo.dart';
import 'package:flutter/material.dart';
class Splash extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>SplachState();

}
class SplachState extends State<Splash>{

  @override
  void initState(){
  Timer(Duration(microseconds: 500), (){
     Navigator.pushReplacement(
         context, MaterialPageRoute(
         builder: (context)=>Todo()
     )
     );
  });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.deepPurple,
          height: double.infinity,
          width: double.infinity,

        ),
        Positioned(
            child: Center(
              child: Container(
                height: 70,
                width: 200,
                decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(50),
                  border: Border(
                    top: BorderSide(color: Colors.white,width: 2),
                    bottom: BorderSide(color: Colors.white,width: 2),
                    right: BorderSide(color: Colors.white,width: 2),
                    left: BorderSide(color: Colors.white,width: 2),


                  ),
                ),
                child: Center(
                  child: Text("Todo",style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Times New Roman",
                    color: Colors.white,
                    decoration: TextDecoration.none
                  ),),
                ),
              ),
            )
        )
      ],
    );
  }

}