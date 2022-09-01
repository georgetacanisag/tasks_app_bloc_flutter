import 'package:equatable/equatable.dart';
import 'package:tasks_app_bloc_flutter/models/task.dart';

import '../bloc_exports.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    //Add task
    on<AddTaskEvent>((event, emit) {
      emit(
        TasksState(
          allTasks: List.from(state.allTasks)..add(event.task),
          removedTasks: state.removedTasks,
        ),
      );
    });

    //update task
    on<UpdateTaskEvent>((event, emit) {
      final int index = state.allTasks.indexOf(event.task);

      List<Task> alltasks = List.from(state.allTasks)..remove(event.task);
      event.task.isDone == false
          ? alltasks.insert(index, event.task.copyWith(isDone: true))
          : alltasks.insert(index, event.task.copyWith(isDone: false));
      emit(TasksState(
        allTasks: alltasks,
        removedTasks: state.removedTasks,
      ));
    });

    //delete task
    on<DeleteTaskEvent>((event, emit) {
      List<Task> removeTasks = List.from(state.removedTasks)
        ..remove(event.task);
      emit(TasksState(allTasks: state.allTasks, removedTasks: removeTasks));
    });

    //Remove task
    on<RemoveTaskEvent>((event, emit) {
      List<Task> alltasks = List.from(state.allTasks)..remove(event.task);
      List<Task> removetasks = List.from(state.removedTasks)
        ..add(event.task.copyWith(isDeleted: true));
      emit(TasksState(allTasks: alltasks, removedTasks: removetasks));
    });
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }
}
