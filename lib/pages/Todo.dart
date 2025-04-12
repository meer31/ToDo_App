import 'package:flutter/material.dart';
import 'package:untitled/pages/Utils.dart';
class Todo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>TodoState();

}
class TodoState extends State<Todo>{
  GlobalKey<FormState> _globalKey=GlobalKey();
  String? _validateItem(String? value){
    return value!.isEmpty?'Enter item to Todo':null;
  }

  List toDolist=[];
  TextEditingController _controller1=TextEditingController();

  void checkBoxchanged(int index){
    setState(() {
      toDolist[index][1]=!toDolist[index][1];
    });
  }
  void saveNewTask(){
    setState(() {
      if(_globalKey.currentState!.validate()){
        toDolist.add([_controller1.text,false]);
        _controller1.clear();
      }
    });
  }
  void deleteitem(int index){
    setState(() {
      toDolist.removeAt(index);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade400,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade700,
        centerTitle: true,
        title: Text("Todo",style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20)
          )
        ),
        elevation: 4.0,
        shadowColor: Colors.black,
        toolbarHeight: 100,
      ),
      body: ListView.builder(
          itemCount: toDolist.length,
          itemBuilder: (BuildContext context ,index){
            return TodoList(
              taskname: toDolist[index][0],
              taskcompleted: toDolist[index][1],
              onChanged: (value)=>checkBoxchanged(index),
              deleteitem: (value)=>deleteitem(index),
            );
          }
      ),
      floatingActionButton: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 10,
                bottom: 10
              ),
              child: Form(
                key: _globalKey,
                child: TextFormField(
                  validator: _validateItem,
                  controller: _controller1,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black
                  ),
                 decoration: InputDecoration(
                   hintText: "Add a new items in ToDo",
                   fillColor: Colors.deepPurple.shade200,
                   filled: true,
                   enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(9),
                     borderSide: BorderSide(
                       width: 1.5,
                       color: Colors.deepPurple.shade700
                     )
                   ),
                   focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                       color: Colors.deepPurple.shade700
                     )
                   )
                 ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10
            ),
            child: FloatingActionButton(
                onPressed: saveNewTask,
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }

}