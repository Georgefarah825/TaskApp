import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskapp/widgets/EditTaskScreen.dart';
import 'package:taskapp/widgets/popUpMenuButton.dart';

import '../blocs/bloc/bloc_exports.dart';

class TaskLisTile extends StatelessWidget {
  const TaskLisTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  void _removeOrDeleteTask(BuildContext ctx, Task task) {
    task.isDeleted!
        ? ctx.read<TaskBloc>().add(deleteTask(task: task))
        : ctx.read<TaskBloc>().add(removeTask(task: task));
  }

  void _EditTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleChildScrollView(
                child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: EditTaskScreen(
                oldTask: task,
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                task.isFavorate == false
                    ? const Icon(Icons.star_outline)
                    : const Icon(Icons.star),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(task.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 18,
                              decoration: task.isDone!
                                  ? TextDecoration.lineThrough
                                  : null)),
                      Text(DateFormat()
                          .add_yMMMd()
                          .add_ms()
                          .format(DateTime.parse(task.date)))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: task.isDone,
                onChanged: task.isDeleted == false
                    ? (value) {
                        context.read<TaskBloc>().add(updateTask(task: task));
                      }
                    : null,
              ),
              popUpMenuButton(
                task: task,
                liskeOrdislikeCallBack: () => context
                    .read<TaskBloc>()
                    .add(MarkAsFavorateOrUnFavorateTask(task: task)),
                cancellordeleteCallBack: () =>
                    _removeOrDeleteTask(context, task),
                editTaskCallBack: () {
                  Navigator.of(context).pop();
                  _EditTask(context);
                },
                restoreTaskCallBack: () =>
                    context.read<TaskBloc>().add(RestoreTaskEvent(task: task)),
              )
            ],
          )
        ],
      ),
    );
  }
}




 //ListTile(
     // title: Text(task.title,
       ///   overflow: TextOverflow.ellipsis,
       ///   style: TextStyle(
            //  decoration: task.isDone! ? TextDecoration.lineThrough : null)),
    //  trailing: task.isDeleted == false
       //   ? Checkbox(
          //   onChanged: task.isDeleted == false
            //      ? (value) {
            //          context.read<TaskBloc>().add(updateTask(task: task));
            //        }
         //         : null,
         //     value: task.isDone,
          //  )
       //   : null,
   //   onLongPress: () => _removeOrDeleteTask(context, task),
  //  );