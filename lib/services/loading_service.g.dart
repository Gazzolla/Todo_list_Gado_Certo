// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loading_service.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoadingBarService on _LoadingBarServiceBase, Store {
  late final _$showLoadingAtom =
      Atom(name: '_LoadingBarServiceBase.showLoading', context: context);

  @override
  bool get showLoading {
    _$showLoadingAtom.reportRead();
    return super.showLoading;
  }

  @override
  set showLoading(bool value) {
    _$showLoadingAtom.reportWrite(value, super.showLoading, () {
      super.showLoading = value;
    });
  }

  late final _$_LoadingBarServiceBaseActionController =
      ActionController(name: '_LoadingBarServiceBase', context: context);

  @override
  dynamic showHideLoading(bool value) {
    final _$actionInfo = _$_LoadingBarServiceBaseActionController.startAction(
        name: '_LoadingBarServiceBase.showHideLoading');
    try {
      return super.showHideLoading(value);
    } finally {
      _$_LoadingBarServiceBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void start() {
    final _$actionInfo = _$_LoadingBarServiceBaseActionController.startAction(
        name: '_LoadingBarServiceBase.start');
    try {
      return super.start();
    } finally {
      _$_LoadingBarServiceBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stop() {
    final _$actionInfo = _$_LoadingBarServiceBaseActionController.startAction(
        name: '_LoadingBarServiceBase.stop');
    try {
      return super.stop();
    } finally {
      _$_LoadingBarServiceBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showLoading: ${showLoading}
    ''';
  }
}
