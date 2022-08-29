import 'package:flutter/material.dart';
import 'package:tasks_app_bloc_flutter/models/task.dart';
import 'package:tasks_app_bloc_flutter/widgets/tasks_list.dart';

import '../blocs/bloc_exports.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.allTasks;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Tasks App'),
            actions: [
              IconButton(
                onPressed: () {
                  context
                      .read<TasksBloc>()
                      .add(AddTaskEvent(task: Task(title: "Task 1")));
                },
                icon: const Icon(Icons.add),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: Center(
                    child: Chip(
                      backgroundColor: Colors.blue,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      label: Text(
                        'Tasks:',
                      ),
                    ),
                  ),
                ),
                TasksList(taskList: taskList),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context
                  .read<TasksBloc>()
                  .add(AddTaskEvent(task: Task(title: "Task 1")));
            },
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
