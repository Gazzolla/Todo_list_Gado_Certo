import 'package:extended_text/extended_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gado_certo_todo_list/models/task.dart';
import 'package:gado_certo_todo_list/modules/Item/item_page.dart';
import 'package:gado_certo_todo_list/services/api_Service.dart';
import 'package:gado_certo_todo_list/shared/widgets/task_tile/task_tile_store.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';

enum TaskType { list, card }

class TaskTile extends StatelessWidget {
  final TaskType taskType;
  final Task task;
  final Function updateTasks;
  final Color? color;
  const TaskTile({super.key, this.taskType = TaskType.list, required this.task, required this.updateTasks, this.color = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    TaskTileController controller = TaskTileController(task: task);
    if (taskType == TaskType.list) {
      return IntrinsicWidth(
        child: Material(
          elevation: 2,
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => TodoItem(task: task),
              ));
            },
            child: Container(
              color: color,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  Observer(builder: (_) {
                    return Checkbox(
                      activeColor: const Color(0xff48b02c),
                      value: controller.complete,
                      onChanged: (v) {
                        if (v != null && v) {
                          controller.toggleCheck(v);
                          ApiService.post("/todos/${task.id}/complete", data: {}).then((value) {
                            QuickAlert.show(context: context, type: QuickAlertType.success, text: "Tarefa Concluida com Sucesso!", title: "Parabéns");
                            updateTasks();
                          }).catchError((error) {
                            QuickAlert.show(context: context, type: QuickAlertType.error, text: "Erro ao Concluir Tarefa", title: "Atenção");
                          });
                        } else {
                          QuickAlert.show(context: context, type: QuickAlertType.info, text: "Infelizmente ainda não é possivel alterar o status para pendente", title: "Atenção");
                        }
                      },
                      side: const BorderSide(width: 1.4, color: Colors.grey),
                      shape: const CircleBorder(),
                    );
                  }),
                  Expanded(
                    child: Tooltip(
                      message: task.title,
                      child: ExtendedText(
                        task.title,
                        joinZeroWidthSpace: true,
                        overflow: TextOverflow.ellipsis,
                      ),
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
        ),
      );
    }
    return const Placeholder();
  }
}
