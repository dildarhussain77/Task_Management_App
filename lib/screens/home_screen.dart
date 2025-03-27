import 'package:flutter/material.dart';
import 'package:task_management_app/widget/task_tile.dart';
import '../models/task_model.dart';
import '../services/task_service.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    List<Task> loadedTasks = await TaskService.loadTasks();
    setState(() {
      tasks = loadedTasks;
    });
  }

  void _addTask(String title, String description) {
    setState(() {
      tasks.add(Task(title: title, description: description));
      TaskService.saveTasks(tasks);
    });
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
      TaskService.saveTasks(tasks);
    });
  }

  void _toggleTask(int index) {
    setState(() {
      tasks[index].isCompleted = !tasks[index].isCompleted;
      TaskService.saveTasks(tasks);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
      ),
      body: tasks.isEmpty
          ? const Center(child: Text('No tasks yet. Add one!'))
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TaskTile(
                  task: tasks[index],
                  onToggle: () => _toggleTask(index),
                  onDelete: () => _deleteTask(index),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskScreen(onTaskAdded: _addTask),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
