import 'package:flutter/material.dart';

class ToDoProvider extends ChangeNotifier {
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

  List<bool> _isCheckedList = List.generate(8, (index) => false);

  List<String> get todos => _todos;

  List<bool> get isCheckedList => _isCheckedList;

  void addTodo(String newTodo) {
    _todos.add(newTodo);
    _isCheckedList.add(false);
    notifyListeners();
  }

  void removeTodo(int index) {
    _todos.removeAt(index);
    _isCheckedList.removeAt(index);
    notifyListeners();
  }

  void toggleTodoCompletion(int index, bool value) {
    _isCheckedList[index] = value;
    notifyListeners();
  }
}
