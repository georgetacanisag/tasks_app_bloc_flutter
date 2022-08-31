import 'package:flutter/material.dart';

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
                "My Tasks",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const ListTile(
              leading: Icon(Icons.folder_special),
              title: Text("Favourites"),
              trailing: Text("0"),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.delete),
              title: Text("Bin"),
              trailing: Text("0"),
            )
          ],
        ),
      ),
    );
  }
}
