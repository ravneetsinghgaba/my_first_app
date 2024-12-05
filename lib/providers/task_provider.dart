import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../services/api_service.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  Future<void> fetchTasks() async {
    final taskData = await ApiService.fetchTasks();
    _tasks = taskData.map((task) => Task.fromJson(task)).toList();
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    await ApiService.addTask(task.toJson());
    fetchTasks();
  }

  Future<void> deleteTask(String id) async {
    await ApiService.deleteTask(id);
    fetchTasks();
  }

  Future<void> toggleTaskStatus(String id, bool status) async {
    await ApiService.updateTask(id, {'isCompleted': status});
    fetchTasks();
  }
}
