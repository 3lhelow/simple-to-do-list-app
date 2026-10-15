import 'package:flutter/material.dart';

import '../utils/dialog_box.dart';
import '../utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  List<dynamic> toDoList = [
    ["Make More Projects", false],
    ["Do Exercise", true],
  ];

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });

    Navigator.of(context).pop();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do"),
        centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),

      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (BuildContext context, int index) {
          return ToDoLTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (bool? value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
