import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border(
            top: BorderSide(color: Colors.blueGrey.shade100),
          ),
        ),
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ToDoListPage extends StatefulWidget {
  @override
  _ToDoListPageState createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  TextEditingController _textFieldController = TextEditingController();
  List<String> _todos = [
    "Buy Gifts",
    "Read Novel 📚",
    "Update Resume 📜",
    "Email Response 📧",
    "Write Blog ✍🏻",
    "Grocery Shopping 🛍️",
    "Client Call ☎️",
    "Visit Doctor 🗓️"
  ];

  String _newTodo = '';

  List<bool> _isCheckedList = List.generate(8, (index) => false);

  void _addTodo() {
    setState(() {
      if (_newTodo.isNotEmpty) {
        _todos.add(_newTodo);
        _newTodo = '';
        _isCheckedList.add(false);
        _textFieldController.clear(); // Clear the text field
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: _todos.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                child: ListTile(
                  leading: Checkbox(
                    value: _isCheckedList[index],
                    onChanged: (bool? value) {
                      setState(() {
                        _isCheckedList[index] = value!;
                      });
                    },
                  ),
                  title: Text(
                    _todos[index],
                    style: TextStyle(fontSize: 18),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        _todos.removeAt(index);
                        _isCheckedList.removeAt(index);
                      });
                    },
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textFieldController,
                  onChanged: (value) {
                    setState(() {
                      _newTodo = value;
                    });
                  },
                  onSubmitted: (_) {
                    _addTodo();
                  },
                  decoration: InputDecoration(
                    hintText: 'Add a new ToDo Item',
                    hintStyle: TextStyle(fontWeight: FontWeight.bold),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 5),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: const Color.fromARGB(255, 18, 75, 121),
                ),
                child: IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.white,
                  onPressed: _addTodo,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
