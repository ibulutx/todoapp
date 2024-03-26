import 'package:flutter/material.dart';

class AddNewTaskScreen extends StatelessWidget {
  const AddNewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: deviceWidth,
              height: deviceHeight / 10,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage("lib/assets/images/add_new_task_header.png"),
                    fit: BoxFit.cover),
              ),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 40,
                        color: Colors.white,
                      )),
                  const Expanded(
                      child: Text(
                    "Add New Task",
                    textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold,
                          fontSize: 21,
                        ),
                  ))
                ],
              ),
            ),
            const Text("Task Title"),
            TextField(),
          ],
        ),
      ),
    );
  }
}
