import 'package:flutter/material.dart';

import '../bloc_exports.dart';
import 'package:equatable/equatable.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskState()) {
    on<addTask>(_onAddTask);
    on<updateTask>(_onUpdateTask);
    on<deleteTask>(_onDeleteTask);
    on<removeTask>(_onRemoveTask);
    on<MarkAsFavorateOrUnFavorateTask>(_onMarkAsFavorateOrUnFAvorate);
    on<EditTaskEvent>(_onEditTaskEvent);
    on<RestoreTaskEvent>(_onRestoreTask);

    on<DeleteallTaskEvent>(_onDeleteAllTask);
  }

  //_onAddTask method
  void _onAddTask(addTask event, Emitter<TaskState> emit) {
    final state = this.state;

    emit(TaskState(
        pendingTasks: List.from(state.pendingTasks)..add(event.task),
        completedTasks: state.completedTasks,
        favorateTasks: state.favorateTasks,
        removedTasks: state.removedTasks));
  }

//_onUpdateTask method
  void _onUpdateTask(updateTask event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;

    List<Task> pendingTasks = state.pendingTasks;
    List<Task> completedTasks = state.completedTasks;
    List<Task> favorateTasks = state.favorateTasks;

    if (task.isDone == false) {
      if (task.isFavorate == false) {
        pendingTasks = List.from(pendingTasks)..remove(task);
        completedTasks.insert(0, task.copyWith(isDone: true));
      } else {
        var taskindex = favorateTasks.indexOf(task);
        pendingTasks = List.from(pendingTasks)..remove(task);
        completedTasks.insert(0, task.copyWith(isDone: true));
        favorateTasks = List.from(favorateTasks)
          ..remove(task)
          ..insert(taskindex, task.copyWith(isDone: true));
      }
    } else {
      if (task.isFavorate == false) {
        completedTasks = List.from(completedTasks)..remove(task);
        pendingTasks = List.from(pendingTasks)
          ..insert(0, task.copyWith(isDone: false));
      } else {
        var taskindex = favorateTasks.indexOf(task);
        completedTasks = List.from(completedTasks)..remove(task);
        pendingTasks = List.from(pendingTasks)
          ..insert(0, task.copyWith(isDone: false));
        favorateTasks = List.from(favorateTasks)
          ..remove(task)
          ..insert(taskindex, task.copyWith(isDone: false));
      }
    }

    emit(TaskState(
        pendingTasks: pendingTasks,
        completedTasks: completedTasks,
        favorateTasks: state.favorateTasks,
        removedTasks: state.removedTasks));
  }

//_onDeleteTask method
  void _onDeleteTask(deleteTask event, Emitter<TaskState> emit) {
    final state = this.state;

    emit(TaskState(
        pendingTasks: state.pendingTasks,
        completedTasks: state.completedTasks,
        favorateTasks: state.favorateTasks,
        removedTasks: List.from(state.removedTasks)..remove(event.task)));
  }

//_onRemoveTask method
  void _onRemoveTask(removeTask event, Emitter<TaskState> emit) {
    final state = this.state;

    emit(TaskState(
        pendingTasks: List.from(state.pendingTasks)..remove(event.task),
        completedTasks: List.from(state.completedTasks)..remove(event.task),
        favorateTasks: List.from(state.favorateTasks)..remove(event.task),
        removedTasks: List.from(state.removedTasks)
          ..add(event.task.copyWith(isDeleted: true))));
  }

  //_onMarkAsFavorateOrUnFAvorate
  void _onMarkAsFavorateOrUnFAvorate(
      MarkAsFavorateOrUnFavorateTask event, Emitter<TaskState> emit) {
    final state = this.state;

    List<Task> pendingTasks = state.pendingTasks;
    List<Task> completedTasks = state.completedTasks;
    List<Task> favorateTasks = state.favorateTasks;

    if (event.task.isDone == false) {
      if (event.task.isFavorate == false) {
        var taskIndex = pendingTasks.indexOf(event.task);
        pendingTasks = List.from(pendingTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorate: true));
        favorateTasks.insert(0, event.task.copyWith(isFavorate: true));
      } else {
        var taskIndex = pendingTasks.indexOf(event.task);
        pendingTasks = List.from(pendingTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorate: false));
        favorateTasks.remove(event.task);
      }
    } else {
      if (event.task.isFavorate == false) {
        var taskIndex = completedTasks.indexOf(event.task);
        completedTasks = List.from(completedTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorate: true));
        favorateTasks.insert(0, event.task.copyWith(isFavorate: true));
      } else {
        var taskIndex = completedTasks.indexOf(event.task);
        completedTasks = List.from(completedTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorate: false));
        favorateTasks.remove(event.task);
      }
    }
    emit(TaskState(
      pendingTasks: pendingTasks,
      completedTasks: completedTasks,
      favorateTasks: favorateTasks,
      removedTasks: state.removedTasks,
    ));
  }

  //_onEditTaskEvent
  void _onEditTaskEvent(EditTaskEvent event, Emitter<TaskState> emit) {
    final state = this.state;

    List<Task> favorateTasks = state.favorateTasks;

    if (event.oldtask.isFavorate == true) {
      favorateTasks
        ..remove(event.oldtask)
        ..insert(0, event.newtask);
    }

    emit(TaskState(
      pendingTasks: List.from(state.pendingTasks)
        ..remove(event.oldtask)
        ..insert(0, event.newtask),
      completedTasks: state.completedTasks..remove(event.oldtask),
      favorateTasks: favorateTasks,
      removedTasks: state.removedTasks,
    ));
  }

//_onRestoreTask
  void _onRestoreTask(RestoreTaskEvent event, Emitter<TaskState> emit) {
    final state = this.state;

    emit(TaskState(
        removedTasks: List.from(state.removedTasks)..remove(event.task),
        pendingTasks: List.from(state.pendingTasks)
          ..insert(
              0,
              event.task.copyWith(
                isDeleted: false,
                isDone: false,
                isFavorate: false,
              )),
        completedTasks: state.completedTasks,
        favorateTasks: state.favorateTasks));
  }

  //_onDeleteAllTask
  void _onDeleteAllTask(DeleteallTaskEvent event, Emitter<TaskState> emit) {
    final state = this.state;

    emit(TaskState(
      removedTasks: List.from(state.removedTasks)..clear(),
      pendingTasks: state.pendingTasks,
      completedTasks: state.completedTasks,
      favorateTasks: state.favorateTasks,
    ));
  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    return TaskState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return state.toMap();
  }
}
