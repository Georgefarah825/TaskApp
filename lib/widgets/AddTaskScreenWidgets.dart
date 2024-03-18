import 'package:flutter/material.dart';
import 'package:taskapp/servcies/guide_id_generator.dart';

import '../blocs/bloc/bloc_exports.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titlecontroller = TextEditingController();
    TextEditingController descriptioncontroller = TextEditingController();

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          const Text(
            'Add Task',
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
                    var task = Task(
                        id: GUIDGen.generate(),
                        title: titlecontroller.text,
                        date: DateTime.now().toString(),
                        description: descriptioncontroller.text);
                    context.read<TaskBloc>().add(addTask(task: task));
                    Navigator.pop(context);
                  },
                  child: const Text('Add')),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('cancel')),
            ],
          ),
        ]),
      ),
    );
  }
}
