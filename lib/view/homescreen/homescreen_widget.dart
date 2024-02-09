import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/providers/todo_provider.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const CustomTextField({Key? key, this.onChanged}) : super(key: key);

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
                onChanged: onChanged,
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
  String _newTodo = '';

  void _addTodo() {
    final provider = Provider.of<ToDoProvider>(context, listen: false);
    provider.addTodo(_textFieldController.text);
    _textFieldController.clear();
    setState(() {
      _newTodo = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ToDoProvider>(context);
    final todos = provider.todos;
    final isCheckedList = provider.isCheckedList;

    // Filtered list based on the search text
    final filteredTodos = todos
        .where((todo) => todo.toLowerCase().contains(_newTodo.toLowerCase()))
        .toList();

    return Column(
      children: <Widget>[
        CustomTextField(
          onChanged: (value) {
            setState(() {
              _newTodo = value;
            });
          },
        ),
        SizedBox(height: 40),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: filteredTodos.isEmpty
                ? Center(
                    child: Text(
                    "Not found",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 18, 75, 121),
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ))
                : ListView.builder(
                    itemCount: filteredTodos.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white,
                        child: ListTile(
                          leading: Checkbox(
                            value: isCheckedList[index],
                            onChanged: (bool? value) {
                              provider.toggleTodoCompletion(
                                  index, value ?? false);
                            },
                          ),
                          title: Text(
                            filteredTodos[index],
                            style: TextStyle(fontSize: 18),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              provider.removeTodo(index);
                            },
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border(
                      top: BorderSide(color: Colors.blueGrey.shade100),
                    ),
                  ),
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
              ),
              SizedBox(width: 8),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border(
                    top: BorderSide(color: Colors.blueGrey.shade100),
                  ),
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
