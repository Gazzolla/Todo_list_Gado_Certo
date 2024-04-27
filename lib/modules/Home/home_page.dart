import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gado_certo_todo_list/models/task.dart';
import 'package:gado_certo_todo_list/modules/Home/home_store.dart';
import 'package:gado_certo_todo_list/shared/widgets/task_tile/task_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = HomeController();
    return Scaffold(
      body: SafeArea(
        child: Observer(builder: (_) {
          return Column(
            children: [
              for (Task task in controller.tasks) TaskTile(task: task),
            ],
          );
        }),
      ),
    );
  }
}
