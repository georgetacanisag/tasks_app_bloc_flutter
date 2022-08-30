import 'package:flutter/material.dart';
import 'package:tasks_app_bloc_flutter/models/task.dart';

class TasksList extends StatelessWidget {
  final List<Task> taskList;
  const TasksList({Key? key, required this.taskList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: taskList.length,
      itemBuilder: (context, index) {
        var task = taskList[index];
        return ListTile(
          leading: const Icon(Icons.star),
          title: Text(task.title),
          trailing: Checkbox(value: task.isDone, onChanged: (value) {}),
        );
      },
    );
  }
}
