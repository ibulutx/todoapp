import 'package:flutter/material.dart';
import 'package:todoapp/constants/tasktype.dart';
import 'package:todoapp/model/todo.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({super.key, required this.task});
  final Todo task;
  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.task.completed! ? Colors.grey : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
//TODO FIREBASE'DE YAPCAN
            // widget.task.type == TaskType.note ? Image.asset("lib/assets/images/category1.png")
            //     : widget.task.type == TaskType.contest ? Image.asset("lib/assets/images/category2.png")
            // : Image.asset("lib/assets/images/category3.png"),
            Image.asset("lib/assets/images/category1.png"),
            Expanded(
              child: Column(
                children: [
                  Text(widget.task.todo!,
                    style: TextStyle(
                      decoration: widget.task.completed! ? TextDecoration.lineThrough : TextDecoration.none ,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
                  Text("User ${widget.task.userId!}"),
                ],
              ),
            ),
            Checkbox(value: isChecked, onChanged: (val) => {
              setState(() {
                widget.task.completed = !widget.task.completed!;
                isChecked = val!;
              })
            }),
          ],
        ),
      ),
    );
  }
}
