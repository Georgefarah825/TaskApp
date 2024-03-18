// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'task_bloc.dart';

@immutable
abstract class TaskEvent extends Equatable {
  List<Object?> get props => [];
}

//addTaskEvent
class addTask extends TaskEvent {
  final Task task;
  addTask({
    required this.task,
  });

  @override
  List<Object?> get props => [task];
}

//updateTaskEvent
class updateTask extends TaskEvent {
  final Task task;
  updateTask({
    required this.task,
  });

  @override
  List<Object?> get props => [task];
}

//deleteTaskEvent
class deleteTask extends TaskEvent {
  final Task task;
  deleteTask({
    required this.task,
  });

  @override
  List<Object?> get props => [task];
}

//removeTaskEvent
class removeTask extends TaskEvent {
  final Task task;
  removeTask({
    required this.task,
  });

  @override
  List<Object?> get props => [task];
}

//MarkAsFavorateEvent
class MarkAsFavorateOrUnFavorateTask extends TaskEvent {
  final Task task;
  MarkAsFavorateOrUnFavorateTask({
    required this.task,
  });

  @override
  List<Object?> get props => [task];
}

//EditTaskEvent
class EditTaskEvent extends TaskEvent {
  final Task oldtask;
  final Task newtask;
  EditTaskEvent({
    required this.oldtask,
    required this.newtask,
  });

  @override
  List<Object?> get props => [oldtask, newtask];
}

//RestoreTaskEvent
class RestoreTaskEvent extends TaskEvent {
  final Task task;

  RestoreTaskEvent({
    required this.task,
  });

  @override
  List<Object?> get props => [task];
}

//deleteallTaskEvent
class DeleteallTaskEvent extends TaskEvent {}
