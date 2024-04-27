import 'package:extended_text/extended_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gado_certo_todo_list/models/task.dart';
import 'package:gado_certo_todo_list/shared/widgets/task_tile/task_tile_store.dart';
import 'package:intl/intl.dart';

enum TaskType { list, card }

class TaskTile extends StatelessWidget {
  final TaskType taskType;
  final Task task;
  const TaskTile({super.key, this.taskType = TaskType.list, required this.task});

  @override
  Widget build(BuildContext context) {
    TaskTileController controller = TaskTileController(task: task);
    if (taskType == TaskType.list) {
      return IntrinsicWidth(
        child: Material(
          elevation: 2,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(color: Colors.grey[100]),
            child: Row(
              children: [
                Observer(builder: (_) {
                  return Checkbox(
                    activeColor: const Color(0xff48b02c),
                    value: controller.pending,
                    onChanged: (v) {
                      controller.toggleCheck(v);
                      if (v != null && v) {}
                    },
                    side: const BorderSide(width: 1.4, color: Colors.grey),
                    shape: const CircleBorder(),
                  );
                }),
                Expanded(
                  child: ExtendedText(
                    task.title,
                    joinZeroWidthSpace: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  children: [
                    Text(
                      DateFormat("HH:mm").format(task.sysCreationDate!),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat("dd/MM/yyyy").format(task.sysCreationDate!),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 10),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }
    return const Placeholder();
  }
}
