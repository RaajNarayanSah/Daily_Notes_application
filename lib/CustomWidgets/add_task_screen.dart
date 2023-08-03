import 'package:do_anything/models/task_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key, required this.textController});

  TextEditingController textController;

  // var listValue = [];

  // @override
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
        width: MediaQuery.of(context).size.width / 1,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                "Add Task",
                style: TextStyle(color: Colors.lightBlueAccent, fontSize: 26),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.8,
              child: TextField(
                controller: textController,
                textAlign: TextAlign.center,
                autofocus: true,
                decoration: const InputDecoration(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextButton(
                onPressed: () async {
                  print("aaaaa");
                  // var list = Provider.of<TaskData>(context).tasks;
                  // var prefs = await SharedPreferences.getInstance();
                  // final task = Task(name: textController.text);
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(textController.text);
                  print("bbbbbbbb");

                  // prefs.setStringList('List', list.cast<String>());

                  textController.clear();
                  Navigator.pop(context);
                },
                child: Text(
                  "Add",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.lightBlueAccent),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)))),
              ),
            )
          ],
        ),
      ),
    );
  }

  // void getValue() async {
  //   var prefs = await SharedPreferences.getInstance();
  //   var getName = prefs.getStringList('List');
  //   listValue = getName != null ? getName : [];
  // }
}
