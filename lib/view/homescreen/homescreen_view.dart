import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/homescreen/homescreen_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[50],
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/lixian.png'),
          )
        ],
      ),
      body: Container(
        color: Colors.blueGrey[50],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            CustomTextField(),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "All ToDos",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 40),
            Expanded(
              child: ToDoListPage(),
            ),
          ],
        ),
      ),
    );
  }
}
