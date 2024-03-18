import 'package:flutter/material.dart';

import '../blocs/bloc/bloc_exports.dart';

class EditTaskScreen extends StatelessWidget {
  final Task oldTask;
  const EditTaskScreen({
    Key? key,
    required this.oldTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titlecontroller =
        TextEditingController(text: oldTask.title);
    TextEditingController descriptioncontroller =
        TextEditingController(text: oldTask.description);

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          const Text(
            'Edit Task',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 10),
            child: TextField(
              autofocus: true,
              decoration: const InputDecoration(
                label: Text('title'),
                border: OutlineInputBorder(),
              ),
              controller: titlecontroller,
            ),
          ),
          TextField(
            minLines: 3,
            maxLines: 5,
            autofocus: true,
            decoration: const InputDecoration(
              label: Text('description'),
              border: OutlineInputBorder(),
            ),
            controller: descriptioncontroller,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    var editedtask = Task(
                        id: oldTask.id,
                        isFavorate: oldTask.isFavorate,
                        isDone: false,
                        title: titlecontroller.text,
                        date: DateTime.now().toString(),
                        description: descriptioncontroller.text);
                    context.read<TaskBloc>().add(
                        EditTaskEvent(oldtask: oldTask, newtask: editedtask));
                    Navigator.pop(context);
                  },
                  child: const Text('Save')),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel')),
            ],
          ),
        ]),
      ),
    );
  }
}
