import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/providers/todo_provider.dart';
import 'package:flutter_application_1/view/homescreen/homescreen_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ToDoProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
