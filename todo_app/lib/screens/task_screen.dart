import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/model/task_model.dart';

class TaskScreen extends StatelessWidget {
   TaskScreen({super.key});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final Box<TaskModel> taskBox = Hive.box<TaskModel>('tasks');

  void _addTask(String title, String description) {
    final task = TaskModel(title: title, description: description);
    taskBox.add(task);
   
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
      ),
      body: Column(
        children: [
          TextField(
            controller: titleController ,
            decoration: InputDecoration(
              labelText: 'Task Title',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(
              labelText: 'Task Description',
              border: OutlineInputBorder(),
            ),
          ),
       
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              final title = titleController.text;
              final description = descriptionController.text;
              if (title.isNotEmpty && description.isNotEmpty) {
                _addTask(title, description);
                titleController.clear();
                descriptionController.clear();
              }
            },
            child: const Text('Add Task'),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: taskBox.listenable(),
              builder: (context, Box<TaskModel> tasks, _) {
                if (tasks.isEmpty) {
                  return const Center(child: Text('No tasks added yet.'));
                }
                return ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks.getAt(index);
                    return ListTile(
                      title: Text(task?.title ?? ''),
                      subtitle: Text(task?.description ?? ''),
                      leading: Checkbox(
                        value: task?.isDone ?? false,
                        onChanged: (value) {
                          if (task != null) {
                            task.isDone = value ?? false;
                            task.save();
                          }
                        },
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          tasks.deleteAt(index);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
