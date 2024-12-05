import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../models/task_model.dart';

class AddTaskScreen extends StatelessWidget {
  final _titleController = TextEditingController();
  final _dueDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Task')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(controller: _titleController, decoration: InputDecoration(labelText: 'Title')),
            TextField(controller: _dueDateController, decoration: InputDecoration(labelText: 'Due Date')),
            ElevatedButton(
              child: Text('Add Task'),
              onPressed: () {
                final task = Task(
                  id: '',
                  title: _titleController.text,
                  dueDate: _dueDateController.text,
                  isCompleted: false,
                );
                Provider.of<TaskProvider>(context, listen: false).addTask(task);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
