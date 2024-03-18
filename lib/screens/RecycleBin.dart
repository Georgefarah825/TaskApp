import 'package:flutter/material.dart';
import 'package:taskapp/blocs/bloc/bloc_exports.dart';

import '../widgets/MyDrawer.dart';
import '../widgets/TaslListWidget.dart';

class RecycleBinScreen extends StatefulWidget {
  const RecycleBinScreen({Key? key}) : super(key: key);

  static const id = 'recycle_bin';

  @override
  State<RecycleBinScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<RecycleBinScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
      List<Task> tasklist = state.pendingTasks;

      return BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          return Scaffold(
            drawer: const MyDrawer(),
            appBar: AppBar(
              title: const Text('Recycle Bin'),
              actions: [
                PopupMenuButton(
                    itemBuilder: (context) => [
                          PopupMenuItem(
                              onTap: () => context
                                  .read<TaskBloc>()
                                  .add(DeleteallTaskEvent()),
                              child: TextButton.icon(
                                  onPressed: null,
                                  icon: const Icon(Icons.delete_forever),
                                  label: const Text('Delete all tasks')))
                        ])
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Chip(
                    backgroundColor:
                        state.removedTasks.isEmpty ? Colors.green : Colors.red,
                    label: Text(
                      state.removedTasks.isEmpty
                          ? 'Recycle bin is empty '
                          : 'You Have Deleted ${state.removedTasks.length} Tasks  :',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Tasklistview(tasklist: state.removedTasks)
              ],
            ),
          );
        },
      );
    });
  }
}
