// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_tile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskTileController on _TaskTileControllerBase, Store {
  late final _$completeAtom =
      Atom(name: '_TaskTileControllerBase.complete', context: context);

  @override
  bool get complete {
    _$completeAtom.reportRead();
    return super.complete;
  }

  @override
  set complete(bool value) {
    _$completeAtom.reportWrite(value, super.complete, () {
      super.complete = value;
    });
  }

  late final _$colorAtom =
      Atom(name: '_TaskTileControllerBase.color', context: context);

  @override
  Color get color {
    _$colorAtom.reportRead();
    return super.color;
  }

  bool _colorIsInitialized = false;

  @override
  set color(Color value) {
    _$colorAtom.reportWrite(value, _colorIsInitialized ? super.color : null,
        () {
      super.color = value;
      _colorIsInitialized = true;
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
  dynamic setColor(Color value) {
    final _$actionInfo = _$_TaskTileControllerBaseActionController.startAction(
        name: '_TaskTileControllerBase.setColor');
    try {
      return super.setColor(value);
    } finally {
      _$_TaskTileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
complete: ${complete},
color: ${color}
    ''';
  }
}
