import 'package:flutter/material.dart';
import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/model/model_todo.dart';

class TodoItems extends StatelessWidget {
  final TodoMod todo;
  final onTodoChange;
  final onDeleteItem;

  const TodoItems(
      {Key? key,
      required this.todo,
      required this.onTodoChange,
      required this.onDeleteItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onTodoChange(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        tileColor: itemclr,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank_rounded,
          color: blue,
        ), //phr yaha texts wghera b hojygy
        title: Text(todo.todoText,
            style: TextStyle(
              fontSize: 20,
              decoration: todo.isDone ? TextDecoration.lineThrough : null,
            )),
        trailing: Container(
          height: 35,
          width: 35,
          decoration:
              BoxDecoration(color: red, borderRadius: BorderRadius.circular(8)),
          child: IconButton(
            padding: const EdgeInsets.all(1),
            iconSize: 25,
            icon: const Icon(
              Icons.delete_rounded,
              color: white,
            ),
            onPressed: () {
              onDeleteItem(todo.id);
            },
          ),
        ),
      ),
    );
  }
}
