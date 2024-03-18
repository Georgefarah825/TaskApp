import 'package:flutter/material.dart';
import 'package:taskapp/blocs/bloc/bloc_exports.dart';

import '../models/task_model.dart';
import 'TaskListTileWidgets.dart';

class Tasklistview extends StatelessWidget {
  const Tasklistview({
    Key? key,
    required this.tasklist,
  }) : super(key: key);

  final List<Task> tasklist;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: tasklist
              .map((task) => ExpansionPanelRadio(
                  value: task.id,
                  headerBuilder: (context, isOpen) => TaskLisTile(task: task),
                  body: ListTile(
                    title: SelectableText.rich(TextSpan(children: [
                      const TextSpan(
                          text: 'Title:\n ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: task.title),
                      const TextSpan(
                          text: '\n\nDescription:\n',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: task.description)
                    ])),
                  )))
              .toList(),
        ),
      ),
    );
  }
}
 //Expanded(
     // child: ListView.builder(
      //    itemCount: widget.tasklist.length,
         // itemBuilder: (context, index) {
         //   var task = widget.tasklist[index];

         //   return TaskLisTile(task: task);
       //   }),
   // );