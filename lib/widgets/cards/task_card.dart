import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart';
import 'package:to_do/Models/providers/task_provider.dart';
import 'package:to_do/Models/task_model.dart';
import 'package:to_do/screens/task_details_screen.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.taskModel, required this.onTap, required this.onTapDelete});
  final TaskModel taskModel;
  final Function onTap;
    final Function onTapDelete;


  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(builder: (context, taskProvider, _) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => TaskDetailsScreen(
                        taskModel: taskModel,
                      )));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.blue.withOpacity(0.1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        taskModel.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                      ),
                      if (taskModel.subtitle != null)
                        Text(
                          taskModel.subtitle!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                        ),
                      Text(
                        taskModel.isCompleted
                            ? DateFormat("EEE dd MMM yyyy").format(
                                DateTime.parse(
                                    taskModel.createdAt.toIso8601String()))
                            : format(taskModel.createdAt),
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                        onTapDelete();
                        },
                        icon: const Icon(Icons.delete),
                      ),
                      Checkbox(
                        value: taskModel.isCompleted,
                        onChanged: (check) {
                          onTap();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
