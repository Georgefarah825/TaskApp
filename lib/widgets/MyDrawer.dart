import 'package:flutter/material.dart';
import 'package:taskapp/blocs/bloc/bloc_exports.dart';
import 'package:taskapp/screens/RecycleBin.dart';
import '../screens/tabs_screen.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: const Center(
              child: Icon(
                Icons.task_alt_rounded,
                size: 100,
                color: Colors.white,
              ),
            ),
          ),
          BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
            return GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed(TabsScreen.id),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: const Icon(
                    Icons.folder_special_outlined,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Pending | Completed',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Text(
                      '${state.pendingTasks.length} | ${state.completedTasks.length}',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            );
          }),
          const Divider(
            color: Colors.grey,
          ),
          BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushReplacementNamed(RecycleBinScreen.id),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: const Icon(
                      Icons.recycling_outlined,
                      color: Colors.white,
                    ),
                    title: const Text('Recycle Bin',
                        style: TextStyle(color: Colors.white)),
                    trailing: Text('${state.removedTasks.length}',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              );
            },
          ),
          BlocBuilder<ThemeBlocBloc, ThemeBlocState>(
            builder: (context, state) {
              return Switch(
                  value: state.isDarkMode,
                  onChanged: (newValue) {
                    newValue
                        ? context.read<ThemeBlocBloc>().add(LightMode())
                        : context.read<ThemeBlocBloc>().add(DarkMode());
                  });
            },
          )
        ],
      )),
    );
  }
}
