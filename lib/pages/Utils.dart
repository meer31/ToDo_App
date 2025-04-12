import 'package:flutter/material.dart';
class TodoList extends StatefulWidget{
  TodoList(
      {
        super.key,
        required this.taskname,
        required this.taskcompleted,
        required this.onChanged,
        required this.deleteitem
  }
      );
  final String taskname;
  final  bool taskcompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteitem;

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(
        top: 20,
        right: 20,
        left: 20,
        bottom: 0
    ),
    child: Expanded(
      child: AnimatedContainer(
        duration:Duration(seconds: 2) ,
        curve: Curves.easeInBack,
        child: Container(
          padding: EdgeInsets.only(
            top: 20,
            right: 10,
            left: 10,
            bottom: 20
          ),
          decoration: BoxDecoration(
              color: Colors.deepPurple.shade700,
              borderRadius: BorderRadius.circular(15)
          ),
          child: Row(

            children: [
              Checkbox(
                checkColor: Colors.black,
                  activeColor: Colors.white,
                  side: BorderSide(
                    color: Colors.white
                  ),
                  value: widget.taskcompleted,
                  onChanged: widget.onChanged
              ),
              Wrap(
                children: [
                  Text(
                    widget.taskname,style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      decoration:
                      widget.taskcompleted? TextDecoration.lineThrough
                          :TextDecoration.none,
                      decorationColor: Colors.white,
                      decorationThickness: 3
                  ),),
                ]

              ),
             Spacer(),
              Expanded(
                child: IconButton(
                  iconSize: 25,
                    color: Colors.white,
                    onPressed:()=>widget.deleteitem!(context),
                    icon: Icon(Icons.delete)
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
  }
}