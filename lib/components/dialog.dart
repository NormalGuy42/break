import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback save;
  VoidCallback cancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.save,
      required this.cancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 120.0,
        child: Column(children: [
          //User Input
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Add a task',
            ),
          ),
          Row(
            children: [
              //Save
              MyButton(text: 'Save', onPressed: save),
              //Cancel
              MyButton(text: 'Cancel', onPressed: cancel)
            ],
          )
        ]),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.red[200],
      child: Text(text),
    );
  }
}
