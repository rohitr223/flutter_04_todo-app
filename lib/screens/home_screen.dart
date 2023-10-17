import 'package:flutter/material.dart';

import 'package:todo_app/components/dialog_box.dart';
import 'package:todo_app/components/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //text controller for user input
  final _controller = TextEditingController();

  // lists of todo tasks
  // all the newly added todos go here in this empty list.
  List todoList = [];

  // checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  // save new task
  void saveNewTask() {
    setState(() {
      todoList.add([_controller.text, false]);
      // clear the dialog box text after closing
      _controller.clear();
    });
    // close the dialog box after tapping save
    Navigator.of(context).pop();
  }

  // create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // delete task with the corresponding index
  void deleteOldTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text("Todo App"),
        backgroundColor: Colors.yellow[900],
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow[800],
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: todoList[index][0],
            taskCompleted: todoList[index][1],
            onChanged: (value) {
              checkBoxChanged(value, index);
            },
            // use index to delete the task
            deleteTask: (context) => deleteOldTask(index),
          );
        },
      ),
    );
  }
}
