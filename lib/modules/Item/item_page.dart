// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:gado_certo_todo_list/models/task.dart';
import 'package:gado_certo_todo_list/services/api_Service.dart';
import 'package:quickalert/quickalert.dart';
import 'package:reactive_forms/reactive_forms.dart';

class TodoItem extends StatefulWidget {
  final Task? task;
  const TodoItem({super.key, this.task});

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  late FormControl taskControl;

  @override
  void initState() {
    taskControl = FormControl<String>(value: widget.task?.title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (widget.task == null) {
            ApiService.post('/todos', data: {"task": taskControl.value}).then((response) async {
              await QuickAlert.show(context: context, type: QuickAlertType.success, text: "Tarefa criada com Sucesso!", title: "Parabéns");

              Navigator.of(context).pushReplacementNamed('home');
            }).catchError((error) {
              QuickAlert.show(context: context, type: QuickAlertType.error, text: "Erro ao Criar Tarefa", title: "Atenção");
            });
          } else {
            ApiService.put('/todos/${widget.task!.id}', data: {"task": taskControl.value}).then((response) async {
              await QuickAlert.show(context: context, type: QuickAlertType.success, text: "Tarefa Atualizada com Sucesso!", title: "Parabéns");
              Navigator.of(context).pushReplacementNamed('home');
            }).catchError((error) {
              QuickAlert.show(context: context, type: QuickAlertType.error, text: "Erro ao Atualizar Tarefa", title: "Atenção");
            });
          }
        },
        child: Icon(taskControl.value != null ? Icons.edit : Icons.save),
      ),
      body: Container(
        color: Colors.lightBlue,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                color: Colors.lightBlue,
                height: 50,
                width: double.infinity,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('home');
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListView(
                      children: [
                        ReactiveTextField(
                          formControl: taskControl,
                          decoration: const InputDecoration(
                            labelText: 'Task',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
