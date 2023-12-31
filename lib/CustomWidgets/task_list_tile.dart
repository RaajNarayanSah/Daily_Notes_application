import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String tasktitle;
  final checkboxCallback;
  final Function longPressCallback;

  TaskTile(
      {required this.isChecked,
      required this.tasktitle,
      this.checkboxCallback,
      required this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onLongPress: () {
          longPressCallback();
        },
        title: Text(
          tasktitle,
          style: TextStyle(
              decoration:
                  isChecked == true ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: (newValue) {
            checkboxCallback(newValue);
          },
          // onChanged: toggleCheckboxState
        ));
  }
}
