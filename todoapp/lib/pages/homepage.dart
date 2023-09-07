import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'package:todoapp/model/model_todo.dart';
import 'package:todoapp/widget/todo_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todolist = TodoMod.todolist;
  List<TodoMod> _foundTodo = [];
  final _todocontroller = TextEditingController();

  @override
  void initState() {
    _foundTodo = todolist;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: _buildAppBar(),
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          const SizedBox(height: 50),
          Expanded(
            child: ListView(
              children: [
                for (TodoMod todoo in _foundTodo.reversed)
                  TodoItems(
                      todo: todoo,
                      onTodoChange: _todoChange,
                      onDeleteItem: _deleteTodo),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin:
                        const EdgeInsets.only(bottom: 18, right: 20, left: 20),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            offset: Offset(0, 1),
                            blurRadius: 10,
                          )
                        ]),
                    child: TextField(
                      controller: _todocontroller,
                      decoration: const InputDecoration(
                        hintText: "Enter a new Task",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _addTodo(_todocontroller.text);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: blue,
                      minimumSize: const Size(50, 55),
                      elevation: 10,
                    ),
                    child: const Text('+', style: TextStyle(fontSize: 40)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  //change items
  void _todoChange(TodoMod todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  //delete items
  void _deleteTodo(String id) {
    setState(() {
      todolist.removeWhere((item) => item.id == id);
    });
  }

  //Add items
  void _addTodo(String toDo) {
    setState(() {
      todolist.add(TodoMod(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo));
    });
    _todocontroller.clear();
  }

//Search box function logic
  void _runFilter(String enteredKeyword) {
    List<TodoMod> results = [];
    if (enteredKeyword.isEmpty) {
      results = todolist;
    } else {
      results = todolist
          .where((item) => item.todoText
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundTodo = results;
    });
  }

  //App Bar
  _buildAppBar() {
    return AppBar(
      backgroundColor: appbarclr,
      title: const Center(child: Text("My Tasks!")),
    );
  }

  //SearchBox
  searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration:
          BoxDecoration(color: white, borderRadius: BorderRadius.circular(30)),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: const InputDecoration(
            hintText: "Search",
            contentPadding: EdgeInsets.all(12),
            prefixIcon: Icon(
              Icons.search,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
            border: InputBorder.none),
      ),
    );
  }
}
