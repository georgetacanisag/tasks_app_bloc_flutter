import 'package:flutter/material.dart';
import 'package:tasks_app_bloc_flutter/utils/id_auto_generator.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';

class AddTaskModalBottom extends StatelessWidget {
  const AddTaskModalBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        const Text(
          "Add task",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          autofocus: true,
          controller: titleController,
          decoration: const InputDecoration(
              label: Text("Title"), border: OutlineInputBorder()),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                var task =
                    Task(title: titleController.text, id: GUIDGen.generate());
                context.read<TasksBloc>().add(
                    AddTaskEvent(task: Task(title: task.title, id: task.id)));
                Navigator.pop(context);
              },
              child: const Text("Add"),
            ),
          ],
        ),
      ]),
    );
  }
}
