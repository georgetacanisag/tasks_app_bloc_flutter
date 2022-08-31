import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  const TaskTile({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.star),
      title: Text(
        task.title,
        style: TextStyle(
            decoration: task.isDone! ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
          value: task.isDone,
          onChanged: (value) {
            context.read<TasksBloc>().add(UpdateTaskEvent(task: task));
          }),
      onLongPress: (() =>
          context.read<TasksBloc>().add(DeleteTaskEvent(task: task))),
    );
  }
}
