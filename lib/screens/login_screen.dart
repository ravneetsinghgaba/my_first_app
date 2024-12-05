import 'package:flutter/material.dart';
import 'task_list_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: ElevatedButton(
          child: Text('Login'),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => TaskListScreen()));
          },
        ),
      ),
    );
  }
}
