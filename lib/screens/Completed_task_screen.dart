import 'package:flutter/material.dart';
import 'package:taskapp/blocs/bloc/bloc_exports.dart';

import '../widgets/TaslListWidget.dart';

class CompletedTaskScreen extends StatelessWidget {
  const CompletedTaskScreen({Key? key}) : super(key: key);
  static const id = 'completed_task_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
      List<Task> tasklist = state.completedTasks;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Chip(
                backgroundColor: tasklist.isEmpty ? Colors.red : Colors.cyan,
                label: Text(
                  tasklist.isEmpty
                      ? 'No Completed Tasks  '
                      : ' You Have Completed ${tasklist.length} Tasks :',
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
