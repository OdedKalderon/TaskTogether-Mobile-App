import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/todo_item.dart';

class TodoItem extends StatefulWidget {
  final Todo todo;
  final isDone;
  final onDeleteItem;

  const TodoItem({Key key, this.todo, this.isDone, this.onDeleteItem}) : super(key: key);

  @override
  State<TodoItem> createState() => _TodoItemState();
}

//input: Todo item, delete function, set as done/undone function
//output: creates a widget that shows a todo item, with a button to delete it (from input),
//        and an onpressed function thats sets the items status as done/undone (from input)
class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: () {
          widget.isDone(widget.todo);
        },
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          widget.todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          widget.todo.text,
          style: GoogleFonts.quicksand(fontSize: 16, color: Colors.black, decoration: !widget.todo.isDone ? null : TextDecoration.lineThrough),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(5)),
          child: IconButton(
            icon: Icon(Icons.delete),
            color: Colors.white,
            iconSize: 18,
            onPressed: () {
              widget.onDeleteItem(widget.todo.todoId);
            },
          ),
        ),
      ),
    );
  }
}
