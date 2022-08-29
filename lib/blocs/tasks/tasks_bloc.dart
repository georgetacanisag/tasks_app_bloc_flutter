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

    //upodate task
    on<UpdateTaskEvent>((event, emit) {
      emit(const TasksState());
    });

    //delete task
    on<DeleteTaskEvent>((event, emit) {
      emit(const TasksState());
    });
  }
}
