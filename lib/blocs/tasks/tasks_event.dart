part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();
}

//Add new task
class AddTaskEvent extends TasksEvent {
  final Task task;

  const AddTaskEvent({required this.task});

  @override
  List<Object> get props => [task];
}

//Update task
class UpdateTaskEvent extends TasksEvent {
  final Task task;

  const UpdateTaskEvent({required this.task});

  @override
  List<Object> get props => [task];
}

//Delete task
class DeleteTaskEvent extends TasksEvent {
  final Task task;

  const DeleteTaskEvent({required this.task});

  @override
  List<Object> get props => [task];
}

//Delete task
class RemoveTaskEvent extends TasksEvent {
  final Task task;

  const RemoveTaskEvent({required this.task});

  @override
  List<Object> get props => [task];
}
