import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_bloc_flutter/models/task.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    //Add task
    on<AddTaskEvent>((event, emit) {
      emit(TasksState(
        allTasks: List.from(state.allTasks)..add(event.task),
      ));
    });

    //update task
    on<UpdateTaskEvent>((event, emit) {
      final int index = state.allTasks.indexOf(event.task);

      List<Task> alltasks = List.from(state.allTasks)..remove(event.task);
      event.task.isDone == false
          ? alltasks.insert(index, event.task.copyWith(isDone: true))
          : alltasks.insert(index, event.task.copyWith(isDone: false));
      emit(TasksState(allTasks: alltasks));
    });

    //delete task
    on<DeleteTaskEvent>((event, emit) {
      List<Task> alltasks = List.from(state.allTasks)..remove(event.task);
      emit(TasksState(allTasks: alltasks));
    });
  }
}
