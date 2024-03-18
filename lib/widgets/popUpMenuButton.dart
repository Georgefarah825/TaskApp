// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:taskapp/blocs/bloc/bloc_exports.dart';

class popUpMenuButton extends StatelessWidget {
  Task task;
  VoidCallback cancellordeleteCallBack;
  VoidCallback liskeOrdislikeCallBack;
  VoidCallback editTaskCallBack;
  VoidCallback restoreTaskCallBack;

  popUpMenuButton({
    Key? key,
    required this.task,
    required this.cancellordeleteCallBack,
    required this.liskeOrdislikeCallBack,
    required this.editTaskCallBack,
    required this.restoreTaskCallBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: task.isDeleted == false
          ? (((context) => [
                PopupMenuItem(
                  onTap: null,
                  child: TextButton.icon(
                      onPressed: editTaskCallBack,
                      icon: const Icon(Icons.edit),
                      label: const Text('Edit')),
                ),
                PopupMenuItem(
                    onTap: liskeOrdislikeCallBack,
                    child: TextButton.icon(
                        onPressed: null,
                        icon: task.isFavorate == false
                            ? const Icon(Icons.bookmark_add_outlined)
                            : const Icon(Icons.bookmark_remove),
                        label: task.isFavorate == false
                            ? const Text('Add to\n BookMark')
                            : const Text('Remove from\n BookMark'))),
                PopupMenuItem(
                    onTap: cancellordeleteCallBack,
                    child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.delete),
                        label: const Text('Delete'))),
              ]))
          : (context) => [
                PopupMenuItem(
                    onTap: restoreTaskCallBack,
                    child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.restore_from_trash),
                        label: const Text('Restore'))),
                PopupMenuItem(
                    onTap: cancellordeleteCallBack,
                    child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.delete_forever),
                        label: const Text('Delete for ever'))),
              ],
    );
  }
}
