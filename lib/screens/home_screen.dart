import 'package:flutter/material.dart';
import 'package:task_management_app/screens/drawer_widget.dart';
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text("Task Manager", style: TextStyle(color: Colors.white),), 
            backgroundColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))
            ),
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.menu,color: Colors.white,), // Drawer Icon
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Open Drawer
                },
              ),
            ),
          ),
          drawer: AppDrawer(),
        body: tasks.isEmpty
            ? const Center(child: Text('No tasks yet. Add one!'))
            : ListView.builder(
                padding: const EdgeInsets.all(10), // Add padding around the list
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4, // Shadow effect
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5), // Space between cards
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // Rounded corners
                      side: BorderSide(color: Colors.blueAccent, width: 1.5), // Border around cards
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10,),
                      child: TaskTile(
                        task: tasks[index],
                        onToggle: () => _toggleTask(index),
                        onDelete: () => _deleteTask(index),
                      ),
                    ),
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
          backgroundColor: Colors.blueAccent, // Change button background color
          foregroundColor: Colors.white, // Change icon color
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
