import 'package:do_anything/CustomWidgets/task_list_tile.dart';
import 'package:do_anything/models/task.dart';
import 'package:do_anything/models/task_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
            itemCount: taskData.taskCount,
            itemBuilder: (context, index) {
              final task = taskData.tasks[index];
              return TaskTile(
                  longPressCallback: () {
                    task.isDone == true
                        ? showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Center(
                                    child: Text(
                                  "Delete Note",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                )),
                                content: const SingleChildScrollView(
                                  child: ListBody(
                                    children: [
                                      Text(
                                        "Are you sure want to delete this note.",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "No",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.black),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        taskData.deleteTask(task);

                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        "Yes",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.black),
                                      )),
                                ],
                              );
                            })
                        : null;
                  },
                  isChecked: task.isDone,
                  tasktitle: task.name!,
                  checkboxCallback: (checkboxState) {
                    taskData.updateTask(task);
                  });
            });
      },
    );
  }
}
