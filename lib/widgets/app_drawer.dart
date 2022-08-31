import 'package:flutter/material.dart';
import 'package:tasks_app_bloc_flutter/screens/recycle_bin_screen.dart';
import 'package:tasks_app_bloc_flutter/screens/tasks_screen.dart';

import '../blocs/bloc_exports.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              color: Colors.grey,
              child: Text(
                "Tasks",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: (() =>
                      Navigator.of(context).pushNamed(TasksScreen.id)),
                  child: ListTile(
                    leading: const Icon(Icons.folder_special),
                    title: const Text("My Tasks"),
                    trailing: Text("${state.allTasks.length}"),
                  ),
                );
              },
            ),
            const Divider(),
            GestureDetector(
              onTap: (() =>
                  Navigator.of(context).pushNamed(RecycleBinScreen.id)),
              child: const ListTile(
                leading: Icon(Icons.delete),
                title: Text("Bin"),
                trailing: Text("0"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
