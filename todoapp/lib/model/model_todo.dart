class TodoMod {
  String id;
  String todoText;
  bool isDone;

  TodoMod({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<TodoMod> todolist = [
    TodoMod(id: '01', todoText: "Morning Workout", isDone: true),
    TodoMod(id: '02', todoText: "2 hr Study", isDone: true),
    TodoMod(id: '03', todoText: "Grocery Shopping"),
    TodoMod(id: '04', todoText: "Check client emails"),
    TodoMod(id: '05', todoText: "1 hr gym"),
    TodoMod(id: '06', todoText: "Flutter Programming"),
  ];
}
