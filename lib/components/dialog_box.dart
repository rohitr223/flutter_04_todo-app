import 'package:flutter/material.dart';
import 'package:todo_app/components/app_button.dart';

class DialogBox extends StatelessWidget {
  final controller;

  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: SizedBox(
        height: 150,
        width: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get the user input
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add Your New Task",
              ),
            ),
            // save / cancel button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                AppButton(
                  text: "Save",
                  buttonColor: const Color.fromARGB(255, 33, 124, 198),
                  onPressed: onSave,
                ),
                const SizedBox(width: 10),
                AppButton(
                  text: "Cancel",
                  buttonColor: const Color.fromARGB(255, 236, 12, 12),
                  onPressed: onCancel,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
