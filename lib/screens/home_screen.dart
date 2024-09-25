import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/Models/providers/dark_mode_provider.dart';
import 'package:to_do/Models/providers/language_provider.dart';
import 'package:to_do/Models/providers/task_provider.dart';
import 'package:to_do/Models/task_model.dart';
import 'package:to_do/widgets/cards/task_card.dart';
import 'package:to_do/widgets/dailogs/add_task_dialog.dart';
import 'package:to_do/widgets/clickables/drawer_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskSubtitleController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(builder: (context, languageProvider, _) {
      return Consumer<TaskProvider>(builder: (context, taskProvider, _) {
        return Consumer<DarkModeProvider>(
            builder: (context, darkModeConsumer, _) {
          return Scaffold(
            drawer: Drawer(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      DrawerTile(
                          text: darkModeConsumer.isDark
                              ? AppLocalizations.of(context)!.lightmode
                              : AppLocalizations.of(context)!.darkmode,
                          onTab: () {
                            Provider.of<DarkModeProvider>(context,
                                    listen: false)
                                .switchMode();
                          },
                          icon: darkModeConsumer.isDark
                              ? Icons.light_mode
                              : Icons.dark_mode),
                      TextButton(
                          onPressed: () {
                            languageProvider.setLanguage("ar");
                          },
                          child: const Text("Arabic")),
                      TextButton(
                          onPressed: () {
                            languageProvider.setLanguage("en");
                          },
                          child: const Text("English")),
                      TextButton(
                          onPressed: () {
                            languageProvider.setLanguage("es");
                          },
                          child: const Text("Spanish")),
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AddTaskDialog(
                            titleController: taskTitleController,
                            subTitleController: taskSubtitleController,
                            formKey: formKey,
                            onTap: () {
                              Provider.of<TaskProvider>(context, listen: false)
                                  .addTask(TaskModel(
                                title: taskTitleController.text,
                                subtitle: taskSubtitleController.text.isEmpty
                                    ? null
                                    : taskSubtitleController.text,
                                createdAt: DateTime.now(),
                              ));
                              taskTitleController.clear();
                              taskSubtitleController.clear();
                              Navigator.pop(context);
                            });
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
                      isScrollable: false,
                      labelColor:
                          darkModeConsumer.isDark ? Colors.white : Colors.black,
                      unselectedLabelColor: darkModeConsumer.isDark
                          ? Colors.white30
                          : Colors.black45,
                      indicatorColor: Colors.blue,
                      tabs: [
                        Tab(
                          text: AppLocalizations.of(context)!.waiting,
                        ),
                        Tab(
                          text: AppLocalizations.of(context)!.completed,
                        )
                      ]),
                  Expanded(
                      child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ListView.builder(
                        padding: const EdgeInsets.all(24),
                        itemCount: taskProvider.tasks.length,
                        itemBuilder: (context, index) {
                          return taskProvider.tasks[index].isCompleted
                              ? const SizedBox()
                              : TaskCard(
                                  taskModel: taskProvider.tasks[index],
                                  onTap: () {
                                    taskProvider
                                        .switchValue(taskProvider.tasks[index]);
                                  },
                                  onTapDelete: () {
                                    taskProvider
                                        .delete(taskProvider.tasks[index]);
                                  });
                        },
                      ),
                      ListView.builder(
                        padding: const EdgeInsets.all(24),
                        itemCount: taskProvider.tasks.length,
                        itemBuilder: (context, index) {
                          return !taskProvider.tasks[index].isCompleted
                              ? const SizedBox()
                              : TaskCard(
                                  taskModel: taskProvider.tasks[index],
                                  onTap: () {
                                    taskProvider
                                        .switchValue(taskProvider.tasks[index]);
                                  },
                                  onTapDelete: () {
                                    taskProvider
                                        .delete(taskProvider.tasks[index]);
                                  });
                        },
                      ),
                    ],
                  ))
                ],
              ),
            ),
          );
        });
      });
    });
  }
}
