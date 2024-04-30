import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gado_certo_todo_list/models/task.dart';
import 'package:gado_certo_todo_list/modules/Home/home_store.dart';
import 'package:gado_certo_todo_list/modules/Item/item_page.dart';
import 'package:gado_certo_todo_list/services/api_Service.dart';
import 'package:gado_certo_todo_list/shared/widgets/task_tile/task_tile.dart';
import 'package:quickalert/quickalert.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = HomeController();

    updateTasks() {
      ApiService.get("/todos").then((response) {
        try {
          controller.setTasks(List.from(response.data.map((x) => Task.fromJSON(x))));

          ApiService.get("/todos?status=complete").then((response) {
            controller.tasks.addAll(List.from(response.data.map((x) => Task.fromJSON(x))));
          });
        } catch (e) {
          QuickAlert.show(context: context, type: QuickAlertType.error, text: "Erro ao Obter as Tarefas", title: "Atenção");
        }
      }).catchError((error) {
        QuickAlert.show(context: context, type: QuickAlertType.error, text: "Erro ao Obter as Tarefas", title: "Atenção");
      });
    }

    updateTasks();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const TodoItem(),
          ));
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          updateTasks();
        },
        child: SafeArea(
          child: Observer(builder: (_) {
            return SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Observer(
                      builder: (_) {
                        return Column(
                          children: [
                            const SizedBox(height: 20),
                            FractionallySizedBox(
                              widthFactor: 0.5,
                              child: Material(
                                borderRadius: BorderRadius.circular(10),
                                elevation: 2,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey[300]!)),
                                  child: TextField(
                                    onChanged: (value) {
                                      controller.setSearchString(value);
                                    },
                                    controller: controller.searchController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Pesquise a Atividade",
                                        hintStyle: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w400),
                                        suffix: InkWell(
                                          borderRadius: BorderRadius.circular(50),
                                          onTap: () {
                                            controller.searchController.clear();
                                            controller.setSearchString("");
                                          },
                                          child: const Icon(
                                            Icons.clear,
                                            size: 15,
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            if (controller.ordenedTasks.isEmpty && controller.ocultTasksQuantity.isEmpty) const Text("Não há Nenhuma Atividade a ser Exibida"),
                            for (var i = 0; i < controller.ordenedTasks.length; i++)
                              SizedBox(
                                key: UniqueKey(),
                                width: double.infinity,
                                child: TaskTile(
                                  task: controller.ordenedTasks[i],
                                  updateTasks: updateTasks,
                                  color: i % 2 == 0 ? Colors.grey[100] : null,
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Observer(builder: (_) {
                        return InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: controller.showCompleteds,
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.all(10),
                            child: Text(controller.showCompletedTasks ? "Ocultar Atividades Completas " : "Mostrar Atividades Completas ${controller.ocultTasksQuantity}"),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
