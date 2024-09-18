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
      home: const HomeScreen()
    );
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
      body: Container(
        height: 400,
        color: Colors.black.withOpacity(0.2),
        child: Center(
          child: Padding(
              padding: const EdgeInsets.all(0.24),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.redAccent,
                    width: 2,
                  ),
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(10, 10),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        color: const Color.fromARGB(255, 85, 46, 9),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        color: const Color.fromARGB(255, 33, 243, 121),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        color: const Color.fromARGB(255, 166, 33, 243),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
