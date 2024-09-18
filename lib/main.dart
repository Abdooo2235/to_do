import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

// This widget is the root of your application.
class _MyHomePageState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const DefaultTabController(
        length: 2,
        child: Column(
          children: [
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
              child: TabBarView(children: [
                Center(
                  child: Text("Wait"),
                ),
                Center(
                  child: Text("Comp"),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
