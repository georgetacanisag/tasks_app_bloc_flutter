import 'package:flutter/material.dart';
import 'package:tasks_app_bloc_flutter/screens/recycle_bin_screen.dart';
import 'package:tasks_app_bloc_flutter/screens/tasks_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBinScreen.id:
        return MaterialPageRoute(
          builder: (_) => const RecycleBinScreen(),
        );
      case TasksScreen.id:
        return MaterialPageRoute(
          builder: (_) => const TasksScreen(),
        );
      default:
        return null;
    }
  }
}
