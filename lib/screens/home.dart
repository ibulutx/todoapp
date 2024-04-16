import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todoapp/constants/color.dart';
import 'package:todoapp/constants/tasktype.dart';
import 'package:todoapp/model/task.dart';
import 'package:todoapp/screens/add_new_task.dart';
import 'package:todoapp/service/todo_service.dart';
import 'package:todoapp/todoitem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<String> todo = ["Study Lessons", "Run 5K" , "Go To Party"];
  // List<String> completed = ["Game meet up", "Take Out Trash" ];

  List<Task> todo = [
    Task(
      type: TaskType.note,
      title: "Study Lessons",
      description: "Study Maths",
      isCompleted: false,
    ),
    Task(
      type: TaskType.calender,
      title: "Go To Party",
      description: "My party",
      isCompleted: false,
    ),
    Task(
      type: TaskType.contest,
      title: "Run 5K",
      description: "Run 5 Kilometres",
      isCompleted: false,
    ),
  ];
  List<Task> completed = [
    Task(
      type: TaskType.note,
      title: "Study Lessons",
      description: "Study Maths",
      isCompleted: false,
    ),
    Task(
      type: TaskType.calender,
      title: "Go To Party",
      description: "My party",
      isCompleted: false,
    ),
  ];

  void addNewTask(Task newTask) {
    setState(() {
      todo.add(newTask);
    });
  }
  @override
  Widget build(BuildContext context) {
    TodoService todoService = TodoService();

    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
        home: SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(backgroundColor),
        body: Column(children: [
          Container(
            width: deviceWidth,
            height: deviceHeight / 3,
            decoration: const BoxDecoration(
              color: Colors.pink,
              image: DecorationImage(
                  image: AssetImage("lib/assets/images/header.png"),
                  fit: BoxFit.cover),
            ),
            child: const Column(children: [
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "October 20, 2022",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                  "My Todo List",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ]),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: SingleChildScrollView(
                child: FutureBuilder(
                future: todoService.getUncompletedTodos(),
                builder: (context, snapshot) {
                  print(snapshot.data);
                  if (snapshot.data == null) {
                    return const CircularProgressIndicator();
                  }
                  else {
                    return ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return TodoItem(task: snapshot.data![index],
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Complated",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: SingleChildScrollView(
                  child: FutureBuilder(
                    future: todoService.getCompletedTodos(),
                    builder: (context, snapshot) {
                      print(snapshot.data);
                      if (snapshot.data == null) {
                        return const CircularProgressIndicator();
                      }
                      else {
                        return ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return TodoItem(task: snapshot.data![index],
                            );
                          },
                        );
                      }
                    },
                  ),),
            ),
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddNewTaskScreen(
                  addNewTask: (newTask) => addNewTask(newTask),
                ),
              ));
            },
            child: const Text("Add New Task"),
          )
        ]),
      ),
    ));
  }
}
