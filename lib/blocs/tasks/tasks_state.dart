// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> allTasks;

  const TasksState({
    this.allTasks = const <Task>[],
  });

  @override
  List<Object> get props => [allTasks];
}
