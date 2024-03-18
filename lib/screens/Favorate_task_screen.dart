import 'package:flutter/material.dart';
import 'package:taskapp/blocs/bloc/bloc_exports.dart';

import '../widgets/TaslListWidget.dart';

class FavorateTasksScreen extends StatelessWidget {
  const FavorateTasksScreen({Key? key}) : super(key: key);
  static const id = 'favorate_task_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
      List<Task> tasklist = state.favorateTasks;

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
                  tasklist.isEmpty
                      ? 'No Favorate Tasks '
                      : ' You Have ${tasklist.length} Favorate Tasks ',
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
