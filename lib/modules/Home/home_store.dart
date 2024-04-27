import 'package:gado_certo_todo_list/models/task.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  ObservableList<Task> tasks = <Task>[
    Task(
      id: 1,
      status: TaskStatus.pending,
      sysCreationDate: DateTime.now(),
      startDate: DateTime.now().add(const Duration(hours: 2)),
      title:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
    )
  ].asObservable();

  @action
  setTasks(List<Task> value) => tasks = value.asObservable();
}
