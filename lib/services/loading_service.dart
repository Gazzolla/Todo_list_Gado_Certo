import 'package:mobx/mobx.dart';
part 'loading_service.g.dart';

// ignore: library_private_types_in_public_api
class LoadingBarService = _LoadingBarServiceBase with _$LoadingBarService;

abstract class _LoadingBarServiceBase with Store {
  @observable
  bool showLoading = false;

  @action
  showHideLoading(bool value) => showLoading = value;

  @action
  void start() => showLoading = true;

  @action
  void stop() => showLoading = false;
}
