import 'package:flutter/material.dart';
import 'package:taskapp/blocs/bloc/bloc_exports.dart';

import '../widgets/TaslListWidget.dart';

class PendingTasksScreen extends StatelessWidget {
  const PendingTasksScreen({Key? key}) : super(key: key);
  static const id = 'task_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
      List<Task> tasklist = state.pendingTasks;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Chip(
                backgroundColor:
                    state.pendingTasks.isEmpty ? Colors.red : Colors.cyan,
                label: Text(
                  state.pendingTasks.isEmpty
                      ? 'No Tasks For Today Add one '
                      : ' You Have ${state.pendingTasks.length} Tasks To do For Today :',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Tasklistview(tasklist: tasklist)
        ],
      );
    });
  }
}
