import 'package:flutter/material.dart';
import 'package:taskapp/screens/Completed_task_screen.dart';
import 'package:taskapp/screens/pendingtasks_screen.dart';
import 'package:taskapp/widgets/MyDrawer.dart';

import '../widgets/AddTaskScreenWidget.dart';
import 'Favorate_task_screen.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({super.key});

  static const id = 'tabsscreen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _selectedPageIndex = 0;

  final List<Map<String, dynamic>> _pageDetails = [
    {'pageName': PendingTasksScreen(), 'title': 'Pending Tasks'},
    {'pageName': CompletedTaskScreen(), 'title': 'Completed Tasks'},
    {'pageName': FavorateTasksScreen(), 'title': 'Favorate Tasks'}
  ];

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleChildScrollView(
                child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const AddTaskScreen(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(_pageDetails[_selectedPageIndex]['title']),
        actions: _selectedPageIndex == 0
            ? [
                IconButton(
                  color: Colors.white,
                  onPressed: () => _addTask(context),
                  icon: const Icon(Icons.add),
                )
              ]
            : null,
      ),
      body: _pageDetails[_selectedPageIndex]['pageName'],
      floatingActionButton: _selectedPageIndex == 0
          ? FloatingActionButton(
              onPressed: () => _addTask(context),
              tooltip: 'Add Task',
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPageIndex,
          onTap: (index) {
            setState(() {
              _selectedPageIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                label: 'Panding Tasks',
                icon: Icon(Icons.incomplete_circle_sharp)),
            BottomNavigationBarItem(
                label: 'Completed Tasks', icon: Icon(Icons.done)),
            BottomNavigationBarItem(
                label: 'Favorate Tasks', icon: Icon(Icons.favorite)),
          ]),
    );
  }
}
