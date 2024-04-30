// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<String>? _$ocultTasksQuantityComputed;

  @override
  String get ocultTasksQuantity => (_$ocultTasksQuantityComputed ??=
          Computed<String>(() => super.ocultTasksQuantity,
              name: '_HomeControllerBase.ocultTasksQuantity'))
      .value;
  Computed<List<Task>>? _$ordenedTasksComputed;

  @override
  List<Task> get ordenedTasks =>
      (_$ordenedTasksComputed ??= Computed<List<Task>>(() => super.ordenedTasks,
              name: '_HomeControllerBase.ordenedTasks'))
          .value;

  late final _$searchStringAtom =
      Atom(name: '_HomeControllerBase.searchString', context: context);

  @override
  String get searchString {
    _$searchStringAtom.reportRead();
    return super.searchString;
  }

  @override
  set searchString(String value) {
    _$searchStringAtom.reportWrite(value, super.searchString, () {
      super.searchString = value;
    });
  }

  late final _$tasksAtom =
      Atom(name: '_HomeControllerBase.tasks', context: context);

  @override
  ObservableList<Task> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(ObservableList<Task> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  late final _$showCompletedTasksAtom =
      Atom(name: '_HomeControllerBase.showCompletedTasks', context: context);

  @override
  bool get showCompletedTasks {
    _$showCompletedTasksAtom.reportRead();
    return super.showCompletedTasks;
  }

  @override
  set showCompletedTasks(bool value) {
    _$showCompletedTasksAtom.reportWrite(value, super.showCompletedTasks, () {
      super.showCompletedTasks = value;
    });
  }

  late final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase', context: context);

  @override
  dynamic setSearchString(String value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setSearchString');
    try {
      return super.setSearchString(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTasks(List<Task> value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setTasks');
    try {
      return super.setTasks(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic showCompleteds() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.showCompleteds');
    try {
      return super.showCompleteds();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchString: ${searchString},
tasks: ${tasks},
showCompletedTasks: ${showCompletedTasks},
ocultTasksQuantity: ${ocultTasksQuantity},
ordenedTasks: ${ordenedTasks}
    ''';
  }
}
