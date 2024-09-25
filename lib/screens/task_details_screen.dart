import 'package:flutter/material.dart';
import 'package:to_do/Models/task_model.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({super.key, required this.taskModel,});
  final TaskModel taskModel;
  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.taskModel.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: double.infinity,
              height: 100,
            ),
            Text(
              "Title : ${widget.taskModel.title}",
              style: 
                  const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          if (widget.taskModel.subtitle != null)
            Text(
              "Subtitle : ${widget.taskModel.subtitle}",
              style: const TextStyle(
                fontSize: 26, fontWeight: FontWeight.normal),
            ),
          Icon(
            widget.taskModel.isCompleted ? Icons.check
            :Icons.cancel_outlined,
            size: 200,
            color: widget.taskModel.isCompleted ? Colors.green
            :Colors.red,
          ),
          Text(
            "Created At : ${widget.taskModel.createdAt.toIso8601String().substring(0,10).replaceAll("-", "/")}",
            style: const TextStyle(
                fontSize: 26, fontWeight:FontWeight.normal),         
          ),
          const SizedBox(
            width: double.infinity,
            height: 100,
          )
        ],
      ),
    ));
  }
}
