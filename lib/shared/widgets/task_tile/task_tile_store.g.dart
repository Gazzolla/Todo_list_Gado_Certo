// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_tile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskTileController on _TaskTileControllerBase, Store {
  late final _$pendingAtom =
      Atom(name: '_TaskTileControllerBase.pending', context: context);

  @override
  bool get pending {
    _$pendingAtom.reportRead();
    return super.pending;
  }

  @override
  set pending(bool value) {
    _$pendingAtom.reportWrite(value, super.pending, () {
      super.pending = value;
    });
  }

  late final _$_TaskTileControllerBaseActionController =
      ActionController(name: '_TaskTileControllerBase', context: context);

  @override
  void toggleCheck(bool? value) {
    final _$actionInfo = _$_TaskTileControllerBaseActionController.startAction(
        name: '_TaskTileControllerBase.toggleCheck');
    try {
      return super.toggleCheck(value);
    } finally {
      _$_TaskTileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pending: ${pending}
    ''';
  }
}
