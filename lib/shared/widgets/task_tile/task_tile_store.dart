import 'package:flutter/material.dart';
import 'package:gado_certo_todo_list/models/task.dart';
import 'package:mobx/mobx.dart';
part 'task_tile_store.g.dart';

class TaskTileController = _TaskTileControllerBase with _$TaskTileController;

abstract class _TaskTileControllerBase with Store {
  _TaskTileControllerBase({required Task task}) {
    color = task.color;
  }

  @observable
  bool pending = false;

  @action
  void toggleCheck(bool? value) => pending = value ?? !pending;

  @observable
  late Color color;

  @action
  setColor(Color value) => color = value;
}
