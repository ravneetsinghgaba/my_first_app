import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import 'add_task_screen.dart';

class TaskListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Tasks')),
      body: FutureBuilder(
        future: taskProvider.fetchTasks(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: taskProvider.tasks.length,
              itemBuilder: (ctx, i) {
                final task = taskProvider.tasks[i];
                return ListTile(
                  title: Text(task.title),
                  subtitle: Text(task.dueDate),
                  trailing: Checkbox(
                    value: task.isCompleted,
                    onChanged: (val) {
                      taskProvider.toggleTaskStatus(task.id, val!);
                    },
                  ),
                  onLongPress: () => taskProvider.deleteTask(task.id),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => AddTaskScreen()));
        },
      ),
    );
  }
}
