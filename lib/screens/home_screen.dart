import 'package:flutter/material.dart';
import 'package:to_do/Models/task_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

// This widget is the root of your application.
class _MyHomePageState extends State<HomeScreen> {
  List<TaskModel> tasks = [];
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              tasks.add(TaskModel(
                  title: "task ${tasks.length}",
                  subtitle: tasks.length.isOdd ? null : "abdoo Subtitle",
                  createdAt: DateTime.now()));
            });
          }),
      appBar: AppBar(
        title: const Text('TODO'),
        backgroundColor: Colors.blueAccent,
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            // ignore: prefer_const_constructors
            TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.green,
                indicatorColor: Colors.blue,
                tabs: [
                  Tab(
                    text: "Waiting",
                  ),
                  Tab(
                    text: "Completed",
                  )
                ]),
            Expanded(
                child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                ListView.builder(
                  padding: const EdgeInsets.all(24),
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return tasks[index].isCompleted
                        ? const SizedBox()
                        : ListTile(
                            tileColor: Colors.blue.withOpacity(0.1),
                            trailing: Checkbox(
                              value: tasks[index].isCompleted,
                              onChanged: (check) {
                                setState(() {
                                  tasks[index].isCompleted = check!;
                                });
                              },
                            ),
                            title: Text(tasks[index].title),
                            subtitle: tasks[index].subtitle != null
                                ? Text(tasks[index].subtitle!)
                                : null,
                          );
                  },
                ),
                ListView.builder(
                  padding: const EdgeInsets.all(24),
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return tasks[index].isCompleted
                        ? const SizedBox()
                        : ListTile(
                            tileColor: Colors.blue.withOpacity(0.1),
                            trailing: Checkbox(
                              value: tasks[index].isCompleted,
                              onChanged: (check) {
                                setState(() {
                                  tasks[index].isCompleted = check!;
                                });
                              },
                            ),
                            title: Text(tasks[index].title),
                            subtitle: tasks[index].subtitle != null
                                ? Text(tasks[index].subtitle!)
                                : null,
                          );
                  },
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
