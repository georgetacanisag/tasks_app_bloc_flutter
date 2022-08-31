import 'package:flutter/material.dart';
import 'package:tasks_app_bloc_flutter/widgets/app_drawer.dart';

import '../widgets/tasks_list.dart';

class RecycleBinScreen extends StatelessWidget {
  const RecycleBinScreen({Key? key}) : super(key: key);

  static const id = "recycle_bin_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recycle Bin'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Center(
                child: Chip(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  label: Text(
                    'tasks',
                  ),
                ),
              ),
            ),
            TasksList(taskList: []),
          ],
        ),
      ),
    );
  }
}
