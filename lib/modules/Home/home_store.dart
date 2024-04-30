import 'package:flutter/material.dart';
import 'package:gado_certo_todo_list/models/task.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  TextEditingController searchController = TextEditingController();

  @observable
  String searchString = "";

  @action
  setSearchString(String value) => searchString = value;

  @observable
  ObservableList<Task> tasks = <Task>[].asObservable();

  @action
  setTasks(List<Task> value) => tasks = value.asObservable();

  @observable
  bool showCompletedTasks = false;

  @action
  showCompleteds() => showCompletedTasks = !showCompletedTasks;

  @computed
  String get ocultTasksQuantity {
    List<Task> sortedTasks = tasks.toList();
    sortedTasks.sort((a, b) => a.sysCreationDate!.compareTo(b.sysCreationDate!));
    if (searchString.isNotEmpty) {
      int amount = sortedTasks.where((x) => x.status == TaskStatus.completed && x.title.toLowerCase().contains(searchString.toLowerCase())).length;
      if (amount > 0) return "($amount)";
    }
    return "";
  }

  @computed
  List<Task> get ordenedTasks {
    List<Task> sortedTasks = tasks.toList();
    sortedTasks.sort((a, b) => a.sysCreationDate!.compareTo(b.sysCreationDate!));
    return sortedTasks
        .where((x) => x.title.toLowerCase().contains(searchString.toLowerCase()) && (x.status == TaskStatus.pending || (showCompletedTasks && x.status == TaskStatus.completed)))
        .toList();
  }
}
